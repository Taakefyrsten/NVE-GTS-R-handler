# NveGTSRequesteR

An R package for bulk downloading gridded environmental time series from the
[NVE Grid Time Series (GTS) REST API](https://gts.nve.no/api/).

## Background

This R package simplfies downloading and loading GridTimeSeries from Norges vassdrags- og energidirektorat (NVE GTS) JSON data to a directory using R. It uses modern features such as httr2 and purrr to improve on the speed of handling such large datasets.

To make sure that the datasets don't eat up all the RAM on the users computer the process is batched and each batch is saved as a RDS file before the next one is loaded.

The package tries to follow Tidyverse and R-GIS standards.

## Why

NVEs GTS is pretty frequently used in Norway for historical and present gridded environmental data. I've personally used it in reporting and for research on a couple of occasions. My original implementation (in 2022) left a lot to be desired, it was very slow, and had a tendency to crash deleting all unsaved data. It was based on the examples made for Metrologisk Institutts REST API "Frost" (https://frost.met.no/r_example.html). After working a lot with R for a few years I was once again tasked with fetching GTS data, which I used as an opportunity to start a new project from scratch for downloading this kind of data. This implementation uses paralell processing and a modern packages for handeling the requests and is much faster, safer, and easier to use.

## Installation

```r
# Install from GitHub
devtools::install_github("Taakefyrsten/NVE-GTS-R-handler")
```

## Usage

### A list of points

The usual job: you have a handful of sites and want a time series for each.
Coordinates go in as a data frame with numeric `X` and `Y` columns in **UTM33N
metres** (EPSG:25833) — the only thing the API accepts. Any other columns are
ignored, so you can keep your site names alongside.

```r
library(NveGTSRequesteR)
library(future)

# Requests are network-bound, so a worker per core is a floor, not a ceiling.
# availableCores() respects container/HPC limits that detectCores() ignores.
plan(multisession, workers = parallelly::availableCores() - 1)

sites <- data.frame(
  site = c("upper_weir", "lower_weir", "ridge", "valley_floor"),
  X    = c(269390, 270420, 271980, 272510),
  Y    = c(6653390, 6654120, 6655870, 6656340)
)

# Daily mean temperature for 2023. Returns the folder it wrote to.
folder <- download_nve_gts(
  name            = "field_sites",
  coordinate_list = sites,
  first_date      = "2023-01-01",
  last_date       = "2023-12-31",
  layer           = "tm",
  batch_size      = nrow(sites)   # small job: fetch the lot in one sweep
)

folder
#> "field_sites_tm_2023-01-01_2023-12-31_x269-273_y6653-6656_4pts"

# A flat list, one element per point, in the order you supplied them
results <- load_and_bind_gts_from_folder(folder)
```

Results come back in the same order as the coordinates went in, so
`sites$site[i]` names `results[[i]]` and you can join your own metadata back on
by position.

Note `batch_size` above. It is both the memory ceiling and the resume
checkpoint, and requests run in parallel *within* a batch — so a batch smaller
than your worker pool leaves workers idle. The default of 100 is sized for
whole regions; for a job like this one, set it at or above your point count and
everything runs as a single parallel sweep.

### A whole area

For an area you need one request per 1 km grid cell, which means generating the
points yourself. This is where the default `batch_size` earns its keep.

```r
library(sf)

area <- read_sf("~/my_area.geojson")
st_crs(area)    # check what you actually have before assuming
st_bbox(area)   # UTM33N northings over Norway run roughly 6.45e6-7.95e6

# EPSG:25833 = ETRS89 / UTM zone 33N, the only CRS the NVE API accepts.
# ETRS89 UTM codes are 25800 + zone, so zone 32 = 25832, zone 35 = 25835.
# Most Norwegian data is already 25833; far-north and international sources
# often are not.
area_utm33 <- st_transform(area, crs = 25833)

# One point per 1 km grid cell whose centre falls inside the polygon
grid_points <- st_make_grid(area_utm33, cellsize = 1000, what = "centers") |>
  st_intersection(area_utm33) |>
  st_coordinates() |>
  as.data.frame() |>
  setNames(c("X", "Y"))

nrow(grid_points)   # your request count - look at it before downloading
#> [1] 4812

folder <- download_nve_gts(
  name            = "my_area",
  coordinate_list = grid_points,
  first_date      = "2023-01-01",
  last_date       = "2023-12-31",
  layer           = "tm",
  batch_size      = 100
)

folder
#> "my_area_tm_2023-01-01_2023-12-31_x269-412_y6653-6698_4812pts"

results <- load_and_bind_gts_from_folder(folder)
```

A run this size will eventually meet a flaky network. Rerun the identical call
and it skips the batches already on disk and fetches only what is missing.

### Either way

The folder name encodes the layer, the date range and the extent of the
coordinates, and a manifest inside it records the full request. A call whose
coordinates, dates or batch size differ from that manifest is refused rather
than resumed, so results from two different requests cannot end up mixed in
one folder.

`load_and_bind_gts_from_folder()` returns a **list**, not a data frame — each
element is one point's parsed JSON, with the values in `Data` and no timestamps
attached. See `vignette("downloading-nve-gts-data")` for the rest: reading the
layer metadata, handling failed requests and the `NoDataValue` sentinel, and
rectangling the list into a tibble.

## Functions

| Function | Description |
|---|---|
| `download_nve_gts()` | Fetch GTS data in parallel batches and save to disk; returns the folder name |
| `load_and_bind_gts_from_folder()` | Read a folder's batch `.rds` files into a single list, in coordinate order |
| `request_nve_gts()` | Perform a single GTS API request |
| `name_folder()` | Construct the folder name for a given request |
| `gts_folder_reset()` | Interactively delete all batch files in a folder |

## Data

| Object | Description |
|---|---|
| `VALID_GTS_LAYER_NAMES` | Character vector of all 78 valid layer short-codes |
| `gts_layers_full` | Full metadata list for every layer (Norwegian + English name, unit, resolution, first date) |

## Requirements

- R ≥ 4.1
- `httr2`, `furrr`, `purrr`
- A `future::plan()` set before calling `download_nve_gts()` for parallelism
  (falls back to sequential if no plan is set)
- `sf` and `parallelly` only for the workflow shown above, not by the package
  itself — you can pass coordinates as a plain data frame from any source

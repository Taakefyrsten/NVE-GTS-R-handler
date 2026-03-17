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

```r
library(NveGTSRequesteR)
library(future)

# Enable parallel processing
plan(multisession)

# Define coordinates (UTM33)
coords <- data.frame(
  X = c(269390, 270000),
  Y = c(6653390, 6654000)
)

# Download daily temperature for 2023
download_nve_gts(
  name            = "oslo_area",
  coordinate_list = coords,
  first_date      = "2023-01-01",
  last_date       = "2023-12-31",
  layer           = "tm"
)

# Load all batches back into R
results <- load_and_bind_gts_from_folder(
  name_folder("oslo_area", "tm")
)
```

## Functions

| Function | Description |
|---|---|
| `download_nve_gts()` | Fetch GTS data in parallel batches and save to disk |
| `load_and_bind_gts_from_folder()` | Read all batch `.rds` files from a folder into a single list |
| `request_nve_gts()` | Perform a single GTS API request |
| `name_folder()` | Construct the standard `<name>_<layer>` folder name |
| `gts_folder_reset()` | Interactively delete all batch files in a folder |

## Data

| Object | Description |
|---|---|
| `VALID_GTS_LAYER_NAMES` | Character vector of all 76 valid layer short-codes |
| `gts_layers_full` | Full metadata list for every layer (unit, resolution, first date) |

## Requirements

- R ≥ 4.1
- `httr2`, `furrr`, `purrr`
- A `future::plan()` set before calling `download_nve_gts()` for parallelism
  (falls back to sequential if no plan is set)

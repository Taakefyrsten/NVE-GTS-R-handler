# NveGTSRequesteR 2.0.0

## Breaking changes

Downloads used to be stored in a folder named `<name>_<layer>`. Because the
folder name said nothing about *which* coordinates or *which* dates were
requested, two different requests sharing a name and layer resolved to the same
folder — and since the resume logic skips any batch whose file already exists,
the second request silently inherited the first one's results. This release
closes that.

* `name_folder()` now requires the coordinates and the date range:
  `name_folder(name, layer, coordinate_list, first_date, last_date)`. Calls
  written for 1.x will error on the missing arguments.

* Folder names now describe the request, e.g.
  `my_area_tm_2023-01-01_2023-12-31_x269-412_y6653-6698_4812pts`. Coordinates
  appear as their bounding box rounded to whole kilometres, which is lossless
  to read against the 1 km GTS grid.

* Batch files are now named `batch_<i>_results.rds` inside that folder, rather
  than repeating the folder name. Indices are zero-padded.

* `download_nve_gts()` writes a manifest (`_gts_manifest.rds`) into the folder
  recording the layer, date range, batch size and the full coordinate vector.
  Every later call compares its request against that manifest and **aborts**
  if anything differs, naming the offending field. The folder name is a
  readable label; the manifest is what actually guarantees a folder holds one
  request. This matters because a bounding box identifies an extent, not a
  point set: a sparse transect and a clipped grid over the same polygon
  produce the same folder name, and only the manifest tells them apart.

* Folders written by 1.x have batch files but no manifest. `download_nve_gts()`
  refuses to resume into them rather than guessing what they contain; use a new
  `name` or clear them with `gts_folder_reset()`.

* `batch_size` is part of the manifest comparison. It sets the batch
  boundaries, so resuming with a different value would interleave two
  partitionings of the points into one file sequence.

## Bug fixes

* `load_and_bind_gts_from_folder()` returned points in the wrong order once a
  download exceeded nine batches: files were read in lexical order, so
  `..._10_results.rds` sorted before `..._2_results.rds`. Batches are now
  ordered by index, and the returned list matches the order of the coordinates
  originally passed to `download_nve_gts()`.

* `load_and_bind_gts_from_folder()` read *every* file in the folder and tried
  to `readRDS()` it. It now reads only files matching the batch pattern, so
  unrelated files in the folder no longer break the load.

* `VALID_GTS_LAYER_NAMES` and `gts_layers_full` were documented as having 76
  elements. Both have always had 78.

## New features

* `gts_layers_full` gains a `FullnameEN` field: an English name for every
  layer, with a plain-language gloss in parentheses where the term is jargon
  (`swe` → "Snow water equivalent (depth of water the snowpack would give if
  fully melted)"). This field is specific to this package and is **not**
  returned by the NVE API. Where NVE's Norwegian label is loose or disagrees
  with the layer code, the English name follows the quantity actually served.

* `download_nve_gts()` returns its folder name invisibly, so the download and
  load steps chain without reconstructing the name by hand:

  ```r
  folder  <- download_nve_gts(...)
  results <- load_and_bind_gts_from_folder(folder)
  ```

* `load_and_bind_gts_from_folder()` attaches the manifest to its result as the
  `"gts_manifest"` attribute, so loaded data carries the request that produced
  it.

* Arguments are validated up front: dates must be `"YYYY-MM-DD"`, `layer` must
  be a valid short-code, `X` and `Y` must be present, equal-length, non-empty
  and free of `NA`, and `name` must not contain a path separator.

* New vignette, `vignette("downloading-nve-gts-data")`, covering the full
  workflow including building a coordinate grid from a polygon.

# NveGTSRequesteR 1.0.1

* Fixed a `DESCRIPTION` issue.

# NveGTSRequesteR 1.0.0

* First release.

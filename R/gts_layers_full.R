#' Full metadata for all NVE GTS layers
#'
#' A list of lists, each describing one layer available through the NVE Grid
#' Time Series API. Provides human-readable names, units, time resolution, and
#' the earliest date available for every layer in
#' \code{\link{VALID_GTS_LAYER_NAMES}}.
#'
#' @format A list with 78 elements. Each element is a named list with the
#'   following fields:
#' \describe{
#'   \item{Name}{Character. The layer short-code used in API requests (matches
#'     an entry in \code{\link{VALID_GTS_LAYER_NAMES}}).}
#'   \item{Fullname}{Character. Norwegian descriptive name of the layer, exactly
#'     as returned by the API.}
#'   \item{FullnameEN}{Character. English name of the layer. This field is
#'     specific to this package and is \emph{not} part of the NVE API response -
#'     do not expect it in data fetched directly from \code{gts.nve.no}. Where
#'     NVE's Norwegian label is loose or inconsistent with the layer code, the
#'     English name follows the quantity actually served rather than the literal
#'     Norwegian (the Norwegian name for \code{swe} reads as "snow amount", but
#'     it is given here as "Snow water equivalent"). A plain-language gloss is
#'     added in parentheses where the term is jargon. Leading \code{*} and
#'     \code{x} markers are kept from the Norwegian names.}
#'   \item{NoDataValue}{Integer. Sentinel value used by the API to indicate
#'     missing data.}
#'   \item{RawUnit}{Character. Unit of the raw values returned by the API.}
#'   \item{HumanReadableUnit}{Character. Unit after any scaling applied for
#'     display (may differ from \code{RawUnit}, e.g. Kelvin vs. Celsius).}
#'   \item{TimeResolutionInMinutes}{Integer. Temporal resolution of the layer
#'     in minutes (e.g. 1440 = daily, 60 = hourly).}
#'   \item{FirstDateInTimeSerie}{Character. Earliest date available for this
#'     layer in \code{"YYYY-MM-DD"} format.}
#' }
#'
#' @seealso \code{\link{VALID_GTS_LAYER_NAMES}}, \code{\link{download_nve_gts}}
#'
#' @source \url{https://gts.nve.no/api/}
#'
#' @examples
#' # Find all daily layers
#' Filter(function(x) x$TimeResolutionInMinutes == 1440L, gts_layers_full) |>
#'   sapply(\(x) x$Name)
#'
#' @export
gts_layers_full <- list(
  list(
    Name = "rr",
    Fullname = "D\u00f8gnnedb\u00f8r",
    FullnameEN = "Daily precipitation",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "rr3d",
    Fullname = "Nedb\u00f8r siste 3 d\u00f8gn",
    FullnameEN = "Precipitation, last 3 days",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rr1h",
    Fullname = "Nedb\u00f8r 1 time",
    FullnameEN = "Precipitation, 1 hour",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rr3h",
    Fullname = "Nedb\u00f8r 3 timer",
    FullnameEN = "Precipitation, 3 hours",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rrl",
    Fullname = "Regn",
    FullnameEN = "Rain (liquid precipitation only, excludes snow)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "rrl3h",
    Fullname = "Regn",
    FullnameEN = "Rain, 3 hours (liquid precipitation only, excludes snow)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rrprrrxm5",
    Fullname = "*Nedb\u00f8r i % av 5 \u00e5r",
    FullnameEN = "*Precipitation as % of the 5-year return level (an amount expected about once every 5 years)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2018-01-01"
  ),
  list(
    Name = "rr3hprrr3hxm5",
    Fullname = "3 timer nedb\u00f8r i % av 5 \u00e5rs gjentaksnedb\u00f8r 3t",
    FullnameEN = "3-hour precipitation as % of the 5-year 3-hour return level (an amount expected about once every 5 years)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rrsc",
    Fullname = "Nedb\u00f8r som sn\u00f8",
    FullnameEN = "Precipitation falling as snow",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "rrsc3h",
    Fullname = "Nedb\u00f8r som sn\u00f8 3t",
    FullnameEN = "Precipitation falling as snow, 3 hours",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "darr3h",
    Fullname = "Disaggregert nedb\u00f8r seNorge2018_v22.09",
    FullnameEN = "Disaggregated precipitation, seNorge2018_v22.09 (daily totals split into 3-hour steps)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "1971-01-01"
  ),
  list(
    Name = "tm",
    Fullname = "D\u00f8gntemperatur",
    FullnameEN = "Daily mean temperature",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "tm1h",
    Fullname = "Temperatur 1 time",
    FullnameEN = "Temperature, 1 hour",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "tm3h",
    Fullname = "Temperatur 3 timer",
    FullnameEN = "Temperature, 3 hours",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "datm3h",
    Fullname = "Disaggregert temperatur seNorge2018_v22.09",
    FullnameEN = "Disaggregated temperature, seNorge2018_v22.09 (daily values split into 3-hour steps)",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "1971-01-01"
  ),
  list(
    Name = "swe",
    Fullname = "Sn\u00f8mengde",
    FullnameEN = "Snow water equivalent (depth of water the snowpack would give if fully melted)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "swe3h",
    Fullname = "Sn\u00f8ens vannekvivalent 3t",
    FullnameEN = "Snow water equivalent, 3 hours (water held in the snowpack)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "snowload",
    Fullname = "Sn\u00f8last",
    FullnameEN = "Snow load (weight of the snowpack per square metre)",
    NoDataValue = 65535L,
    RawUnit = "kg/m2",
    HumanReadableUnit = "kg/m2",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2000-01-01"
  ),
  list(
    Name = "sd",
    Fullname = "Sn\u00f8dybde",
    FullnameEN = "Snow depth",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sd3h",
    Fullname = "Sn\u00f8dybde 3 timer",
    FullnameEN = "Snow depth, 3 hours",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "swepr",
    Fullname = "Sn\u00f8mengde i prosent",
    FullnameEN = "Snow water equivalent as % of normal (this year's snowpack against the long-term average for the date)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "age",
    Fullname = "Sn\u00f8ens alder",
    FullnameEN = "Snow age (days since the snow fell)",
    NoDataValue = 255L,
    RawUnit = "Dager",
    HumanReadableUnit = "Dager",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sca",
    Fullname = "Sn\u00f8dekningsgrad",
    FullnameEN = "Snow-covered area (share of the grid cell lying under snow)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "ski",
    Fullname = "Skif\u00f8re",
    FullnameEN = "Skiing conditions (categorical class, not a measurement)",
    NoDataValue = 255L,
    RawUnit = "Skif\u00f8reklasse",
    HumanReadableUnit = "Skif\u00f8reklasse",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt",
    Fullname = "Regn og sn\u00f8smelting",
    FullnameEN = "Water input to the ground (rain plus snowmelt reaching the surface)",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt3h",
    Fullname = "Regn og sn\u00f8smelting siste 3 timer",
    FullnameEN = "Water input to the ground, last 3 hours (rain plus snowmelt)",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "qtt7d",
    Fullname = "Regn og sn\u00f8smelting siste uke",
    FullnameEN = "Water input to the ground, last week (rain plus snowmelt)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt10d",
    Fullname = "Regn og sn\u00f8smelting siste 10 dager",
    FullnameEN = "Water input to the ground, last 10 days (rain plus snowmelt)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qttsdai",
    Fullname = "S\u00f8rpeskredindeks",
    FullnameEN = "Slushflow index (hazard index for avalanches of water-saturated snow)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_q",
    Fullname = "Avrenning",
    FullnameEN = "Runoff (water leaving the area as streamflow)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_eva",
    Fullname = "Fordampning",
    FullnameEN = "Evapotranspiration (water lost to the air from soil and vegetation)",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt3dls",
    Fullname = "*Vanntilf\u00f8rsel 3 d\u00f8gn",
    FullnameEN = "*Water input to the ground, 3 days (rain plus snowmelt)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "tmgr",
    Fullname = "Temperaturendring",
    FullnameEN = "Temperature change over 24 hours",
    NoDataValue = 32767L,
    RawUnit = "Celcius/10",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2018-01-01"
  ),
  list(
    Name = "swechange7d",
    Fullname = "Sn\u00f8 endring siste uke",
    FullnameEN = "Snow water equivalent, change over the last week",
    NoDataValue = 32767L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fsw",
    Fullname = "Nysn\u00f8 siste d\u00f8gn",
    FullnameEN = "New snow, last day (water equivalent, not depth)",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fsw3h",
    Fullname = "Nysn\u00f8 siste 3 timer",
    FullnameEN = "New snow, last 3 hours (water equivalent, not depth)",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "fsw3d",
    Fullname = "Nysn\u00f8 siste 3 d\u00f8gn",
    FullnameEN = "New snow, last 3 days (water equivalent, not depth)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fsw7d",
    Fullname = "Nysn\u00f8 siste uke",
    FullnameEN = "New snow, last week (water equivalent, not depth)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw",
    Fullname = "Nysn\u00f8dybde",
    FullnameEN = "New snow depth",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw3h",
    Fullname = "Nysn\u00f8dybde siste 3 timer",
    FullnameEN = "New snow depth, last 3 hours",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "qsw",
    Fullname = "Sn\u00f8smelting siste d\u00f8gn",
    FullnameEN = "Snowmelt, last day",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qsw7d",
    Fullname = "Sn\u00f8smelting sum siste uke",
    FullnameEN = "Snowmelt, total over the last week",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qsw3h",
    Fullname = "Sn\u00f8smelting 3 timer",
    FullnameEN = "Snowmelt, 3 hours",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "lwc",
    Fullname = "Sn\u00f8tilstand",
    FullnameEN = "Liquid water content of the snowpack (how wet the snow is)",
    NoDataValue = 255L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "lwc3h",
    Fullname = "Sn\u00f8tilstand 3 timer",
    FullnameEN = "Liquid water content of the snowpack, 3 hours (how wet the snow is)",
    NoDataValue = 255L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "gwb_sssdev",
    Fullname = "Jordas vannkapasitet",
    FullnameEN = "Soil water storage deviation (how much wetter or drier the soil is than normal)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_frd",
    Fullname = "Teledyp",
    FullnameEN = "Frost depth (how deep the ground is frozen)",
    NoDataValue = 65535L,
    RawUnit = "cm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_sssrel",
    Fullname = "Vannmetning i jord",
    FullnameEN = "Relative soil water saturation (how full of water the soil is, 0-100%)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw3d",
    Fullname = "Nysn\u00f8dybde 3 d\u00f8gn",
    FullnameEN = "New snow depth, 3 days",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qttprrrxm200",
    Fullname = "Vanntilf\u00f8rsel 1 d\u00f8gn % 200 \u00e5r",
    FullnameEN = "Water input over 1 day as % of the 200-year return level (an amount expected about once every 200 years)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3dprrrxm200",
    Fullname = "Vanntilf\u00f8rsel 3 d\u00f8gn % 200 \u00e5r",
    FullnameEN = "Water input over 3 days as % of the 200-year return level (an amount expected about once every 200 years)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qprqxyrx30yr",
    Fullname = "Avrenning i % av maksimum",
    FullnameEN = "Runoff as % of the highest value seen in the last 30 years",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qttprqttxyrx30yr",
    Fullname = "Vanntilf\u00f8rsel 1 d\u00f8gn i % maks",
    FullnameEN = "Water input over 1 day as % of the highest value seen in the last 30 years",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3dprqtt3dxyrx30yr",
    Fullname = "Vanntilf\u00f8rsel 3 d\u00f8gn i % maks",
    FullnameEN = "Water input over 3 days as % of the highest value seen in the last 30 years",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "additionalSnowDepth",
    Fullname = "Fokksn\u00f8indeks",
    FullnameEN = "Wind-drifted snow index (extra snow depth built up by wind-blown snow)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2021-01-01"
  ),
  list(
    Name = "depthHoarIndex1",
    Fullname = "Antall grader pr meter pr dag",
    FullnameEN = "Depth hoar index 1 (growth of weak crystal layers inside the snowpack; degrees per metre per day)",
    NoDataValue = 32767L,
    RawUnit = "C/m dager",
    HumanReadableUnit = "C/m dager",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "depthHoarIndex2",
    Fullname = "Begerkrystallindeks 2",
    FullnameEN = "Depth hoar index 2 (days of weak crystal layer growth inside the snowpack)",
    NoDataValue = 65535L,
    RawUnit = "dager",
    HumanReadableUnit = "dager",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "gwb_qtt",
    Fullname = "HBV Vanntilf\u00f8rsel",
    FullnameEN = "Water input to the ground, HBV model (rain plus snowmelt)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_landslideindex1",
    Fullname = "xJordskredindeks",
    FullnameEN = "xLandslide index (soil and debris slides)",
    NoDataValue = 65535L,
    RawUnit = "Index",
    HumanReadableUnit = "Index",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_landslideindex2",
    Fullname = "xJordskredindeks2",
    FullnameEN = "xLandslide index 2 (soil and debris slides)",
    NoDataValue = 65535L,
    RawUnit = "Index",
    HumanReadableUnit = "Index",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qttls",
    Fullname = "*Vanntilf\u00f8rsel",
    FullnameEN = "*Water input to the ground (rain plus snowmelt)",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_gwtdev",
    Fullname = "D\u00f8gnendring Grunnvann",
    FullnameEN = "Groundwater storage, change over 24 hours",
    NoDataValue = 32767L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_gwt",
    Fullname = "Grunnvann",
    FullnameEN = "Groundwater storage (water held below ground)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3d",
    Fullname = "HBV Vanntilf\u00f8rsel 3 d\u00f8gn",
    FullnameEN = "Water input to the ground over 3 days, HBV model (rain plus snowmelt)",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qttprgwb_rryr30yr",
    Fullname = "Vanntilf\u00f8rsel 1 d\u00f8gn",
    FullnameEN = "Water input over 1 day as % of the 30-year mean annual precipitation",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3dlst",
    Fullname = "Vanntilf\u00f8rsel 3 d\u00f8gn",
    FullnameEN = "Water input over 3 days as % of the 30-year mean annual precipitation",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw7d",
    Fullname = "xNysn\u00f8dybde 7 d\u00f8gn",
    FullnameEN = "xNew snow depth, 7 days",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "swerank",
    Fullname = "Sn\u00f8mengde rangert (NY)",
    FullnameEN = "Snow water equivalent, ranked against previous years (new)",
    NoDataValue = 255L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "windDirection10m24h06",
    Fullname = "Vindretning 10m d\u00f8gn",
    FullnameEN = "Wind direction at 10 m, daily (degrees the wind blows from)",
    NoDataValue = 65535L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windDirection10m1h",
    Fullname = "Vindretning 10m 1 time",
    FullnameEN = "Wind direction at 10 m, 1 hour (degrees the wind blows from)",
    NoDataValue = 65535L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windDirection10m3h",
    Fullname = "Vindretning 10m 3 timer",
    FullnameEN = "Wind direction at 10 m, 3 hours (degrees the wind blows from)",
    NoDataValue = 65535L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windSpeed10m24h06",
    Fullname = "Vindhastighet 10m d\u00f8gn",
    FullnameEN = "Wind speed 10 m above ground, daily",
    NoDataValue = 65535L,
    RawUnit = "m/s",
    HumanReadableUnit = "m/s",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windSpeed10m1h",
    Fullname = "Vindhastighet 10m 1 time",
    FullnameEN = "Wind speed 10 m above ground, 1 hour",
    NoDataValue = 65535L,
    RawUnit = "m/s",
    HumanReadableUnit = "m/s",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windSpeed10m3h",
    Fullname = "Vindhastighet 10m 3 timer",
    FullnameEN = "Wind speed 10 m above ground, 3 hours",
    NoDataValue = 65535L,
    RawUnit = "m/s",
    HumanReadableUnit = "m/s",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "qswenergy",
    Fullname = "Sn\u00f8smelting fra energibalanse model",
    FullnameEN = "Snowmelt from energy balance model",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2019-01-01"
  ),
  list(
    Name = "qswenergy3h",
    Fullname = "Sn\u00f8smelting 3timer fra energibalanse model",
    FullnameEN = "Snowmelt, 3 hours, from energy balance model",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2019-01-01"
  ),
  list(
    Name = "slushflowRatio",
    Fullname = "Forholdstall s\u00f8rpe",
    FullnameEN = "Slushflow ratio (index used in slushflow hazard assessment)",
    NoDataValue = 65535L,
    RawUnit = "Forholdstall",
    HumanReadableUnit = "Forholdstall",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fmi10d",
    Fullname = "Fryse tine grader siste 10 dager",
    FullnameEN = "Freeze-thaw degree days, last 10 days (accumulated freezing and thawing)",
    NoDataValue = 65535L,
    RawUnit = "D\u00f8gngrader",
    HumanReadableUnit = "D\u00f8gngrader",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  )
)

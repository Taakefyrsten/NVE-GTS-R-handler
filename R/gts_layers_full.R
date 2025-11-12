gts_layers_full <- list(
  list(
    Name = "rr",
    Fullname = "Døgnnedbør",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "rr3d",
    Fullname = "Nedbør siste 3 døgn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rr1h",
    Fullname = "Nedbør 1 time",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rr3h",
    Fullname = "Nedbør 3 timer",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rrl",
    Fullname = "Regn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "rrl3h",
    Fullname = "Regn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rrprrrxm5",
    Fullname = "*Nedbør i % av 5 år",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2018-01-01"
  ),
  list(
    Name = "rr3hprrr3hxm5",
    Fullname = "3 timer nedbør i % av 5 års gjentaksnedbør 3t",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "rrsc",
    Fullname = "Nedbør som snø",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "rrsc3h",
    Fullname = "Nedbør som snø 3t",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "darr3h",
    Fullname = "Disaggregert nedbør seNorge2018_v22.09",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "1971-01-01"
  ),
  list(
    Name = "tm",
    Fullname = "Døgntemperatur",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "tm1h",
    Fullname = "Temperatur 1 time",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "tm3h",
    Fullname = "Temperatur 3 timer",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "datm3h",
    Fullname = "Disaggregert temperatur seNorge2018_v22.09",
    NoDataValue = 65535L,
    RawUnit = "Kelvin",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "1971-01-01"
  ),
  list(
    Name = "swe",
    Fullname = "Snømengde",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "swe3h",
    Fullname = "Snøens vannekvivalent 3t",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "snowload",
    Fullname = "Snølast",
    NoDataValue = 65535L,
    RawUnit = "kg/m2",
    HumanReadableUnit = "kg/m2",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2000-01-01"
  ),
  list(
    Name = "sd",
    Fullname = "Snødybde",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sd3h",
    Fullname = "Snødybde 3 timer",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "swepr",
    Fullname = "Snømengde i prosent",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "age",
    Fullname = "Snøens alder",
    NoDataValue = 255L,
    RawUnit = "Dager",
    HumanReadableUnit = "Dager",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sca",
    Fullname = "Snødekningsgrad",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "ski",
    Fullname = "Skiføre",
    NoDataValue = 255L,
    RawUnit = "Skiføreklasse",
    HumanReadableUnit = "Skiføreklasse",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt",
    Fullname = "Regn og snøsmelting",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt3h",
    Fullname = "Regn og snøsmelting siste 3 timer",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "qtt7d",
    Fullname = "Regn og snøsmelting siste uke",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt10d",
    Fullname = "Regn og snøsmelting siste 10 dager",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qttsdai",
    Fullname = "Sørpeskredindeks",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_q",
    Fullname = "Avrenning",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_eva",
    Fullname = "Fordampning",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qtt3dls",
    Fullname = "*Vanntilførsel 3 døgn",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "tmgr",
    Fullname = "Temperaturendring",
    NoDataValue = 32767L,
    RawUnit = "Celcius/10",
    HumanReadableUnit = "Celcius",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2018-01-01"
  ),
  list(
    Name = "swechange7d",
    Fullname = "Snø endring siste uke",
    NoDataValue = 32767L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fsw",
    Fullname = "Nysnø siste døgn",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fsw3h",
    Fullname = "Nysnø siste 3 timer",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "fsw3d",
    Fullname = "Nysnø siste 3 døgn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fsw7d",
    Fullname = "Nysnø siste uke",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw",
    Fullname = "Nysnødybde",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw3h",
    Fullname = "Nysnødybde siste 3 timer",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "qsw",
    Fullname = "Snøsmelting siste døgn",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qsw7d",
    Fullname = "Snøsmelting sum siste uke",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qsw3h",
    Fullname = "Snøsmelting 3 timer",
    NoDataValue = 255L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "lwc",
    Fullname = "Snøtilstand",
    NoDataValue = 255L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "lwc3h",
    Fullname = "Snøtilstand 3 timer",
    NoDataValue = 255L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "gwb_sssdev",
    Fullname = "Jordas vannkapasitet",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_frd",
    Fullname = "Teledyp",
    NoDataValue = 65535L,
    RawUnit = "cm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_sssrel",
    Fullname = "Vannmetning i jord",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw3d",
    Fullname = "Nysnødybde 3 døgn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qttprrrxm200",
    Fullname = "Vanntilførsel 1 døgn % 200 år",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3dprrrxm200",
    Fullname = "Vanntilførsel 3 døgn % 200 år",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qprqxyrx30yr",
    Fullname = "Avrenning i % av maksimum",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qttprqttxyrx30yr",
    Fullname = "Vanntilførsel 1 døgn i % maks",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3dprqtt3dxyrx30yr",
    Fullname = "Vanntilførsel 3 døgn i % maks",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "additionalSnowDepth",
    Fullname = "Fokksnøindeks",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2021-01-01"
  ),
  list(
    Name = "depthHoarIndex1",
    Fullname = "Antall grader pr meter pr dag",
    NoDataValue = 32767L,
    RawUnit = "C/m dager",
    HumanReadableUnit = "C/m dager",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "depthHoarIndex2",
    Fullname = "Begerkrystallindeks 2",
    NoDataValue = 65535L,
    RawUnit = "dager",
    HumanReadableUnit = "dager",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "gwb_qtt",
    Fullname = "HBV Vanntilførsel",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_landslideindex1",
    Fullname = "xJordskredindeks",
    NoDataValue = 65535L,
    RawUnit = "Index",
    HumanReadableUnit = "Index",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_landslideindex2",
    Fullname = "xJordskredindeks2",
    NoDataValue = 65535L,
    RawUnit = "Index",
    HumanReadableUnit = "Index",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "qttls",
    Fullname = "*Vanntilførsel",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_gwtdev",
    Fullname = "Døgnendring Grunnvann",
    NoDataValue = 32767L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_gwt",
    Fullname = "Grunnvann",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3d",
    Fullname = "HBV Vanntilførsel 3 døgn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qttprgwb_rryr30yr",
    Fullname = "Vanntilførsel 1 døgn",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "gwb_qtt3dlst",
    Fullname = "Vanntilførsel 3 døgn",
    NoDataValue = 65535L,
    RawUnit = "%",
    HumanReadableUnit = "%",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "sdfsw7d",
    Fullname = "xNysnødybde 7 døgn",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "cm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "swerank",
    Fullname = "Snømengde rangert (NY)",
    NoDataValue = 255L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "windDirection10m24h06",
    Fullname = "Vindretning 10m døgn",
    NoDataValue = 65535L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windDirection10m1h",
    Fullname = "Vindretning 10m 1 time",
    NoDataValue = 65535L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windDirection10m3h",
    Fullname = "Vindretning 10m 3 timer",
    NoDataValue = 65535L,
    RawUnit = "",
    HumanReadableUnit = "",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windSpeed10m24h06",
    Fullname = "Vindhastighet 10m døgn",
    NoDataValue = 65535L,
    RawUnit = "m/s",
    HumanReadableUnit = "m/s",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windSpeed10m1h",
    Fullname = "Vindhastighet 10m 1 time",
    NoDataValue = 65535L,
    RawUnit = "m/s",
    HumanReadableUnit = "m/s",
    TimeResolutionInMinutes = 60L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "windSpeed10m3h",
    Fullname = "Vindhastighet 10m 3 timer",
    NoDataValue = 65535L,
    RawUnit = "m/s",
    HumanReadableUnit = "m/s",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2010-01-01"
  ),
  list(
    Name = "qswenergy",
    Fullname = "Snøsmelting fra energibalanse model",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "2019-01-01"
  ),
  list(
    Name = "qswenergy3h",
    Fullname = "Snøsmelting 3timer fra energibalanse model",
    NoDataValue = 65535L,
    RawUnit = "mm",
    HumanReadableUnit = "mm",
    TimeResolutionInMinutes = 180L,
    FirstDateInTimeSerie = "2019-01-01"
  ),
  list(
    Name = "slushflowRatio",
    Fullname = "Forholdstall sørpe",
    NoDataValue = 65535L,
    RawUnit = "Forholdstall",
    HumanReadableUnit = "Forholdstall",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  ),
  list(
    Name = "fmi10d",
    Fullname = "Fryse tine grader siste 10 dager",
    NoDataValue = 65535L,
    RawUnit = "Døgngrader",
    HumanReadableUnit = "Døgngrader",
    TimeResolutionInMinutes = 1440L,
    FirstDateInTimeSerie = "1957-01-01"
  )
)

library(dplyr)
library(leaflet) # for addWMSTiles()
library(leaflet.extras) # for addWMSLegend()
library(leaflet.extras2) # for addWMS()

source("helper.R")

attrib_osm <-
  paste("&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap</a>",
        "contributors <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>")

# leaflet() |>
#   setView(lng = 4.99, lat = 51.37, zoom = 15) |>
#   addTiles() |>
#   add_wms_fl_agriculture(year = 2021, add_wms_legend = TRUE)

tvgmap <-
  leaflet() |>
  setView(lng = 5, lat = 51.4, zoom = 12) |>
  addTiles(group = "OpenStreetMap", attribution = attrib_osm) |>
  add_wms_nl_ortho(group = "Orthofoto") |>
  add_wms_be_ortho(group = "Orthofoto") |>
  add_wms_be_cartoweb("topo_grey", group = "Topografische kaart bleek") |>
  add_wmts_nl_brt("grijs", group = "Topografische kaart bleek") |>
  add_wms_be_cartoweb("topo", group = "Topografische kaart kleur") |>
  add_wmts_nl_brt("standaard", group = "Topografische kaart kleur") |>
  add_wmts_nl_brt("grijs", group = "BE GRB-basiskaart") |>
  add_wms_fl_grbmap(group = "BE GRB-basiskaart") |>
  add_wms_fl_agriculture(year = 2021, group = "BE landbouwgebruik") |>
  add_wms_fl_forestnature(group = "BE openbaar bos & natuur") |>
  add_wms_nl_nnb(group = "NL natuurnetwerk Brabant (NNB)") |>
  add_wms_nl_natte_natuurparels(group = "NL natte natuurparels") |>
  add_wms_fl_habitatmap(group = "BE habitatkaart") |>
  add_wms_nl_natuurtypen(group = "NL natuurtypen") |>
  add_wms_nl_landschapstypen(group = "NL landschapstypen") |>
  add_data_fl_zoekzones_passendbeheer(group = "BE zoekzones & passend beheer") |>
  add_data_fl_soortbeschermingsprogrammas(group = "BE soortbeschermingsprogramma's") |>
  add_wms_nl_ambitie_natuurtypen(group = "NL ambitiekaart natuurtypen") |>
  add_wms_nl_ambitie_landschapstypen(group = "NL ambitiekaart landschapstypen") |>
  add_data_fl_grondwaterwingebieden_en_beschermingszones(group = "BE gwwingebieden & beschermingszones") |>
  add_data_fl_grondwatervergunningen(group = "BE grondwatervergunningen") |>
  add_data_nl_attentiezones_waterhuishouding(group = "NL attentiezones waterhuishouding") |>
  add_wms_be_cartoweb("overlay", group = "BE topo_overlay") |>
  add_data_fl_hrl(group = "SBZ-H") |>
  add_data_nl_hrl(group = "SBZ-H") |>
  add_data_fl_werkingsgebied(group = "BE werkingsgebied") |>

  addLayersControl(
    baseGroups = c("Topografische kaart bleek", "Topografische kaart kleur", "Orthofoto", "BE GRB-basiskaart", "OpenStreetMap"),
    overlayGroups = c(
      "BE landbouwgebruik",
      "BE openbaar bos & natuur",
      "NL natuurnetwerk Brabant (NNB)",
      "NL natte natuurparels",
      "BE habitatkaart",
      "NL natuurtypen",
      "NL landschapstypen",
      "BE zoekzones & passend beheer",
      "BE soortbeschermingsprogramma's",
      "NL ambitiekaart natuurtypen",
      "NL ambitiekaart landschapstypen",
      "BE gwwingebieden & beschermingszones",
      "BE grondwatervergunningen",
      "NL attentiezones waterhuishouding",
      "BE topo_overlay",
      "SBZ-H",
      "BE werkingsgebied"
      ),
    options = layersControlOptions(collapsed = FALSE)
  ) |>
  hideGroup(c(
    "BE landbouwgebruik",
    "BE openbaar bos & natuur",
    "NL natuurnetwerk Brabant (NNB)",
    "NL natte natuurparels",
    "BE zoekzones & passend beheer",
    "BE soortbeschermingsprogramma's",
    "NL ambitiekaart natuurtypen",
    "NL ambitiekaart landschapstypen",
    "BE gwwingebieden & beschermingszones",
    "BE grondwatervergunningen",
    "NL attentiezones waterhuishouding",
    "BE topo_overlay"
    )) |>
  addMeasure(
    position = "bottomright",
    primaryLengthUnit = "meters",
    secondaryLengthUnit = NA,
    primaryAreaUnit = "hectares",
    localization = "nl",
    decPoint = ",",
    thousandsSep = "."
  )

# tvgmap

unlink("docs", recursive = TRUE)
dir.create("docs")
htmlwidgets::saveWidget(tvgmap, "docs/index.html", selfcontained = FALSE)

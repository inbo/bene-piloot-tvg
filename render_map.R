library(dplyr)
library(leaflet) # for addWMSTiles()
library(leaflet.extras) # for addWMSLegend()
library(leaflet.extras2) # for addWMS()

source("helper.R")
source("add_wms.R")

# leaflet() %>%
#   setView(lng = 4.99, lat = 51.37, zoom = 15) %>%
#   addTiles() %>%
#   add_wms_fl_agriculture(year = 2021, add_wms_legend = TRUE)

tvgmap <-
  leaflet() %>%
  setView(lng = 5, lat = 51.4, zoom = 11.3) %>%
  addTiles(group = "OpenStreetMap") %>%
  add_wms_be_ortho(group = "BE orthofoto") %>%
  add_wms_be_cartoweb("topo_grey", group = "BE topo_grey") %>%
  add_wms_fl_agriculture(year = 2021, group = "BE landbouwgebruik") %>%
  add_wms_fl_forestnature(group = "BE openbaar bos & natuur") %>%
  add_wms_fl_habitatmap(group = "BE habitatkaart") %>%
  add_data_fl_zoekzones_passendbeheer(group = "BE zoekzones & passend beheer") %>%
  add_data_fl_soortbeschermingsprogrammas(group = "BE soortbeschermingsprogramma's") %>%
  add_data_fl_grondwaterwingebieden_en_beschermingszones(group = "BE gwwingebieden & beschermingszones") %>%
  add_data_fl_grondwatervergunningen(group = "BE grondwatervergunningen") %>%
  add_wms_be_cartoweb("overlay", group = "BE topo_overlay") %>%
  add_data_fl_hrl(group = "BE SBZ-H") %>%
  add_data_fl_werkingsgebied(group = "BE werkingsgebied") %>%

  addLayersControl(
    baseGroups = c("BE topo_grey", "BE orthofoto", "OpenStreetmap"),
    overlayGroups = c(
      "BE landbouwgebruik",
      "BE openbaar bos & natuur",
      "BE habitatkaart",
      "BE zoekzones & passend beheer",
      "BE soortbeschermingsprogramma's",
      "BE gwwingebieden & beschermingszones",
      "BE grondwatervergunningen",
      "BE topo_overlay",
      "BE SBZ-H",
      "BE werkingsgebied"
      ),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  hideGroup(c(
    "BE landbouwgebruik",
    "BE openbaar bos & natuur",
    "BE zoekzones & passend beheer",
    "BE soortbeschermingsprogramma's",
    "BE gwwingebieden & beschermingszones",
    "BE grondwatervergunningen"
    ))

tvgmap

htmlwidgets::saveWidget(tvgmap, "docs/index.html", selfcontained = FALSE)

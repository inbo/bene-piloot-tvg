source("add_wms.R")

library(sf)
# st_layers("Vectordata.gpkg")

# library(n2khab)
# read_admin_areas(dsn="sac") %>%
#   st_write("Vectordata.gpkg", "Habitatrichtlijngebieden")

fl_hrl <-
  read_sf("Vectordata.gpkg", "Habitatrichtlijngebieden") %>%
  st_transform(4326)

add_data_fl_hrl <- function(map, group, ...) {
  leaflet::addPolygons(
    map = map,
    group = group,
    data = fl_hrl,
    fill = FALSE,
    color = "hotpink",
    popup = paste(
      "SBZ-H:", htmltools::htmlEscape(fl_hrl$sac_name),
      "<br/> Deelgebiedcode:", htmltools::htmlEscape(fl_hrl$subsac_code)
    ),
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_digvl,
      group = group
    )
}

fl_werkingsgebied <-
  read_sf("Vectordata.gpkg", "werkingsgebied_intendant_perimeter") %>%
  st_transform(4326)

add_data_fl_werkingsgebied <- function(map, ...) {
  leaflet::addPolygons(
    map = map,
    data = fl_werkingsgebied,
    fill = FALSE,
    color = "firebrick",
    ...
  )
}




fl_zoekzones_passendbeheer <-
  read_sf("Vectordata.gpkg", "zoekzones_passendbeheer")

add_data_fl_zoekzones_passendbeheer <- function(map, group, ...) {
  leaflet::addPolygons(
    map = map,
    group = group,
    data = fl_zoekzones_passendbeheer,
    color = ~colorFactor("viridis", unique(fl_zoekzones_passendbeheer$habtype))(habtype),
    weight = 0,
    fillOpacity = 1,
    label = paste(
      htmltools::htmlEscape(fl_zoekzones_passendbeheer$habtype),
      " - ",
      htmltools::htmlEscape(fl_zoekzones_passendbeheer$situatie_perceel)
      ),
    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_digvl,
      group = group
    )
}





fl_soortbeschermingsprogrammas <-
  read_sf("Vectordata.gpkg", "soortbeschermingsprogrammas")

add_data_fl_soortbeschermingsprogrammas <- function(map, group, ...) {
  leaflet::addPolygons(
    map = map,
    group = group,
    data = fl_soortbeschermingsprogrammas,
    color = ~colorFactor("plasma", unique(fl_soortbeschermingsprogrammas$soort))(soort),
    weight = 0,
    fillOpacity = 0.6,
    label = paste(
      htmltools::htmlEscape(fl_soortbeschermingsprogrammas$soort),
      " - ",
      htmltools::htmlEscape(fl_soortbeschermingsprogrammas$type)
    ),
    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_digvl,
      group = group
    )
}






fl_grondwaterwingebieden_en_beschermingszones <-
  read_sf("Vectordata.gpkg", "grondwaterwingebieden_en_beschermingszones")

add_data_fl_grondwaterwingebieden_en_beschermingszones <- function(map, group, ...) {
  leaflet::addPolygons(
    map = map,
    group = group,
    data = fl_grondwaterwingebieden_en_beschermingszones,
    fillOpacity = 0.4,
    color = "blue",
    weight = 1,
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_gdi,
      group = group
    )
}








fl_grondwatervergunningen <-
  read_sf("Vectordata.gpkg", "grondwatervergunningen_huidige")

add_data_fl_grondwatervergunningen <- function(map, group, ...) {
  leaflet::addCircleMarkers(
    map = map,
    group = group,
    data = fl_grondwatervergunningen,
    radius = log10(fl_grondwatervergunningen$vergund_jaardebiet),
    fillOpacity = 0.6,
    color = ~colorNumeric("plasma", unique(fl_grondwatervergunningen$vergund_jaardebiet))(vergund_jaardebiet),
    label = paste(
      "Vergund jaardebiet:", htmltools::htmlEscape(fl_grondwatervergunningen$vergund_jaardebiet),
      "- Exploitant:", htmltools::htmlEscape(fl_grondwatervergunningen$exploitant_naam)
    ),
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_gdi,
      group = group
    )
}




nl_hrl <-
  read_sf("Vectordata.gpkg", "nl_sbz_natura_2000") %>%
  st_transform(4326)

add_data_nl_hrl <- function(map, group, ...) {
  leaflet::addPolygons(
    map = map,
    group = group,
    data = nl_hrl,
    fill = FALSE,
    color = "hotpink",
    popup = paste(
      "SBZ-H:", htmltools::htmlEscape(nl_hrl$SITECODE_H),
      htmltools::htmlEscape(nl_hrl$NAAM_N2K),
      "<br/> Bescherming:", htmltools::htmlEscape(nl_hrl$BESCHERMIN)
    ),
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_nb,
      group = group
    )
}



nl_attentiezones_waterhuishouding <-
  read_sf("Vectordata.gpkg", "nl_attentiezones_waterhuishouding") %>%
  st_transform(4326)

add_data_nl_attentiezones_waterhuishouding <- function(map, group, ...) {
  leaflet::addPolygons(
    map = map,
    group = group,
    data = nl_attentiezones_waterhuishouding,
    fillOpacity = 0.4,
    color = "blue",
    weight = 1,
    ...
  ) %>%
    addTiles(
      urlTemplate = "",
      attribution = attrib_nb,
      group = group
    )
}






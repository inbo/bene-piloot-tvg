#' addWMSTiles() wrapper functions for Belgian and Dutch WMS services
#'
#' The `add_wms_*()` functions are shorthand alternatives for a fully specified
#' [leaflet::addWMSTiles()] or [leaflet.extras2::addWMS()] statement.
#'
#' On condition that these functions continue being maintained, using the
#' shorthand functions should make your scripts more futureproof.
#'
#' @inheritParams
#' @inheritParams
#' @param year Year to be applied in selecting the WMS
#' @param add_wms_legend Logical.
#' Is a legend to be added for this WMS?
#' Note that it cannot be toggled on and off; it appears as a separate legend.
#' @param ... Further arguments passed to leaflet::addWMSTiles() or
#' leaflet.extras2::addWMS()
#'
#' @rdname add_wms
#' @importFrom leaflet addWMSTiles
#' @importFrom leaflet.extras addWMSLegend
#' @importFrom leaflet.extras2 addWMS




#' addTiles() wrapper functions for Belgian and Dutch WMTS services
#'
#' The `add_wmts_*()` functions are shorthand alternatives for a fully specified
#' [leaflet::addTiles()] statement.
#'
#' On condition that these functions continue being maintained, using the
#' shorthand functions should make your scripts more futureproof.
#'
#' @inheritParams
#' @inheritParams
#' @param ... Further arguments passed to leaflet::addTiles()
#'
#' @rdname add_wmts
#' @importFrom leaflet addTiles



attrib_digvl <- "&copy; <a href=https://www.vlaanderen.be/digitaal-vlaanderen/onze-oplossingen/geografische-webdiensten/ons-gis-aanbod>Digitaal Vlaanderen</a>"
attrib_ngi <- "&copy; <a href=https://www.ngi.be/website/aanbod>Nationaal Geografisch Instituut</a>"
attrib_gdi <- "&copy; <a href=https://www.vlaanderen.be/geopunt/vlaams-geoportaal/gdi-vlaanderen>GDI-Vlaanderen</a>"
attrib_nb <- "&copy; <a href=https://georegister.brabant.nl>Provincie Noord-Brabant</a>"
attrib_ngeo <- "&copy; <a href=https://www.nationaalgeoregister.nl>Nationaal Georegister</a>"

#' @rdname add_wms
#' @export
add_wms_be_cartoweb <- function(map,
                             layers = c("topo", "topo_grey", "overlay", "crossborder"),
                             transparent = TRUE,
                             options = WMSTileOptions(format = "image/png", transparent = transparent),
                             ...) {
  layers <- match.arg(layers)
  addWMSTiles(
    map = map,
    baseUrl = "https://cartoweb.wms.ngi.be/service",
    layers = layers,
    options = options,
    attribution = attrib_ngi,
    ...
  )
}

#' @rdname add_wmts
#' @export
add_wmts_nl_brt <- function(map,
                           layer = c("standaard", "grijs", "pastel", "water"),
                           ...) {
  layer <- match.arg(layer)
  addTiles(
    map = map,
    urlTemplate = paste0("https://service.pdok.nl/brt/achtergrondkaart/wmts/v2_0/", layer, "/EPSG:3857/{z}/{x}/{y}.png"),
    attribution = attrib_ngeo,
    ...
  )
}

#' @rdname add_wms
#' @export
add_wms_be_ortho <- function(map,
                             layers = "orthoimage_coverage",
                             transparent = TRUE,
                             options = WMSTileOptions(format = "image/png", transparent = transparent),
                             ...) {
  addWMSTiles(
    map = map,
    baseUrl = "https://wms.ngi.be/inspire/ortho/service",
    layers = layers,
    options = options,
    attribution = attrib_ngi,
    ...
  )
}

#' @rdname add_wms
#' @export
add_wms_nl_ortho <- function(map,
                             layers = "Actueel_orthoHR",
                             transparent = TRUE,
                             options = WMSTileOptions(format = "image/png", transparent = transparent),
                             ...) {
  addWMSTiles(
    map = map,
    baseUrl = "https://service.pdok.nl/hwh/luchtfotorgb/wms/v1_0",
    layers = layers,
    options = options,
    attribution = attrib_ngeo,
    ...
  )
}


#' @rdname add_wmts
#' @export
add_wmts_nl_ortho <- function(map,
                             ...) {
  addTiles(
    map = map,
    urlTemplate = "https://service.pdok.nl/hwh/luchtfotorgb/wmts/v1_0/Actueel_orthoHR/EPSG:3857/{z}/{x}/{y}.jpeg",
    attribution = attrib_ngeo,
    ...
  )
}



#' @rdname add_wms
#' @export
add_wms_fl_grbmap <- function(map,
                           layers = "GRB_BSK",
                           transparent = TRUE,
                           options = WMSTileOptions(format = "image/png", transparent = transparent),
                           ...) {
  addWMSTiles(
    map = map,
    baseUrl = "https://geo.api.vlaanderen.be/GRB-basiskaart/wms",
    layers = layers,
    options = options,
    attribution = attrib_digvl,
    ...
  )
}

#' @rdname add_wms
#' @export
add_wms_fl_habitatmap <- function(map,
                                  layers = c("BWK2Hab", "BWK2HabLabel"),
                                  transparent = TRUE,
                                  options = WMSTileOptions(
                                    format = "image/png",
                                    transparent = transparent,
                                    info_format = "text/html"
                                  ),
                                  popup_options = popupOptions(maxWidth = 1200),
                                  add_wms_legend = FALSE,
                                  ...) {
  addWMS(
    map = map,
    baseUrl = "https://geo.api.vlaanderen.be/INBO/wms",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_digvl,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://geo.api.vlaanderen.be/INBO/wms?request=GetLegendGraphic%26version=1.3.0%26format=image/png%26layer=BWK2Hab")
    }
  }
}





#' @rdname add_wms
#' @export
add_wms_fl_forestnature <- function(map,
                                  layers = "am:am_patdat",
                                  transparent = TRUE,
                                  options = WMSTileOptions(
                                    format = "image/png",
                                    transparent = transparent,
                                    info_format = "text/html"
                                  ),
                                  popup_options = popupOptions(maxWidth = 600),
                                  add_wms_legend = FALSE,
                                  ...) {
  addWMS(
    map = map,
    baseUrl = "https://www.mercator.vlaanderen.be/raadpleegdienstenmercatorpubliek/wms",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_digvl,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://www.mercator.vlaanderen.be/raadpleegdienstenmercatorpubliek/ows?service=WMS&version=1.3.0&request=GetLegendGraphic&format=image%2Fpng&width=20&height=20&layer=am%3Aam_patdat")
    }
  }
}




#' @rdname add_wms
#' @export
add_wms_fl_agriculture <- function(map,
                                   year,
                                   layers = paste0("LbGebrPerc", year),
                                   transparent = TRUE,
                                   options = WMSTileOptions(
                                     format = "image/png",
                                     transparent = transparent,
                                     info_format = "text/html"
                                   ),
                                   popup_options = popupOptions(maxWidth = 1200),
                                   add_wms_legend = FALSE,
                                   ...) {
  addWMS(
    map = map,
    baseUrl = "https://geo.api.vlaanderen.be/ALV/wms",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_digvl,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
    addWMSLegend(., "https://geo.api.vlaanderen.be/ALV/wms?request=GetLegendGraphic%26version=1.3.0%26format=image/png%26layer=LbGebrPerc2021")
    }
  }
}






#' @rdname add_wms
#' @export
add_wms_nl_nnb <- function(map,
                           layers = "8",
                           transparent = TRUE,
                           options = WMSTileOptions(
                             format = "image/png",
                             transparent = transparent,
                             info_format = "text/html"
                           ),
                           popup_options = popupOptions(maxWidth = 600),
                           add_wms_legend = FALSE,
                           ...) {
  addWMS(
    map = map,
    baseUrl = "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WMSServer",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_nb,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WmsServer?request=GetLegendGraphic&version=1.3.0&format=image/png&layer=8&")
    }
  }
}


#' @rdname add_wms
#' @export
add_wms_nl_natte_natuurparels <- function(map,
                                          layers = "4",
                                          transparent = TRUE,
                                          options = WMSTileOptions(
                                            format = "image/png",
                                            transparent = transparent,
                                            info_format = "text/html"
                                          ),
                                          popup_options = popupOptions(maxWidth = 2000),
                                          add_wms_legend = FALSE,
                                          ...) {
  addWMS(
    map = map,
    baseUrl = "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WMSServer",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_nb,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WmsServer?request=GetLegendGraphic&version=1.3.0&format=image/png&layer=4&")
    }
  }
}


#' @rdname add_wms
#' @export
add_wms_nl_ambitie_landschapstypen <- function(map,
                                               layers = "12",
                                               transparent = TRUE,
                                               options = WMSTileOptions(
                                                 format = "image/png",
                                                 transparent = transparent,
                                                 info_format = "text/html"
                                               ),
                                               popup_options = popupOptions(maxWidth = 2000),
                                               add_wms_legend = FALSE,
                                               ...) {
  addWMS(
    map = map,
    baseUrl = "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WMSServer",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_nb,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WmsServer?request=GetLegendGraphic&version=1.3.0&format=image/png&layer=12&")
    }
  }
}


#' @rdname add_wms
#' @export
add_wms_nl_ambitie_natuurtypen <- function(map,
                                           layers = "13",
                                           transparent = TRUE,
                                           options = WMSTileOptions(
                                             format = "image/png",
                                             transparent = transparent,
                                             info_format = "text/html"
                                           ),
                                           popup_options = popupOptions(maxWidth = 2000),
                                           add_wms_legend = FALSE,
                                           ...) {
  addWMS(
    map = map,
    baseUrl = "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WMSServer",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_nb,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WmsServer?request=GetLegendGraphic&version=1.3.0&format=image/png&layer=13&")
    }
  }
}


#' @rdname add_wms
#' @export
add_wms_nl_landschapstypen <- function(map,
                                       layers = "9",
                                       transparent = TRUE,
                                       options = WMSTileOptions(
                                         format = "image/png",
                                         transparent = transparent,
                                         info_format = "text/html",
                                         minZoom = 13
                                       ),
                                       popup_options = popupOptions(maxWidth = 2000),
                                       add_wms_legend = FALSE,
                                       ...) {
  addWMS(
    map = map,
    baseUrl = "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WMSServer",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_nb,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WmsServer?request=GetLegendGraphic&version=1.3.0&format=image/png&layer=9&")
    }
  }
}


#' @rdname add_wms
#' @export
add_wms_nl_natuurtypen <- function(map,
                                   layers = "10",
                                   transparent = TRUE,
                                   options = WMSTileOptions(
                                     format = "image/png",
                                     transparent = transparent,
                                     info_format = "text/html",
                                     minZoom = 13
                                   ),
                                   popup_options = popupOptions(maxWidth = 2000),
                                   add_wms_legend = FALSE,
                                   ...) {
  addWMS(
    map = map,
    baseUrl = "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WMSServer",
    layers = layers,
    options = options,
    popupOptions = popup_options,
    attribution = attrib_nb,
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
      addWMSLegend(., "https://atlas.brabant.nl/arcgis/services/natuurbeheerplan_vastgesteld/MapServer/WmsServer?request=GetLegendGraphic&version=1.3.0&format=image/png&layer=10&")
    }
  }
}







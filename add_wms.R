#' addWMSTiles() wrapper functions for Belgian WMS services
#'
#' The add_wms_*() functions are shorthand alternatives for a fully specified
#' addWMSTiles() statement.
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
    ...
  )  %>%  {
    if (!add_wms_legend) . else {
    addWMSLegend(., "https://geo.api.vlaanderen.be/ALV/wms?request=GetLegendGraphic%26version=1.3.0%26format=image/png%26layer=LbGebrPerc2021")
    }
  }
}







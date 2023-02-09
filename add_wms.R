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
#' @param ... Further arguments passed to addWMSTiles()
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
                                  options = WMSTileOptions(format = "image/png", transparent = transparent),
                                  ...) {
  addWMSTiles(
    map = map,
    baseUrl = "https://geo.api.vlaanderen.be/INBO/wms",
    layers = layers,
    options = options,
    ...
  )
}





#' @rdname add_wms
#' @export
add_wms_fl_forestnature <- function(map,
                                  layers = "am:am_patdat",
                                  transparent = TRUE,
                                  options = WMSTileOptions(format = "image/png", transparent = transparent),
                                  ...) {
  addWMSTiles(
    map = map,
    baseUrl = "https://www.mercator.vlaanderen.be/raadpleegdienstenmercatorpubliek/wms",
    layers = layers,
    options = options,
    ...
  )
}




#' @rdname add_wms
#' @export
add_wms_fl_agriculture <- function(map,
                                   year,
                                   layers = paste0("LbGebrPerc", year),
                                   transparent = TRUE,
                                   options = WMSTileOptions(format = "image/png", transparent = transparent),
                                   ...) {
  addWMSTiles(
    map = map,
    baseUrl = "https://geo.api.vlaanderen.be/ALV/wms",
    layers = layers,
    options = options,
    ...
  )
}






library(httr2)
source(file.path("R", "util.r"))

# check.r: report whether the source country boundaries on geoboundaries.org
# have changed by comparing the etag of the source file to one (potentially)
# recorded on disk

country_url <- paste0(
  "https://github.com/wmgeolab/geoBoundaries/",
  "raw/main/releaseData/CGAZ/geoBoundariesCGAZ_ADM0.gpkg")

# request HEAD
request(country_url) |>
  req_method("HEAD") |>
  req_perform() ->
head_req

# get the new etag
head_req |>
  resp_header("etag") ->
new_etag

if (!file.exists("data/etag")) {

  # no existing etag: need new boundaries
  message("No existing etag found; update needed")
  write_to_gha_env("IS_STALE", "true")

} else {

  # get the existing etag from disk
  current_etag <- readLines("data/etag")
  
  # report result to gha
  is_stale <- tolower(as.character(current_etag != new_etag))
  message(paste("Existing etag. Is it stale?", is_stale))

  write_to_gha_env("IS_STALE", is_stale)

}

if (!file.exists("data/etag") || is_stale) {
  message("Writing out new etag")
  writeLines(new_etag, "data/etag")
}

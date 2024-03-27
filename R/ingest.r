library(tidyverse)
library(sf)
library(lwgeom)
source(file.path("R", "util.r"))

# ingest.r: download simplified agm0 (country) boundaries
# from geoboundaries.org, calculate centroids and run them
# off (twice)

country_url <- paste0(
  "https://github.com/wmgeolab/geoBoundaries/",
  "raw/main/releaseData/CGAZ/geoBoundariesCGAZ_ADM0.gpkg")
country_path <- "boundaries.gpkg"

download.file(country_url, country_path)

# turn off spherical geometry - it's not ideal, but the
# boundaries aren't specified correctly for it
sf_use_s2(FALSE)

# load the data and repair it
read_sf(country_path) |>
  select(-id, -shapeType) ->
regions

# calculate the centroids twice: once using the single
# largest polygon, then again using all the polygons
# (will leave this to user preference)

regions |>
  st_centroid(of_largest_polygon = TRUE) |>
  mutate(
    centroid = st_coordinates(geom),
    lat = centroid[, "Y"],
    lon = centroid[, "X"]) |>
  select(iso3 = shapeGroup, name = shapeName, lat, lon) |>
  st_drop_geometry() ->
centroids_largestpoly

regions |>
  st_centroid(of_largest_polygon = FALSE) |>
  mutate(
    centroid = st_coordinates(geom),
    lat = centroid[, "Y"],
    lon = centroid[, "X"]) |>
  select(iso3 = shapeGroup, name = shapeName, lat, lon) |>
  st_drop_geometry() ->
centroids_full

# write out
dir.create("data", showWarnings = FALSE)
centroids_largestpoly |>
  write_csv("data/centroids-oflargestpoly.csv")
centroids_full |>
  write_csv("data/centroids.csv")

# report back to gha
write_to_gha_env("UPDATED", "true")
write_to_gha_env("RUN_END", Sys.time())

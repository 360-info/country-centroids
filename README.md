# Country centroids dataset

Country centroids based on the [geoBoundaries.org](https://www.geoboundaries.org/) ADM0 boundaries. If you need to make a map where countries are represented by points (like a bubble map or an [arc map](https://360info.org/interactive-who-supplies-and-receives-arms)), you'll want centroids!

This dataset is updated on the first of the month if new data is available, or otherwise when run manually.

## Data

Two files are available:

- [`data/centroids-oflargestpoly.csv`](data/centroids-oflargestpoly.csv): centroids of countries using the largest polygon
- [`data/centroids.csv`](data/centroids.csv): centroids of countries using _all_ polygons

If you don't want centroids that might be in the water for countries with several landmasses (like, say, [Indonesia](https://maps.app.goo.gl/ntRHKemzwousEWoq8)), use the former. Otherwise, use the latter.

## ♻️ Use + Remix rights

![[Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0)](https://mirrors.creativecommons.org/presskit/buttons/80x15/png/by.png)

Please acknowledge both **360info** and [**geoboundaries.org**](https://geoboundaries.org) when you use it.

## Dependencies

Dependency lockfile is generated using the `{capsule}` package:

```r
list.files("R", pattern = glob2rx("*.r"), full.names = TRUE) |>
  capsule::capshot()
```

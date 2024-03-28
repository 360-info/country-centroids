# `/data`

Two files are available:

- [`data/centroids-oflargestpoly.csv`](data/centroids-oflargestpoly.csv): centroids of countries using the largest polygon
- [`data/centroids.csv`](data/centroids.csv): centroids of countries using _all_ polygons

Columns include:

- `iso3`: the country's [ISO 3166-1 alpha-3 code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3)
- `name`: the country's name
- `lat`: latitutde of the centroid
- `lon`: longitude of the centroid

If you don't want centroids that might be in the water for countries with several landmasses, use the former. otherwise, use the latter.

These centroids are calculated based on the [geoboundaries.org](https://geoboundaries.org) global file, which has some simplification done and which allocates disputed areas. If that's a problem for you, consider using their individual country files. (But if you're just after centroids, this is probably fine!)

## Other files

The `etag` file contains the [etag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) of the boundary source file from [geoboundaries.org](https://geoboundaries.org).

## ♻️ Use + Remix rights

![[Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0)](https://mirrors.creativecommons.org/presskit/buttons/80x15/png/by.png)

Please acknowledge both **360info** and [**geoboundaries.org**](https://geoboundaries.org) when you use it.

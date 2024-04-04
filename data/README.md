# `/data`

Two files are available:

- [`data/centroids-oflargestpoly.csv`](data/centroids-oflargestpoly.csv): centroids of countries using the largest polygon
- [`data/centroids.csv`](data/centroids.csv): centroids of countries using _all_ polygons

Columns include:

- `iso3`: the country's [ISO 3166-1 alpha-3 code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3)
- `name`: the country's name
- `lat`: latitutde of the centroid
- `lon`: longitude of the centroid

If you don't want centroids that might be in the water for countries with several landmasses (such as Indonesia, or many island chains), use the former. otherwise, use the latter.

> [!tip]
> **Why can't I see a country in this dataset?**
>
> These centroids are calculated from the [geoboundaries.org](https://geoboundaries.org) global file, which merges several non-country territories (eg. American Samoa) into the boundaries of their sovereign nation, as well as using rules to handle disputed territories.
>
> If you can't find a country or territory here, try searching the [individual country files](https://www.geoboundaries.org/countryDownloads.html) for it.
>
> If you're working with historical data, also consider that countries change over time.

## Other files

The `etag` file contains the [etag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) of the boundary source file from [geoboundaries.org](https://geoboundaries.org).

## ♻️ Use + Remix rights

![[Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0)](https://mirrors.creativecommons.org/presskit/buttons/80x15/png/by.png)

Please acknowledge both **360info** and [**geoboundaries.org**](https://geoboundaries.org) when you use it.

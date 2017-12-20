# Crime rates in Victoria - spatial visualisation

This instructional notebook investigates the reported crime rates in Victoria, Australia. This is by no means production code, it's designed to explain some of the steps involved in analysing and visualising data spatially.

Author: [Paul Geil](http://www.ph.unimelb.edu.au/~geilp/index.html)

Data used here include:

- Crime by location from the [Crime Statistics Agency](https://www.crimestatistics.vic.gov.au/) (CSA)
- Victorian Local Government Areas from [data.gov.au](https://data.gov.au/dataset/vic-local-government-areas-psma-administrative-boundaries)

## Requirements

This notebook uses several Python packages. Some come standard with the [Anaconda Python distribution](http://continuum.io/downloads), some do not. The primary libraries are:

* **[NumPy](http://www.numpy.org/)**: a library which adds support for large, multi-dimensional arrays and matrices, with a large collection of high-level mathematical functions to operate on these arrays.
* **[pandas](https://pandas.pydata.org/)**: a library providing high-performance, easy-to-use data structures and data analysis tools.
* **[json](https://www.json.org/)**: a decoder/encoder for JSON-formatted files. JSON (JavaScript Object Notation) is a lightweight data-interchange format.
* **[folium](https://folium.readthedocs.io/en/latest/)**: an interactive spatial visualisation module using Leaflet maps.
* **[bokeh](https://bokeh.pydata.org/en/latest/)**: an interactive visualisation library that targets modern web browsers for presentation.
* **[matplotlib](https://matplotlib.org/)**: a basic plotting library; most other plotting libraries are built on top of it.
* **[seaborn](https://seaborn.pydata.org/)**: an advanced statistical plotting library.
* **[ipywidgets](https://ipywidgets.readthedocs.io/en/stable/index.html)**: a library for including interactive widgets in jupyter notbooks.

To make sure you have all of the packages you need, install them with `conda`:

    conda install numpy pandas matplotlib seaborn

Alternatively, if you can install the packages with [pip](https://pip.pypa.io/en/stable/installing/) (a Python package manager):

    pip install numpy pandas matplotlib seaborn

## Topics covered

- Introduction
- Local Government Areas
- Crime rates
    - Just the numbers
    - Spatial visualisation
- Digging deeper into the crime statistics
    - Crime rate by division
    - Crime rate by subdivision
- Widgets
- Final remarks
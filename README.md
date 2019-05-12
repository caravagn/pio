# pio

If you work constantly with R scripts that generate several outputs, a tidy organisation of your outputs makes it easier to spot relevant information on the fly. The `pio` package implements a simple pretty I/O output to the console, exploting the `crayon` package to render couloured text and providing simple functions to layout headers, titles and other stuff. 

## Installation

Use either `devtools` or `remotes`
```R
devtools::install_github(repo = "caravagn/pio")
```
The only dependences are [tibbles](https://tibble.tidyverse.org/) from tidyverse, and
[crayon](https://github.com/r-lib/crayon).


## Manual

See the package [website](https://htmlpreview.github.io/?https://github.com/caravagn/pio/blob/master/docs/index.html).

## Support

Please use GitHub issues systems, or get in touch with me.

Author: Giulio Caravagna (gcaravagn@gmail.com)

## Build report

| Branch              | Stato CI      |
|---------------------|---------------|
| master | [![Build Status](https://travis-ci.org/caravagn/pio.svg?branch=master)](https://travis-ci.org/caravagn/pio) |

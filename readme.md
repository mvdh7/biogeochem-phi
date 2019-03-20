# biogeochem-phi

[![DOI](https://zenodo.org/badge/95231697.svg)](https://zenodo.org/badge/latestdoi/95231697)

These scripts should be cited as:

Humphreys MP, Daniels CJ, Wolf-Gladrow DA, Tyrrell T, & Achterberg EP (2017): "On the influence of marine biogeochemical processes over CO<sub>2</sub> exchange between the atmosphere and ocean", *Marine Chemistry* 199, 1-11, <a href="https://doi.org/10.1016/j.marchem.2017.12.006">doi:10.1016/j.marchem.2017.12.006</a>.

## bgc_sliso()
  * Calculates isocapnic quotient (Q) from *p*CO<sub>2</sub>, DIC, temperature and salinity
  * Requires functions from https://github.com/mvdh7/oceancarb-constants

## bgc_phi()
  * Calculates Phi from Q (output from `bgc_sliso()`) and biogeochemical process vector

## bgc_normalise()
  * Optionally normalises a biogeochemical process vector to unit length

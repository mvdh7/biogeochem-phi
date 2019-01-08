# Introduction

The MATLAB functions in [the biogeochem-phi repository](https://github.com/mvdh7/biogeochem-phi) evaluate the different equations presented by <a href="https://doi.org/10.1016/j.marchem.2017.12.006">Humphreys et al. (2018)</a>.

# Installation

Add all MATLAB functions from [the biogeochem-phi repository](https://github.com/mvdh7/biogeochem-phi) to your MATLAB path.

## Dependencies

To work correctly, the biogeochem-phi functions also require that you download the MATLAB functions from [oceancarb-constants](https://github.com/mvdh7/oceancarb-constants), and add them to your MATLAB path.

# Functions

## bgc_isocap

Evaluates the isocapnic quotient (<i>Q</i>) following Eq. (8) of <a href="https://doi.org/10.1016/j.marchem.2017.12.006">Humphreys et al. (2018)</a>; its approximation, following their Eq. (6); and the "released CO<sub>2</sub>:precipitated carbonate ratio" for calcification, of <a href="https://doi.org/10.4319/lo.1994.39.2.0458">Frankignoulle et al. (1994)</a>.

### Usage

`[Q, Qx, Psi] = bgc_isocap(pco2, dic, temp, sal);`

### Inputs

<table><tr>

<td><b>Variable</b></td>
<td><b>Description</b></td>
<td><b>Unit</b></td>
<td><b>Type</b></td>
</tr><tr>

<td><code>pco2</code></td>
<td>Partial pressure of CO<sub>2</sub> in seawater</td>
<td>μatm</td>
<td>double</td>
</tr><tr>

<td><code>dic</code></td>
<td>Dissolved inorganic carbon</td>
<td>μmol/kg-sw</td>
<td>double</td>
</tr><tr>

<td><code>temp</code></td>
<td>Seawater temperature</td>
<td>°C</td>
<td>double</td>
</tr><tr>

<td><code>sal</code></td>
<td>Practical salinity</td>
<td>-</td>
<td>double</td>
</tr></table>

### Outputs

<table><tr>

<td><b>Variable</b></td>
<td><b>Description</b></td>
<td><b>Unit</b></td>
<td><b>Type</b></td>
</tr><tr>

<td><code>Q</code></td>
<td>Isocap slope, i.e. ∂TA/∂DIC at constant seawater <i>p</i>CO<sub>2</sub></td>
<td>-</td>
<td>double</td>
</tr><tr>

<td><code>Qx</code></td>
<td>Approximation to the isocap slope</td>
<td>-</td>
<td>double</td>
</tr><tr>

<td><code>Psi</code></td>
<td>Special case of Φ for calcification (i.e. Ψ of <a href="https://doi.org/10.4319/lo.1994.39.2.0458">Frankignoulle et al., 1994</a>)</td>
<td>-</td>
<td>double</td>
</tr></table>

## bgc_phi

Calculates Φ, the amount of CO<sub>2</sub> that must be released from or added to seawater after a change in TA and/or DIC in order to return back to the original seawater <i>p</i>CO<sub>2</sub>, following Eq. (10) of <a href="https://doi.org/10.1016/j.marchem.2017.12.006">Humphreys et al. (2018)</a>.

### Usage

`Phi = bgc_phi(Q,Aq_Cq);`

### Inputs

<table><tr>

<td><b>Variable</b></td>
<td><b>Description</b></td>
<td><b>Unit</b></td>
<td><b>Type</b></td>
</tr><tr>

<td><code>Q</code></td>
<td>Isocap slope, i.e. ∂TA/∂DIC at constant seawater <i>p</i>CO<sub>2</sub></td>
<td>-</td>
<td>double</td>
</tr><tr>

<td><code>Aq_Cq</code></td>
<td>1×2 vector of [ΔTA, ΔDIC]</td>
<td>μmol/kg-sw</td>
<td>double</td>
</tr></table>

### Output

<table><tr>

<td><b>Variable</b></td>
<td><b>Description</b></td>
<td><b>Unit</b></td>
<td><b>Type</b></td>
</tr><tr>

<td><code>Phi</code></td>
<td>Φ, of <a href="https://doi.org/10.1016/j.marchem.2017.12.006">Humphreys et al. (2018)</a> Eq. (10)</td>
<td>μmol/kg-sw</td>
<td>double</td>
</tr></table>

## bgc_normalise

Normalises an input vector to a magnitude of unity.

### Usage

`nCq_nAq = bgc_normalise(Aq_Cq);`

### Input

<table><tr>

<td><b>Variable</b></td>
<td><b>Description</b></td>
<td><b>Unit</b></td>
<td><b>Type</b></td>
</tr><tr>

<td><code>Aq_Cq</code></td>
<td>1×2 vector of [ΔTA, ΔDIC]</td>
<td>μmol/kg-sw</td>
<td>double</td>
</tr></table>

### Output

<table><tr>

<td><b>Variable</b></td>
<td><b>Description</b></td>
<td><b>Unit</b></td>
<td><b>Type</b></td>
</tr><tr>

<td><code>nAq_nCq</code></td>
<td>Input vector normalised with a magnitude of unity</td>
<td>μmol/kg-sw</td>
<td>double</td>
</tr></table>

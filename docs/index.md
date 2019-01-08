# biogeochem-phi



## Functions

### bgc_isocap

#### Usage

`[Q, Qx, Psi] = bgc_isocap(pco2, dic, temp, sal);`

#### Inputs

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

#### Outputs

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
<td>Special case of Φ for calcification (i.e. Ψ of <a href="https://doi.org/10.4319/lo.1994.39.2.0458" target="_blank">Frankignoulle et al., 1994</a>)</td>
<td>-</td>
<td>double</td>
</tr></table>

### bgc_normalise

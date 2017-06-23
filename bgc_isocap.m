function [Q,Qx,Psi] = bgc_isocap(pco2,dic,temp,sal)
%bgc_isocap Calculate isocapnic quotient from input conditions
% === INPUTS ==============================================================
%  pco2: seawater CO2 partial pressure (pCO2)             / microatm
%   dic: dissolved inorganic carbon (DIC)                 / micromol/kg
%  temp: seawater temperature                             / degrees C
%   sal: practical salinity                               / 
% === OUTPUTS =============================================================
%     Q: isocapnic quotient                               /
%    Qx: approximation of isocapnic quotient              /
%   Psi: Phi for calcification (i.e. RA_RC = [-2 -1])     / 
% =========================================================================
% Written by Matthew P. Humphreys
%  v1: last updated 2017-06-23
% Citation: Humphreys MP, Daniels CJ, Wolf-Gladrow DA, Tyrrell T, & 
%           Achterberg EP (2017): "On the influence of marine
%           biogeochemical processes over CO2 exchange between the
%           atmosphere and ocean", Marine Chemistry, in prep.
% =========================================================================

% Absolute zero
azero = 273.15; % degC

% Evaluate coefficients
[~,pkHSO4] = cD90(temp+azero,sal);
TSO4 = cMR66(sal);
kHSO4 = 10.^-pkHSO4;
t2f = log10(1 + TSO4./kHSO4);

k0 = cW74(temp,sal);

[pKstarT_C1,pKstarT_C2] = cLDK00(temp+azero,sal);
k1 = 10.^-(pKstarT_C1 + t2f);
k2 = 10.^-(pKstarT_C2 + t2f);

tB = cLKB10(sal) * 1e-6;

pKstarT_w = cDSC07(temp+azero,sal);
kw = 10.^-(pKstarT_w + t2f);

pKstarT_B = cD90(temp+azero,sal);
kB = 10.^-(pKstarT_B + t2f); % mol/kg

% Aqueous CO2(aq) concentration
co2aq = pco2.*k0*1e-6;

% Shorthands: X, Y and Z
X = k1.*co2aq + kB.*tB + kw;
Y = (k1.*kB + 2*k1.*k2).*co2aq + kB.*kw;
Z = 2*k1.*k2.*kB.*co2aq;

% Hydrogen ion concentration
h = (-co2aq.*k1 - sqrt((co2aq.*k1).^2 ...
    - 4*(co2aq - dic*1e-6).*co2aq.*k1.*k2)) ./ (2*(co2aq - dic*1e-6));

% Isocap slope <Q>
Q = (-h.^4.*(h + 2*kB) - (kB.^2 + X).*h.^3 - Y.*h.*(2*h + kB) ...
    - Z.*(3*h + 2*kB)) ./ (-(k1.*co2aq.*h + 2*k1.*k2.*co2aq) ...
    .* (h + kB).^2);

% Approximate isocap slope <Qx>
k2_k0k1 = k2 ./ (k0 .* k1);
Qx = 1 + 2 * k2_k0k1 .* dic ./ pco2;

% Psi (Frankignoulle et al., 1994) <Psi>
Psi = -1 + 2./Q;

end %function bgc_isocap

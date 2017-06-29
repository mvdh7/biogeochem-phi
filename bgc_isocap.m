function [Q,Qx,Psi] = bgc_isocap(pco2,dic,temp,sal)
%bgc_isocap Calculate isocapnic quotient from input conditions
% Requires functions from https://github.com/mvdh7/oceancarb-constants
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
% --- Written by Matthew P. Humphreys -------------------------------------
%       v1: last updated 2017-06-29
% Citation: Humphreys MP, Daniels CJ, Wolf-Gladrow DA, Tyrrell T, & 
%           Achterberg EP (2017): "On the influence of marine
%           biogeochemical processes over CO2 exchange between the
%           atmosphere and ocean", Marine Chemistry, submitted
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

% Hydrogen ion concentration
h = (-co2aq.*k1 - sqrt((co2aq.*k1).^2 ...
    - 4*(co2aq - dic*1e-6).*co2aq.*k1.*k2)) ./ (2*(co2aq - dic*1e-6));

% Isocap slope <Q>
Q = ((k1.*co2aq.*h + 4*k1.*k2.*co2aq + kw.*h + h.^3) .* (kB + h).^2 ...
    + kB.*tB.*h.^3) ./ (k1.*co2aq .* (2*k2 + h) .* (kB + h).^2);

% Approximate isocap slope <Qx>
k2_k0k1 = k2 ./ (k0 .* k1);
Qx = 1 + 2 * k2_k0k1 .* dic ./ pco2;

% Psi (Frankignoulle et al., 1994) <Psi>
Psi = -1 + 2./Q;

end %function bgc_isocap

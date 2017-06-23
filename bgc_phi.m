function Phi = bgc_phi(sliso,RA_RC)
%bgc_phi
% === INPUTS ==============================================================
% sliso: isocap slope from bgc_sliso()                    /
% RA_RC: change in [TA DIC] due to biogeochemical process / micromol/kg
% === OUTPUTS =============================================================
%   Phi: extra change in DIC required to not change pCO2  / micromol/kg
% =========================================================================
% Written by Matthew P. Humphreys, last updated 2017-05-06
% =========================================================================

% Phi
Phi = RA_RC(2) - RA_RC(1) ./ sliso;

end %function bgc_phi

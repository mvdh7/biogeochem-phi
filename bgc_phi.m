function Phi = bgc_phi(Q,Aq_Cq)
%bgc_phi Calculate disequilibrium CT from isocapnic quotient and
%         biogeochemical process vector
% === INPUTS ==============================================================
%     Q: isocap slope, calculated from bgc_isocap()       /
% Aq_Cq: change in [AT CT] due to biogeochemical process / micromol/kg
% === OUTPUTS =============================================================
%   Phi: extra change in DIC required to not change pCO2 / micromol/kg
% =========================================================================
% --- Written by Matthew P. Humphreys -------------------------------------
%       v1: last updated 2017-06-23
% Citation: Humphreys MP, Daniels CJ, Wolf-Gladrow DA, Tyrrell T, & 
%           Achterberg EP (2017): "On the influence of marine
%           biogeochemical processes over CO2 exchange between the
%           atmosphere and ocean", Marine Chemistry, in press,
%           doi:10.1016/j.marchem.2017.12.006
% =========================================================================

% Phi
Phi = Aq_Cq(2) - Aq_Cq(1) ./ Q;

end %function bgc_phi

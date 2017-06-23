function nCq_nAq = bgc_normalise(Aq_Cq)
%bgc_normalise Normalise Aq and Cq for any process to unit vector case
% === INPUTS ==============================================================
% Aq_Cq: change in [Aq Cq] due to biogeochemical process / micromol/kg
% === OUTPUTS =============================================================
% nAq_nCq: input [Aq Cq] normalised such that sqrt(Aq^2 + Cq^2) = 1
% =========================================================================
% Written by Matthew P. Humphreys, last updated 2017-06-23
% =========================================================================

% Unpack input
Aq_set = Aq_Cq(1);
Cq_set = Aq_Cq(2);

% Normalise PC
if Cq_set == 0, nCq = 0;
else, nCq = (abs(Cq_set)/Cq_set) * sqrt(Cq_set^2/(Cq_set^2+Aq_set^2));
end %if

% Normalise PA
if Aq_set == 0, nAq = 0;
else, nAq = (abs(Aq_set)/Aq_set) * sqrt(Aq_set^2/(Cq_set^2+Aq_set^2));
end %if

% Generate output
nCq_nAq = [nAq nCq];

end %function bgc_normalise

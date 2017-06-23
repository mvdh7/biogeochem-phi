function nCq_nAq = bgc_normalise(Aq_Cq)
%bgc_normalise Normalise Aq and Cq for any process to unit vector case
% === INPUT ===============================================================
%   Aq_Cq: change in [AT CT] due to biogeochemical process / micromol/kg
% === OUTPUT ==============================================================
% nAq_nCq: input [Aq Cq] normalised such that sqrt(Aq^2 + Cq^2) = 1
% =========================================================================
% Written by Matthew P. Humphreys, last updated 2017-06-23
% =========================================================================

% Unpack input
Aq = Aq_Cq(1);
Cq = Aq_Cq(2);

% Normalise PC
if Cq == 0, nCq = 0;
else, nCq = (abs(Cq)/Cq) * sqrt(Cq^2/(Cq^2+Aq^2));
end %if

% Normalise PA
if Aq == 0, nAq = 0;
else, nAq = (abs(Aq)/Aq) * sqrt(Aq^2/(Cq^2+Aq^2));
end %if

% Generate output
nCq_nAq = [nAq nCq];

end %function bgc_normalise

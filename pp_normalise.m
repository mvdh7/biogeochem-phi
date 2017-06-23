function [PA_PC,P] = pp_normalise(PA_PC_set)
%pp_normalise Normalise PA and PC for any process such that P = 1
% Matthew P. Humphreys [2015-11-18]

% Unpack input
PA_set = PA_PC_set(1);
PC_set = PA_PC_set(2);

% Normalise PC
if PC_set == 0, PC = 0;
else PC = (abs(PC_set)/PC_set) * sqrt(PC_set^2/(PC_set^2+PA_set^2));
end %if

% Normalise PA
if PA_set == 0, PA = 0;
else PA = (abs(PA_set)/PA_set) * sqrt(PA_set^2/(PC_set^2+PA_set^2));
end %if

% Generate output and calculate P = 1 as a check
PA_PC = [PA PC];
P = sqrt(PC^2 + PA^2);

end %function pp_normalise

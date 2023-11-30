%% Delay Time to Distance Conversion
% Jacob A. Spies
% UC Berkeley
% 03 Nov 2023
%
% Converts an array of delay times (in ps) to delay stage position (in mm)
%

function mm = ps_to_mm(ps)
    c = 0.3; % Speed of light, mm/ps
    mm = (ps.*0.3)./2;
end
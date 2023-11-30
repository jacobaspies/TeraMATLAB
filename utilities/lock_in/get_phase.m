%% Get phase from lock-in amplifier
% Jacob A. Spies
% UC Berkeley
% 22 Nov 2023
%
% Get phase from SRS lock-in amplifier.
%
% As of 22 Nov 2023, NEED TO TEST OUTPUT

function phase = get_phase(lock_in)
    
    phase = str2double(query(lock_in, 'PHAS?'));
    
end
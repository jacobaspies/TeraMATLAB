%% Step Acquisition Measurements with Lock-In Amplifier
% Jacob A. Spies
% UC Berkeley
% 22 Nov 2023
%
% Function that performs a step acquisition measurement with a lock-in
% amplifier using Thorlabs direct-drive delay stages
%
% Inputs:
% Outputs:

function [data, complete] = step_acquisition_lock_in(fig, stage, lock_in, delays, lock_in_param, timeout)
    
    % So far, array indexing is not correct. Need to fix
    pos = ps_to_mm(delays);
    N_delay = length(pos);
    
    tc = lock_in_param(1);
    tc_to_wait = lock_in_param(2);
    N_samples = lock_in_param(3);
    channels = lock_in_param(4);
    
    data = zeros(N_delay, channels);

    %set(0,'CurrentFigure',fig);

    for i = 1:N_delay
        % Move to position
        stage.MoveTo(pos(i), timeout);
        % Wait specified number of time constants
        pause(tc*tc_to_wait);
        % Collect data from lock-in
        for k = 1:N_samples
            data(i,1) = data(i,1) + str2double(query(lock_in, 'OUTP? 1'));
            if channels == 2
                data(i,2) = data(i,2) + str2double(query(lock_in, 'OUTP? 2'));
            end
        end
        
        % Average data point for number of samples collected
        data(i,1) = data(i,1)/N_samples;
        if channels == 2
            data(i,2) = data(i,2)/N_samples;
        end
        
        % Add plotting command and update for each data point collected
        subplot(2,2,1,'Parent',fig)
        scatter(delays,data(:,1));
        subplot(2,2,2,'Parent',fig)
        scatter(delays,data(:,2));
        
        % Break data acquisition
        if fig.CurrentCharacter == 'q'
            break;
        end
    end

    complete = i; % Boolean used to mark if an iteration is complete
end
%% Move stage function
% Jacob A. Spies
% UC Berkeley
% 06 Nov 2023
%
% Function to move stage to a desired time delay. Includes initialization
% for the stage and disconnect (so it's a bit slow, but safe).
%

function [] = move_thorlabs_stage(time,stage,timeout)

    % Initialize BBD303
    %serial_BBD303 = '103374264';
    %timeout = 60000;
    %[Ch1, device] = init_BBD30X(serial_BBD303);

    position = ps_to_mm(time);

    stage.MoveTo(position, timeout);

    %disconnect_BBD30X(Ch1, device);
    
end
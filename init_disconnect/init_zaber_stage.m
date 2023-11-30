%% Initialize Zaber stage
% Jacob A. Spies
% UC Berkeley
% 21 Nov 2023
%
% Initializes a Zaber stage connected to an active controller
%
% Inputs:
% Outputs:
%

function [axis] = init_zaber_stage(device,index)

    axis = device.getAxis(index);
    
    if ~axis.isHomed()
        axis.home();
    end

end
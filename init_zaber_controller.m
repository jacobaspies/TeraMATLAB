%% Initialize Zaber rotation stage
% Jacob A. Spies
% UC Berkeley
% 20 Nov 2023
%
% Initializes an arbitrary number of Zaber stages for a given controller.
%
% Inputs:
%   * ip - IP address of controller as a string
%   * port - port as an integer
% Outputs:
%   * device - Object for the controller
%   * connection - Object for connection to controller, used in disconnect
%

function [device, connection] = init_zaber_controller(ip,port)

    import zaber.motion.ascii.Connection;
    %import zaber.motion.Units; Does not need to be here, must be called in
    %main script.

    connection = Connection.openTcp(ip,port);
    try
        deviceList = connection.detectDevices();
        fprintf('Found %d devices.\n', deviceList.length);
        device = deviceList(1);
    catch exception
        disp(getReport(exception));
    end
    
end
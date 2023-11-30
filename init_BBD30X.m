%% Initialize BBD303 Controller and Stages
% Jacob A. Spies
% UC Berkeley
% 03 Nov 2023
%
% Currently only initializes and homes Channel 1.

function [Ch1, device] = init_BBD30X(serial)
    
    NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
    NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericMotorCLI.dll');
    NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.BrushlessMotorCLI.dll');
    
    import Thorlabs.MotionControl.DeviceManagerCLI.*
    import Thorlabs.MotionControl.GenericMotorCLI.*
    import Thorlabs.MotionControl.Benchtop.BrushlessMotorCLI.*
    
    DeviceManagerCLI.BuildDeviceList();
    DeviceManagerCLI.GetDeviceListSize();
    DeviceManagerCLI.GetDeviceList();

    % serial = '103374264';
    timeout= 60000;
    
    device = BenchtopBrushlessMotor.CreateBenchtopBrushlessMotor(serial); %;The output of this line must be suppressed
    device.Connect(serial) 

    % add an try catch that if device not connected execute device.ResetConnection(serial)
    Ch1 = device.GetChannel(1);
    Ch1.WaitForSettingsInitialized(10000);
    Ch1.StartPolling(250);
    
    %Ch2 = device.GetChannel(2);
    %Ch2.WaitForSettingsInitialized(10000);
    %Ch2.StartPolling(250);
    
    deviceInfo = Ch1.GetDeviceInfo;
    
    C = {'Connected device is', int2str(deviceInfo.SerialNumber), char(deviceInfo.Name),'\n'};
    fprintf(strjoin(C));


    % motorSettings.UpdateCurrentConfiguration();
    % Ch1.UpdateCurrentConfiguration();
    % deviceUnitConverter = Ch1.UnitConverter();
    
    Ch1.EnableDevice();
    pause(1);
    %Ch2.EnableDevice();
    %pause(1); %wait to make sure Ch1 is enabled
    fprintf('Device enabled at channel 1.\n');

    % motorSettings = Ch1.LoadMotorConfiguration(serial);
    motorSettings = Ch1.LoadMotorConfiguration(Ch1.DeviceID);
    fprintf('Motor configuration loaded at channel 1.\n'); % Comment
    % Ch2.LoadMotorConfiguration(serial);

    if ~Ch1.Status.IsHomed
        Ch1.Home(timeout);
    end
    % Home_Method1(Ch1);
    %Ch2.Home();
    Ch1_homed = Ch1.Status.IsHomed;
    pause(1);
end


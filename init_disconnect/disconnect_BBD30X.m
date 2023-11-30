%% Disconnect BBD303 Controller and Stages
% Jacob A. Spies
% UC Berkeley
% 03 Nov 2023
%
% Disconnect BBD303 controller and and clean up. Currently only implemented
% for a single channel (DDS220).

function [] = disconnect_BBD30X(Ch1, device)
    Ch1.StopPolling();
    Ch1.DisableDevice();
    device.Disconnect();
end
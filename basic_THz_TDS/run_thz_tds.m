%% THz-TDS Script
% Jacob A. Spies
% 03 Nov 2023

clear all

% Experiment Parameters
N_avg = 3;
t_pump = [500:0.2:900];
tc_to_wait = 3; % Number of time constants to wait
N_samples = 3;

% Initialize BBD303
serial_BBD303 = '103374264';
timeout = 60000;
[Ch1, device] = init_BBD30X(serial_BBD303);

% Initialize lock-in
sr830 = init_lock_in(7,8); % Initialize SR830 w/ NI GPIB interface

% Prepare arrays and constants
t_pump = transpose(t_pump);
pos = ps_to_mm(t_pump);
N_delay = length(pos);
tc = get_time_constant(sr830);
data_X = zeros(N_delay,N_avg);
data_Y = zeros(N_delay,N_avg);

for i = 1:N_avg
    for j = 1:N_delay
        % Run THz-TDS Measurement
        % Move to position
        Ch1.MoveTo(pos(j), timeout);
        % Wait specified number of time constants
        pause(tc*tc_to_wait);
        % Collect data from lock-in
        for k = 1:N_samples
            data_X(j,i) = data_X(j,i) + str2double(query(sr830, 'OUTP? 1'));
            data_Y(j,i) = data_Y(j,i) + str2double(query(sr830, 'OUTP? 2'));
        end
        data_X(j,i) = data_X(j,i)/N_samples;
        data_Y(j,i) = data_Y(j,i)/N_samples;
        
        figure(1);
        subplot(2,1,1)
        scatter(t_pump,data_X(:,i));
        subplot(2,1,2)
        scatter(t_pump,data_Y(:,i));
    end
end

%% Compute average
data_X_avg = zeros(N_delay,1);
data_Y_avg = zeros(N_delay,1);
for i = 1:N_delay
    data_X_avg(i,1) = mean(data_X(i,:));
    data_Y_avg(i,1) = mean(data_Y(i,:));
end 

figure(2);
subplot(2,1,1)
plot(t_pump,data_X_avg);
subplot(2,1,2)
plot(t_pump,data_Y_avg);

disconnect_BBD30X(Ch1, device);
disconnect_lock_in(sr830);
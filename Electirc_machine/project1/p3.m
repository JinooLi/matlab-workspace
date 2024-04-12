%% 문제 3
% clean
clc; clear all; close all;

% set param
set_DC_motor_param

% run simulink
out = sim('motor.slx');

% plot
nexttile
plot(out.tout,out.veloOut.Data(:,1),LineWidth=2,Color=[1 0 0]);
hold on
plot(out.tout,out.veloOut.Data(:,2),LineWidth=2,Color=[0 1 0]);
xlabel('Time[sec]')
ylabel('velocity[r/min]')
xlim([0 0.2])
legend('Wrpm_{ref}','Wrpm')
grid on

nexttile
plot(out.tout,out.veloOut.Data(:,3),LineWidth=2,Color=[0 0 1]);
xlabel('Time[sec]')
ylabel('torque[Nm]')
xlim([0 0.2])
grid on


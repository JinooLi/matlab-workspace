%% 문제 2
% clean
clc; clear all; close all;

% set param
set_DC_motor_param

clearvars simout

% run simulink
simout = sim('motor.slx');

% plot
plot(simout.tout,simout.curOut.Data(:,2),LineWidth=2,Color=[1 0 0]);
hold on
plot(simout.tout,simout.curOut.Data(:,1),LineWidth=2,Color=[0 0 1]);
xlabel('Time[sec]')
ylabel('[A]')
xlim([0.45 0.55])
legend('Ia[A]','Iaref[A]')
grid on
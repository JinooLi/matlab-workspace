%% 문제 4
% clean
clc; clear all; close all;

% set param
set_DC_motor_param

% run simulink
out = sim('motor.slx');

% plot
nexttile
plot(out.tout,out.chopOut.Data(:,1),LineWidth=2,Color=[1 0 0]);
hold on
plot(out.tout,out.chopOut.Data(:,2),LineWidth=2,Color=[0 0 1]);
xlabel('Time[sec]')
ylabel('velocity[r/min]')
xlim([0 1])
legend('Wrpm_{ref}','Wrpm')
grid on

nexttile
plot(out.tout,out.chopOut.Data(:,3),LineWidth=2,Color=[1 0 0]);
hold on
plot(out.tout,out.chopOut.Data(:,4),LineWidth=2,Color=[0 0 1]);
xlabel('Time[sec]')
ylabel('')
xlim([0 1])
legend('Ia [A]','Te [Nm]')
grid on


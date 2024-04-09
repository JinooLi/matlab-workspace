%% 문제 2
% set param
set_DC_motor_param

% run simulink
simout = sim('DC_control');

% plot
plot(simout.tout,simout.control.Data(:,1),LineWidth=2,Color=[0 0 1]);
hold on
plot(simout.tout,simout.control.Data(:,2),LineWidth=2,Color=[1 0 0]);
xlabel('time[sec]')
ylabel('[A]')
xlim([0 0.02])
legend('Ia[A]','Iaref[A]')
grid on
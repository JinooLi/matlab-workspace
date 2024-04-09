%% 문제 3
% set param
set_DC_motor_param

clearvars simout

% run simulink
simout = sim('DC_velo_con');

% plot
nexttile
plot(simout.tout,simout.control.Data(:,1),LineWidth=2,Color=[0 0 1]);
xlabel('Time[sec]')
ylabel('[A]')
xlim([0 0.2])
legend('Ia[A]','Iaref[A]')
grid on

nexttile
plot(simout.tout,simout.control.Data(:,2),LineWidth=2,Color=[1 0 0]);
xlabel('Time[sec]')
ylabel('[A]')
xlim([0 0.2])
legend('Ia[A]','Iaref[A]')
grid on
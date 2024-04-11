%% 문제 3
% set param
set_DC_motor_param

clearvars simout

% run simulink
simout = sim('DC_velo_con');

% plot
nexttile
plot(simout.tout,simout.velocon.Data(:,3),LineWidth=2,Color=[1 0 0]);
hold on
plot(simout.tout,simout.velocon.Data(:,2),LineWidth=2,Color=[0 1 0]);
xlabel('Time[sec]')
ylabel('velocity[r/min]')
xlim([0 0.2])
legend('Wrpm_{ref}','Wrpm')
grid on

nexttile
plot(simout.tout,simout.velocon.Data(:,1),LineWidth=2,Color=[0 0 1]);
xlabel('Time[sec]')
ylabel('torque[Nm]')
xlim([0 0.2])
grid on


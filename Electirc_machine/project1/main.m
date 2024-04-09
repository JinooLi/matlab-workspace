% set DC motor parameter
set_DC_motor_param

% run simulink



%%% 문제 1
% DC_motor
%% plot data
% nexttile
% plot(out.tout,out.sim.Data(:,2),"LineWidth",2,"Color",[1 0 0])
% title('Output')
% xlabel('time(s)')
% ylabel('Wrpm[r/rpm]')

% nexttile
% plot(out.tout,out.sim.Data(:,1),LineWidth=2,Color=[0 0 1])
% title('Input')
% xlabel('time(s)')
% ylabel('Va[V]')

%% 문제 2
DC_control;
plot(out.tout,out.control.Data(:,1),LineWidth=2,Color=[0 0 1]);
hold on
plot(out.tout,out.control.Data(:,2),LineWidth=2,Color=[1 0 0]);
xlabel('time[sec]')
ylabel('[A]')
xlim([0 0.02])
legend('Ia[A]','Iaref[A]')
grid on
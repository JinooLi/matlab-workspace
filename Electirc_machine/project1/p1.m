%% 문제 1

% set DC motor parameter
set_DC_motor_param

% run simulink
% DC_motor 모듈의 input을 unit step으로 바꾸고 실행해야 합니다.
simout = sim('DC_motor');

% plot data
nexttile
plot(simout.tout,simout.sim.Data(:,2),"LineWidth",2,"Color",[1 0 0])
title('Output')
xlabel('time(s)')
ylabel('Wrpm[r/rpm]')

nexttile
plot(simout.tout,simout.sim.Data(:,1),LineWidth=2,Color=[0 0 1])
title('Input')
xlabel('time(s)')
ylabel('Va[V]')


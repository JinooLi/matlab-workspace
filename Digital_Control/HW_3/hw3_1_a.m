clc; clear all; close all;  
% 모델 생성
num = [5 20];
den = [1 0.5 4];
Gp_tf = tf(num,den);

T=0.2;
Gd_tf = c2d(Gp_tf,T,'zoh');

% 제어기 생성
% wp =< w0
w1 = 
w0 = 5;
wp = 0.1*w0;
Kc = 0.1;

% z = e^{sT}
z0 = exp(w0*T);
zp = exp(wp*T);

num = [1 z0];
den = [1 zp];
Cd_lag_tf = Kc*tf(num,den,T);

% open loop transfer function 생성
openloop_tf = Cd_lag_tf*Gd_tf;

%bode diagram, root locus, nyquist plot 출력
subplot(2,2,1);
margin(Gd_tf);hold on;
margin(openloop_tf);grid on;
legend('Without compensator', 'With compensator', 'Interpreter', ' latex');

subplot(2,2,2);
nyquist(openloop_tf);

subplot(2,2,3);
rlocus(openloop_tf)

subplot(2,2,4);
step(feedback(openloop_tf,1))


% 제어기 출력
Cd_lag_tf
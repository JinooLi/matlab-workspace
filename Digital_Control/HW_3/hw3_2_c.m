clc; clear; close all;
% 모델 생성
num = [5 20];
den = [1 0.5 4];
Gp_tf = tf(num,den);

% 이산시간 시스템으로 변환
T=0.2;
Gd_tf = c2d(Gp_tf,T,'zoh');

% 제어기 생성
Ksp = 1.96;
Ksi = 3.45223;
Cdp = 0.6*tf(Ksp);
Cdi = 0.1*Ksi*tf(T, [1 -1], T);
Cd = Cdp + Cdi;

step(feedback(Gd_tf * Cd, 1)); grid on;
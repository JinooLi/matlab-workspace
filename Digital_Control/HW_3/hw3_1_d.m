clc; clear; close all;
% 모델 생성
num = [5 20];
den = [1 0.5 4];
Gp_tf = tf(num,den);

% 불확실성 모델 추가
num = [-0.05 1];
den = [0.05 1];
Gp_uncertain_tf = tf(num,den);
Gp_tf = Gp_tf * Gp_uncertain_tf;

% 이산시간 시스템으로 변환
T=0.2;
Gd_tf = c2d(Gp_tf,T,'zoh');

% bilinear transform을 이용하여 연속시간 시스템으로 변환
Gw_tf = d2c(Gd_tf,'tustin');

% lag compensator 설계
om_w1 = 2.49;
k_w0 = 0.005;% 0.1 이하로 설정.
om_w0 = k_w0*om_w1;
a0 = 1.2; % 임의로 설정
k_wp = 0.3; % 1이하로 설정
om_wp = k_wp*om_w0/(a0*exp(20.1/20));
Dw_lag_tf = a0*tf([1/om_w0 1], [1/om_wp 1]);

% 이산시간으로 변환
Dd_lag_tf = c2d(Dw_lag_tf, T, 'zoh');

% lag compensator 적용
open_loop = Gd_tf * Dd_lag_tf;

% closed loop 생성
closed_loop = feedback(open_loop, 1);

% step rseponse 확인
step(closed_loop); grid on;
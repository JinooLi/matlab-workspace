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

% closed loop 생성
closed_loop = feedback(Gd_tf, 1);

% step rseponse 확인
step(closed_loop); grid on;
clc; clear; close all;
% 모델 생성
num = [5 20];
den = [1 0.5 4];
Gp_tf = tf(num,den);
T=0.2;
Gd_tf = c2d(Gp_tf,T,'zoh');

% margin(Gd_tf);

Gw_tf = d2c(Gd_tf,'tustin');
% figure();
% margin(Gw_tf); grid on;

om_w1 = 2.49;

k_w0 = 0.005;% 0.1 이하로 설정.

om_w0 = k_w0*om_w1;

a0 = 1.2; % 임의로 설정

k_wp = 0.3; % 1이하로 설정

om_wp = k_wp*om_w0/(a0*exp(20.1/20));

Dw_lag_tf = a0*tf([1/om_w0 1], [1/om_wp 1]);

Dd_lag_tf = c2d(Dw_lag_tf, T, 'zoh');

open_loop = Gd_tf * Dd_lag_tf;

closed_loop = feedback(open_loop, 1);

step(closed_loop); grid on;
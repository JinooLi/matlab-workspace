clc; clear; close all;
% 모델 생성
num = [5 20];
den = [1 0.5 4];
Gp_tf = tf(num,den);

% 이산시간 시스템으로 변환
T=0.2;
Gd_tf = c2d(Gp_tf,T,'zoh');

% 상태 변수 모델로 변환
Gd_ss = ss(Gd_tf);

% igenvalue를 p 벡터로 설정하는 벡터 L생성
p = [0.2 0.5];
K = place(Gd_ss.A, Gd_ss.B, p);
L = place(Gd_ss.A', Gd_ss.C', p)';

% 전체 전달함수 생성
An = Gd_ss.A - Gd_ss.B*K - L*Gd_ss.C;
Bn = L;
Cn = K;
tfn = tf(ss(An,Bn,Cn,0,T));
tfn

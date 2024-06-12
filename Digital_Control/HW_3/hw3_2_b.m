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
Cdp = 0.6*tf(Ksp);
Cdi = tf(T, [1 -1], T);

% Ksi를 찾는다.
Ksi = 0;
for digit = 0:1:5 % 소수점 5자리까지 찾는다.
    for g = 1:1:10 
        k = Ksi + (g*(0.1^digit));
        Cd = Cdp + k*Cdi;
        [Gm,Pm,Wcg,Wcp] = margin(Gd_tf * Cd);
        if Pm < 0
            Ksi = Ksi + (g-1)*(0.1^digit);
            break;
        end
    end
end

format long
Ksi

Cd = Cdp + Ksi*Cdi;
margin(Gd_tf * Cd)


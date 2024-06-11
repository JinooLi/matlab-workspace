% 모델 생성
num = [5 20];
den = [1 0.5 4];
Gp_tf = tf(num,den);

T=0.2;
Gd_tf = c2d(Gp_tf,T,'zoh');

% 제어기 생성
% wp =< w0
w0 = 1;
wp = 0.1;
Kc = 0.1;

% z = e^{sT}
z0 = exp(w0*T);
zp = exp(wp*T);

num = [1 z0];
den = [1 zp];
Cd_lag_tf = Kc*tf(num,den,T);

% open loop transfer function 생성
openloop_tf = Cd_lag_tf*Gd_tf;

closedLoop_tf = feedback(openloop_tf,1);

step(closedLoop_tf)


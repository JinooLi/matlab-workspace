T = 0.1;
num = [1 0 0 0.5];
den = [1 0 -0.4 0 0];
F_tf = tf(num,den,T);
K = 2;

bode(K*F_tf)
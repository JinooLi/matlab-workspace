T = 0.2;
num = [1 0 0 0.5];
den = [1 0 -0.4 0 0];
F_tf = tf(num,den,T);

rlocus(F_tf)
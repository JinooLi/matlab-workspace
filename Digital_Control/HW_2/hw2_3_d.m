T = 0.2;
num = [1 0 0 0.5];
den = [1 0 -0.4 0 0];
F_tf = tf(num,den,T);
K = 0.9;

% 단위원 생성
theta = linspace(0,2*pi(),100);
x = sin(theta);
y = cos(theta);

plot(x,y,'red')
hold on
nyquist(K*F_tf)
hold off

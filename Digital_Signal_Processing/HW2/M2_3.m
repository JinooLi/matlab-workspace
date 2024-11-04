clc; clear; close all;
L = 80;
A = 1.5;
omega = 0.65*pi;
phy = 0.5*pi;
n = 0:L;

stem(n, A*sin(n*omega+phy));
%hold on; plot((0:.1:L),A*sin((0:.1:L)*omega+phy),'r');
plot
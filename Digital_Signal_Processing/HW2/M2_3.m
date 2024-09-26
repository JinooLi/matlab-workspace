clc; clear; close all;
%(a)
L = 40;
A = 1.5;
omega = 0;
phy = pi/2;

n = 0:L;

stem(n, A*sin(n*omega+phy))
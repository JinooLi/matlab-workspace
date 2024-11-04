clc; clear; close all;
L = 10;
A = 1;
omega = 0.6*pi;
phy = 0.5*pi;
n = 0:L;

stem(n, A*sin(n*omega+phy));
hold on; plot((0:.01:L),A*sin((0:.01:L)*omega+phy),'-',color='r');
omega = 2.6*pi;
hold on; plot((0:.01:L),A*sin((0:.01:L)*omega+phy),'-.',color='g');
omega = -1.4*pi;
hold on; plot((0:.01:L),A*sin((0:.01:L)*omega+phy),'--',color='b');
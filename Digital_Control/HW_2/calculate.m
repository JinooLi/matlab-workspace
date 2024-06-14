clc; clear; close all;
syms t;

% Define the function
b = -(0.8+t)+(t+1)*exp(-0.2/t);
c = t + (0.8-t)*exp(-0.2/t);
p = -b/2+sqrt(c);
q = -b/2-sqrt(c);

% drwa the function
figure;
range = [-10,-0.1];
fplot(p, range); hold on;
fplot(q, range); hold on;
fplot(1, range); hold on;
fplot(-1, range); hold on;

figure;
range = [0,10];
fplot(p, range); hold on;
fplot(q, range); hold on;
fplot(1, range); hold on;
fplot(-1, range); hold on;

% finde limit of the function as t approches to infinity
limit(p, t, inf)
limit(q, t, inf)
limit(p, t, -inf)
limit(q, t, -inf)
clc; clear all; close all;      % Initialization

syms K

Gp_tf = tf(1,[1 1 0]);
T = 0.2;
Gd_tf = c2d(Gp_tf,T,'zoh')


C_tf = Gd_tf/(1+Gd_tf)

C_tf = minreal(C_tf)



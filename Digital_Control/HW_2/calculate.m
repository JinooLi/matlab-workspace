clc; clear; close all;
syms t;

% Define the function
b = -(0.8+t)+(t-1)*exp(-0.2/t);
c = t + (0.8-t)*exp(-0.2/t);

% function for jury stability criterion
s1 = b+c+1;
s2 = -b+c+1;
s3 = 1-abs(c);

% drwa function s1
figure;
range = [-10,-0.1];
subplot(1,2,1);
fplot(s1, range);

range = [0,10];
subplot(1,2,2);
fplot(s1, range);

% Calculate the limit
s1r = limit(s1, t, 0, 'right');
s1l = limit(s1, t, 0, 'left');

% print limit
disp('s1r = ');
disp(s1r);
disp('s1l = ');
disp(s1l);

% drwa function s2
figure;
range = [-10,-0.1];
subplot(1,2,1);
fplot(s2, range);

range = [0,10];
subplot(1,2,2);
fplot(s2, range);

% Calculate the limit
s2r = limit(s2, t, 0, 'right');
s2l = limit(s2, t, 0, 'left');

% print limit
disp('s2r = ');
disp(s2r);
disp('s2l = ');
disp(s2l);

% drwa function s3
figure;
range = [-10,-0.1];
subplot(1,2,1);
fplot(s3, range);

range = [0,10];
subplot(1,2,2);
fplot(s3, range);

% Calculate the limit
s3r = limit(s3, t, 0, 'right');
s3l = limit(s3, t, 0, 'left');

% print limit
disp('s3r = ');
disp(s3r);
disp('s3l = ');
disp(s3l);



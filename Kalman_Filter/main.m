clc; clear; close all;
% state space model of the system
% x(k+1) = A*x(k) + B*u(k)
% y(k) = C*x(k) + D*u(k)
% z(k) = y(k) + v(k)

Ts = 0.2; % sampling time
A = [1 0.2; 0 1]; % state matrix
B = [0.04; 0.2]; % input matrix
C = [1 0]; % output matrix
D = 0; % feedthrough matrix

state_space = ss(A,B,C,D,Ts);

process_noise.mu = 0; % mean of the process_noise
process_noise.sigma = 0.2; % standard deviation of the process_noise
measure_noise.mu = 0; % mean of the measure_noise
measure_noise.sigma = 0.2; % standard deviation of the measure_noise

measre_count = 50; % number of measurements (only integer values)
v = normrnd(measure_noise.mu, measure_noise.sigma, measre_count,1); % measurement noise
w = normrnd(process_noise.mu, process_noise.sigma, 1, measre_count); % process noise

real_u = 0; % real input signal
u = w + real_u; % input signal
x_0 = [-1; 1]; % initial state
t = 0:Ts:(measre_count-1)*Ts; % time vector
[y,tout,x] = lsim(state_space, u, t, x_0,'zoh'); % output signal

z = y + v; % measured output signal

% Kalman filter
%% preset values
Q = process_noise.sigma; % process noise covariance
R = measure_noise.sigma; % measurement noise covariance
P_init = [10 0; 0 10]; % initial state covariance
x_hat_init = [0; 0]; % initial state

x_hat = x_hat_init; % initial state estimate
P_hat = P_init; % initial state covariance estimate
x_hat_hist = zeros(2,measre_count); % state estimate history
P_hat_norm_hist = zeros(1,measre_count); % state covariance estimate history
x_hat_hist(:,1) = x_hat; % initial state estimate

dif_norm = zeros(1,measre_count); % difference of real and estimated states by norm
real_norm = zeros(1,measre_count); % real norm of states
est_norm = zeros(1,measre_count); % estimated norm of states
for i = 1:measre_count
    % measurement update
    x_hat = x_hat + (P_hat*C.'/(C*P_hat*C.'+R))*(z(i)-C*x_hat);
    P_hat = P_hat - (P_hat*C.'/(C*P_hat*C.'+R))*C*P_hat;

    x_hat_hist(:,i) = x_hat; % store the state estimate
    P_hat_norm_hist(i) = norm(P_hat); % store the state covariance estimate
    
    % time update
    x_hat = A*x_hat + B*real_u;
    P_hat = A*P_hat*A.' + B*Q*B.';

    dif_norm(i) = norm([(x(i,1)-x_hat_hist(1,i)) (x(i,2)-x_hat_hist(2,i))]);
    real_norm(i) = norm([x(i,1) x(i,2)]);
    est_norm(i) = norm([x_hat_hist(1,i) x_hat_hist(2,i)]);
end

% plot the results
figure
tiledlayout(3,1)

% plot the real and estimated norm of states
nexttile
plot(tout,real_norm,'r',tout,est_norm,'b')
xlabel('Time [s]')
ylabel('Norm')
title('Norm of real and estimated  states')
legend('Real','Estimated')

% plot norm of the difference of real and estimated states
nexttile
plot(tout,dif_norm,'r')
xlabel('Time [s]')
ylabel('Norm')
title('Norm of difference of real and estimated states')

% plot the estimated covariance
nexttile
plot(tout,P_hat_norm_hist,'r')
xlabel('Time [s]')
ylabel('Norm of covariance')
title('Norm of Estimated covariance')
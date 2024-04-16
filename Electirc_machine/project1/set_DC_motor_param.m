% DC motor Parameters
Power = 3336;               % 3336 power[w]
Va_rated = 140;             % Rated Voltage [V]
Ia_rated = 25;              % Rated Current [I]
Wm_rated = 3000*2*pi/60;    % Rated Angular Velocity[rad/s]
Te_rated = Power/Wm_rated;  % Rated Torque [Nm]

Ra = 0.26;                  % Amature Resistance [Ohm]
La = 1.7e-3;                % Amature Inductance [H]
J = .00252;                 % Moment of Inertia [kgm^2]
B = 0.01;                   % Coefficient of Viscous Friction [kgm^2/s]

K = Te_rated/Ia_rated;      % Kt*Flux

% Current Controller Parameters
Wcc = 1000;                 % 대역폭 [Hz]
Kpc = La*Wcc;               % P-gain
Kic = Ra*Wcc;               % I-gain
Kac = 1/Kpc;                % Anti-Windup gian

% velocity Controller Parameters
Wcs = 100;                  
Kps = J*Wcs/K;
Kis = J*Wcs*Wcs/(5*K);
Kas = 1/Kps;

% Chopper parameter
Vdc = Va_rated;
% plot magnitude of Ha = 0.3 - exp(-j*w) + 0.3*exp(-j*2*w)
% for w = 0:0.01:pi 
w = 0:0.01:1;
W = w*pi;
Ha = 0.3 - exp(-j*W) + 0.3*exp(-j*2*W);
Ha_mag = abs(Ha);
plot(w, Ha_mag);
xlabel('\omega / \pi');
ylabel('|Ha|');

% plot magnitde of Hb = 0.3 + exp(-j*w) + 0.3*exp(-j*2*w)
Hb = 0.3 + exp(-j*W) + 0.3*exp(-j*2*W);
Hb_mag = abs(Hb);
figure;
plot(w, Hb_mag);
xlabel('\omega / \pi');
ylabel('|Hb|');


 
a = 3.846127982;
b = -6.348692806;
h = [a b a];
% discete furier transform
H = freqz(h,1,512);
% plot the magnitude of the frequency response
figure;
plot(abs(H));
title('Magnitude of the frequency response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

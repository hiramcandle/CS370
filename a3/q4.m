% Load Input Data 
load('train_bird.mat');
y_len = length(y);
%soundsc(y, Fs);

% Plot Input Signal
subplot(2, 2, 1);
plot(y);
title('Input Signal', 'FontSize', 8);
xlabel('Time (Sample Index)');

% Calculate DFT of Input Signal
fre_y = fft(y);

% Plot Power Spectrum of Input Signal
subplot(2, 2, 2);
stem(abs(fre_y));
title('Power Spectrum of Input Signal', 'FontSize', 8);
xlabel('Frequency (Index)');

% Set the limit frequency for picking signal from frequency domain
t_freq = 2200;

% Pick Bird Chirp Signal
fre_bird = fre_y;
fre_bird(1:t_freq) = 0;
fre_bird(y_len-t_freq: y_len) = 0;
y_bird = ifft(fre_bird);
%soundsc(real(y_bird), Fs);

% Pick Train Whistle Signal & Plot
fre_train = fre_y;
fre_train(t_freq+1: y_len-t_freq-1) = 0;

subplot(2, 2, 4);
stem(abs(fre_train));
title('Power Spectrum of Denoised Signal of Train Whistle', 'FontSize', 8);
xlabel('Frequency (Index)');

y_train = ifft(fre_train);
subplot(2, 2, 3);
plot(real(y_train));
title('Denoised Signal of Train Whistle', 'FontSize', 8);
xlabel('Time (Sample Index)');
soundsc(real(y_train), Fs);

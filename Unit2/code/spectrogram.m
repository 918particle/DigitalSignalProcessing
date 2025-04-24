clear;
close;
home;

%Define a chirping signal
fs = 40.0e3; %40 kHz
dt = 1/fs;
T = 4.0; %seconds
t = dt:dt:T;
beta = 625.0; %Hz/second
f_start = 5.0e3; %1 kHz
frequencies = f_start-beta*t;
audio_data = 2.0*cos(2*pi*frequencies.*t);

%Structure the spectrogram
n_window = 2048;
n_inc = 128;
[spectral_data, info] = stft(audio_data,n_window,n_inc,n_window,"hamming");
spectral_data = spectral_data(1:end/2,:);
[n_freq, n_time] = size(spectral_data);
fbins = [0 fs/2];
tbins = [0 T];
spectral_data = abs(spectral_data);



player1 = audioplayer(audio_data,fs,8);
play(player1)
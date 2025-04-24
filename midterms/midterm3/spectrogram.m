clear;
close;
home;

%Load the RF data
data = load('doppler_shift.dat');
t = data(:,1);
amplitude = data(:,2);
dt = t(2)-t(1);
fs = 1/dt;
T = t(end);

%Structure the spectrogram
n_window = 2^(15);
n_inc = n_window;
[spectral_data, info] = stft(amplitude,n_window,n_inc,n_window,"hanning");
spectral_data = spectral_data(1:end/2,:);
[n_freq, n_time] = size(spectral_data);
fbins = [0 fs/2];
tbins = [0 T];
spectral_data = 20*log10(abs(spectral_data));
image(tbins,fbins,spectral_data);
set(gca(),'YDir','normal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
set(gca(),'fontsize',20);
h = colorbar();
set(h,'fontsize',20);
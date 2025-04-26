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
n_window = 256;
n_inc = n_window;
[spectral_data, info] = stft(amplitude,n_window,n_inc,n_window,"hanning");
spectral_data = spectral_data(1:end/2,:);
[n_freq, n_time] = size(spectral_data);
fbins = [0 fs/2]/1e6;
tbins = [0 T]*1e6;
spectral_data = 20*log10(abs(spectral_data));
image(tbins,fbins,spectral_data);
set(gca(),'YDir','normal');
xlabel('Time (micro-seconds)');
ylabel('Frequency (MHz)');
set(gca(),'fontsize',20);
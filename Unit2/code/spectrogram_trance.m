clear;
close;
home;

%Read in the audio audio track
[audio_data sampling_rate] = audioread('ForAnAngel.wav');
%Take every n-th sample of audio data:
decimation_factor = 2;
%Specify percentage of song to analyze
stop_point = 0.2;
%Take only one of the two tracks, every n-th sample
audio_data = audio_data(1:decimation_factor:end,1);
sampling_rate = sampling_rate/decimation_factor;
time_difference = 1/sampling_rate;
critical_frequency = sampling_rate/2.0;
n_samples = length(audio_data);
stop_sample = floor(stop_point*n_samples);
%Analyze only up to a given sample, based on stop_point
audio_data = audio_data(1:stop_sample);
times = transpose([0:stop_sample]*time_difference);

%Play the clip
player1 = audioplayer(audio_data,sampling_rate,16);
play(player1)

%Calculate the spectrogram
n_window = 2048;
n_inc = 1024;
[spectral_data, info] = stft(audio_data,n_window,n_inc,n_window);
spectral_data = spectral_data(1:end/2,:);
[n_freq n_time] = size(spectral_data);
frequencies = linspace(0,critical_frequency,n_freq);
%Get the stop time
stop_time = stop_sample*time_difference;
times_2 = linspace(0,stop_time,n_time);
%Get spectral data into dB (power)
spectral_data_dB = 10*log10(abs(spectral_data));
spectral_data_dB = spectral_data_dB-min(min(spectral_data_dB));
x = [min(times_2) max(times_2)];
y = [min(frequencies) max(frequencies)];

figure(1)
image(x,y,spectral_data_dB)
xlabel('Time (seconds)')
ylabel('Frequency (Hz)')
h = colorbar()
colormap('ocean')
set(gca(),'fontsize',18,'fontname','Calibri')
set(h,'fontsize',18,'fontname','Calibri')
axis([0 10 0 10000])

figure(2)
image(x,y,spectral_data_dB)
xlabel('Time (seconds)')
ylabel('Frequency (Hz)')
h = colorbar()
colormap('ocean')
set(gca(),'fontsize',18,'fontname','Calibri')
set(h,'fontsize',18,'fontname','Calibri')
axis([0 50 0 400])

figure(3)
image(x,y,spectral_data_dB)
xlabel('Time (seconds)')
ylabel('Frequency (Hz)')
h = colorbar()
colormap('ocean')
set(gca(),'fontsize',18,'fontname','Calibri')
set(h,'fontsize',18,'fontname','Calibri')
axis([50 60 0 8000])

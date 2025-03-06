clear;
close;
home;

fs = 128.0e3;
dt = 1/fs;
nbits = 8;
nchannels = 1;
record_time = 2.0;

%Define the recorder
recorder1 = audiorecorder(fs,nbits,nchannels);

%Record sound and get the data
record(recorder1,record_time);
audio_data = getaudiodata(recorder1);

%Define audioplayer and play the sound
%player1 = audioplayer(audio_data,fs,nbits);
%play(player1)

%Get the DFT of the audio data
%X = fft(audio_data);
%X = X(1:end/2);
%f = linspace(0,fs/2,length(X));

%Graph the audio spectrum
%semilogy(f,abs(X));
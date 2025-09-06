%% Audio recorder initialization

Fs = 8000; % Sampling rate 44.1 kHz
Nb = 16; % Number of bits 16
Nc = 1; % Number of channels 1 (mono)
ID = -1; % Audio device identifier (default)
T = 2; % Recording duration 2 sec

info = audiodevinfo; % Returns information about the input
% and output audio devices on the system
info.input(1) % Display the information about
% the first input device
% optional
%ID = -1; % uncomment to select the input audio device
% specified by the device identifier (ID) 0

% Create an audio recording object
recObj = audiorecorder(Fs, Nb, Nc, ID);

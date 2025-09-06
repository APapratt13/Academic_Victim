%% #1. Audio recorder initialization

Fs = 8000; % Sampling rate 8 kHz
Nb = 16; % Number of bits 16
Nc = 1; % Number of channels 1 (mono)
ID = -1; % Audio device identifier (default)
T = 2; % Recording duration 2 sec

info = audiodevinfo; 
info.input(1) 

% Create an audio recording object
recObj = audiorecorder(Fs, Nb, Nc, ID);

%% #2 Snimanje
disp('Start speaking.');
recordblocking(recObj, T)
disp('End of recording.');

nidasu = getaudiodata(recObj); % Extract the audio data

% Plot the result
figure, plot(nidasu), grid
title('"Snimka: NI DA SU"');

% Listen to the recording
soundsc(nidasu, Fs, Nb);

%% #3 Izreži slog "DA" --> Neka trajanje sloga "da" bude između 0.2 s i 0.6 s.
%ručno traži u grafu
poc = 7188;    
kon = 10458;

da = nidasu(poc:kon);

%graf i poslušaj
figure;
plot(da);
title('Izrezani slog: "da"');
grid on;
soundsc(da, Fs, Nb);


%% #4 Ipulsni odziv sustava
h = flipud(da);  % h(t) = p(-t) -> vremenski obrnuti slog "da"

figure;
plot(h);
title('Impulsni odziv sustava h(t)');
grid on;


%% #5 Detekcija sloga "DA" u signalu "NI DA SU"
y = conv(nidasu, h, 'same');  % Odziv sustava

figure;
plot(y);
title('Odziv sustava y(t)');
xlabel('Uzorki');
ylabel('Amplituda');
grid on;

%% 5. TOČAN TRENUTAK DETEKCIJE
[M, index] = max(abs(y));
Ts = 1 / Fs;
tda = index * Ts;

disp(['Točan trenutak detekcije (u s): ', num2str(tda)]);

%% 6. ČIŠĆENJE I SPREMANJE
clearvars -except nidasu da h y tda
save('0036558491.mat', 'nidasu', 'h', 'y', 'tda');
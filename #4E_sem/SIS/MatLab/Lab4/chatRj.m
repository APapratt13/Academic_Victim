%% 1. SNIMANJE GOVORA "ni da su"
Fs = 8000;         % Frekvencija uzorkovanja
Nb = 16;           % Broj bitova
Nc = 1;            % Broj kanala (mono)
ID = -1;           % Zadani audio uređaj
T = 2;             % Trajanje snimanja u sekundama

recObj = audiorecorder(Fs, Nb, Nc, ID);

disp('Počni govoriti: "ni da su"');
recordblocking(recObj, T);

disp('Završeno snimanje.');

nidasu = getaudiodata(recObj);
% Preslušavanje snimke
soundsc(nidasu, Fs, Nb);



% Crtanje signala
figure;
plot(nidasu);
title('Snimka: "ni da su"');

xlabel('Uzorki');
ylabel('Amplituda');
grid on;

%% 2. IZREZIVANJE SLOGA "da"
% Pronađi indekse "odokativno" iz grafa ako treba
start_index = 8343;    % Ovdje ručno promijeniš po potrebi
end_index   = 11325;    % Ovdje ručno promijeniš po potrebi

da = nidasu(start_index:end_index);

% Vizualizacija i slušanje sloga
figure;
plot(da);
title('Izrezani slog: "da"');
grid on;
soundsc(da, Fs, Nb);

%% 3. IMPULSNI ODZIV SUSTAVA
h = flip(da);  % h(t) = p(-t) -> vremenski obrnuti slog "da"

figure;
plot(h);
title('Impulsni odziv sustava h(t)');
grid on;

%% 4. DETEKCIJA SLOGA "da" U SIGN. "ni da su"
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
save('0123456789.mat', 'nidasu', 'h', 'y', 'tda');
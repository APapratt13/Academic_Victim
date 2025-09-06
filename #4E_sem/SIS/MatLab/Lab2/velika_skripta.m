%% VELIKA SKRIPTA

%% Audio recorder initialization

Fs = 44100; % Sampling rate 44.1 kHz
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

%% PERIODIČNOST
%Najprije razmatramo signale x1(t) = sin(4πt/T) i x2(t) = sin(2πt^2/T) pri 
% cemu je konstanta T=2


%% d1) periodičnost signala ne1
%clc; clear; close all;             %da zatvori i terminira sve ove prije da ne smeta
load('audioSignals.mat', 'ne1'); 

y1 = ne1(49219:49483);
y3 = ne1(49483:49746);
% Prikaz izdvojene periode
figure;
stem(y1, 'r', 'filled'); 
grid on;
title('Jedna perioda signala');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');

% % Ako treba druga
% figure;
% stem(y3, 'b', 'filled'); 
% grid on;
% title('Druga perioda signala');
% xlabel('n (diskretno vrijeme)');
% ylabel('Amplituda');

%% d2) Koliko uzoraka N je u jednoj periodi? Koliko je to sekundi, ako znamo da je Fs = 44100 Hz? Kolika je bila frekvencija vaših glasnica dok ste izgovarali "e"?

Fs= 44100; %Hz

N_ne1 = length(y1);         %funkcija vraća broj elemenata u vektoru y1, što je broj uzoraka u jednom periodu

disp(['Broj uzoraka N u periodi je: ', num2str(N_ne1)]); %number-to-string

T_ne1 = N_ne1/Fs;
disp(['Vrijeme jedne periode je: ', num2str(T_ne1), ' sekundi'])
disp(['Frekvencija mojih glasnica: ', num2str(1/T_ne1), ' Hz'])


%% d3) Generirajte umjetni periodični signal tako da sto puta ponovite snimljenu izrezanu periodu (naredba z1 = repmat(y1, 100, 1); ). Poslušajte takav signal (naredba soundsc(z1, Fs, Nb); )!
z1 = repmat(y1, 100, 2); 
soundsc(z1, Fs, Nb);

%% e) Ponovite isto za "da1", odnosno samoglasnik "a". Sada neka varijable budu y2, z2. Kolika je bila frekvencija vaših glasnica dok ste izgovarali "a"?

load('audioSignals.mat', 'da1'); 

y2 = da1(42431:42678);
%disp(size(y2));  % Ispisuje dimenzije signala y2 (1x255)
% Prikaz izdvojene periode
figure;
stem(y2, 'g', 'filled'); 
grid on;
title('Jedna perioda signala');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');

N_da1 = length(y2);         
disp(['Broj uzoraka N u periodi je: ', num2str(N_da1)]); %number-to-string

T_da1 = N_da1/Fs;
disp(['Vrijeme jedne periode je: ', num2str(T_da1), ' sekundi'])
disp(['Frekvencija mojih glasnica: ', num2str(1/T_da1), ' Hz'])

%% ZVUK A
z2 = repmat(y2, 100, 2); 
soundsc(z2, Fs, Nb);


%% ENERGIJA I SNAGA
%sum(abs(x).∧2)
syms t;         %syms t def t kao simboličku promjenjivu= može koristiti za simboličke 
                % operacije poput integracije, derivacije i manipulacije izrazima bez potrebe za numeričkim vrijednostima
T = 2;
x1 = sin(4*pi*t/T);
E_T = int(x1^2, t, 0, 2*T);
disp(['Totalna energija signala: ', char(E_T)]);

%E_T_int = int(f^2, t, 0, 2*T);
%E_T_sum = (1/Fs)*sum(abs(f).^2);

%% 3.1 energija
%clc;

Fs= 44100; %Hz

load('audioSignals.mat', 'da1'); 
y1 = da1(42431:42678);
z1 = repmat(y1, 100, 1); 
N_da1 = length(da1);
T_da1 = N_da1/Fs;

load('audioSignals.mat', 'da2'); 
y2 = da2(44166:44434);
z2 = repmat(y2, 100, 1); 
N_da2 = length(da2);
T_da2 = N_da2/Fs;

load('audioSignals.mat', 'ne1'); 
y3 = ne1(49219:49483);
z3 = repmat(y3, 100, 1); 
N_ne1 = length(ne1);
T_ne1 = N_ne1/Fs;

load('audioSignals.mat', 'ne2'); 
y4 = ne2(49765:50027);
z4 = repmat(y4, 100, 1); 
N_ne2 = length(ne2);
T_ne2 = N_ne2/Fs;

% Numerički izračun ukupne energije signala pomoću Eulerove aproksimacije
Eda1 = sum(abs(da1).^2) * T_da1;
Eda2 = sum(abs(da2).^2) * T_da2;
Ene1 = sum(abs(ne1).^2) * T_ne1;
Ene2 = sum(abs(ne2).^2) * T_ne2;

% Prikaz rezultata
fprintf('Eda1: %.4f\n' , Eda1);
fprintf('Eda2: %.4f\n', Eda2);
fprintf('Ene1: %.4f\n', Ene1);
fprintf('Ene2 %.4f\n', Ene2);

fprintf('Energije su dobre\n');

%% 3.2 Snaga periodičnog signala
%PT = (1/N)*sum(abs(da1).^2),

Pz1 = sum(abs(z1).^2)/(length(z1));         %da1
Pz2 = sum(abs(z3).^2)/(length(z3));	        %ne1

fprintf('Pz1: %e\n', Pz1);
fprintf('Pz2: %e\n', Pz2);

% Pz1k = sum(abs(z1).^2)/(Fs);
% Pz2k = sum(abs(z3).^2)/(Fs);

Pz1k = (Fs/(length(z1))) * sum(abs(z1).^2) * (1/Fs);
Pz2k = (Fs/(length(z3))) * sum(abs(z3).^2) * (1/Fs);

fprintf('Pz1k: %e\n', Pz1k);
fprintf('Pz2k: %e\n', Pz2k);
fprintf('DOBRO JE\n');

%Pz1=Pz1k

%% 4.1 Norma signala
%Izračunajte ℓ1 norme naših diskretnih signala da1, da2, ne1 i ne2 i vrijednosti
%spremite u varijable L1da1, L1da2, L1ne1 i L1ne2.

% L1x = sum(abs(x))
load('audioSignals.mat', 'da1'); 
load('audioSignals.mat', 'da2'); 
load('audioSignals.mat', 'ne1'); 
load('audioSignals.mat', 'ne2'); 

L1da1 = sum(abs(da1));
L1da2 = sum(abs(da2));
L1ne1 = sum(abs(ne1));
L1ne2 = sum(abs(ne2));

fprintf('L1da1: %.4f\n', L1da1);
fprintf('L1da2: %.4f\n', L1da2);
fprintf('L1ne1: %.4f\n', L1ne1);
fprintf('L1ne2: %.4f\n', L1ne2);

fprintf('dobro\n');

%% 4.2 Kutevi između signala
%cos φ = ⟨f, g⟩/(||f||*||g||) = Skalarni produkt ⟨f, g⟩ za diskretne signale iz ℓ2 definiran
%   u nazivniku su norme
    % Skalarni produkt <f, g> (računa sumu elemenata f[n] * kompleksno konjugirani g[n])
    %scalar_product = sum(f .* conj(g));

%matrica
load('audioSignals.mat', 'da1'); 
load('audioSignals.mat', 'da2'); 
load('audioSignals.mat', 'ne1'); 
load('audioSignals.mat', 'ne2'); 

tablica1 = zeros(4,4);
a = {da1 da2 ne1 ne2};
b = {da1 da2 ne1 ne2};
for i = 1: 1: 4 
    for j = 1: 1: 4
        %fprintf('(%d, %d)   ', i, j);
        x = pi/2 - acos( sum(a{i}.*b{j}) / (sqrt(sum(abs(a{i}).^2))*sqrt(sum(abs(b{j}).^2))) );
        tablica1(i,j) = real(abs(x));
    end
    %fprintf(' \n');
end

tablica1
kutDa1Da1 = pi/2 - tablica1(1,1);
kutDa1Da2 = pi/2 - tablica1(1,2);
kutDa1Ne1 = pi/2 - tablica1(1,3);
kutDa1Ne2 = pi/2 - tablica1(1,4);

kutDa2Da2 = (pi/2 - tablica1(2,2));
kutDa2Ne1 = pi/2 - tablica1(2,3);
kutDa2Ne2 = pi/2 - tablica1(2,4);

kutNe1Ne1 = (pi/2 - tablica1(3,3));
kutNe1Ne2 = pi/2 - tablica1(3,4);

kutNe2Ne2 = (pi/2 - tablica1(4,4));

fprintf('kutDa1Da1: %.4f\n', kutDa1Da1);
fprintf('kutDa1Da2: %.4f\n', kutDa1Da2);
fprintf('kutDa1Ne1: %.4f\n', kutDa1Ne1);
fprintf('kutDa1Ne2: %.4f\n', kutDa1Ne2);

fprintf('\nkutDa2Da2: %.4f\n', kutDa2Da2);
fprintf('kutDa2Ne1: %.4f\n', kutDa2Ne1);
fprintf('kutDa2Ne2: %.4f\n', kutDa2Ne2);

fprintf('\nkutNe1Ne1: %.4f\n', kutNe1Ne1);
fprintf('kutNe1Ne2: %.4f\n', kutNe1Ne2);

fprintf('\nkutNe2Ne2: %.4f\n', kutNe2Ne2);

%% čisti
%clc;
%clear all;
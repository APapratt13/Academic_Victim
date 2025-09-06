%% ENERGIJA I SNAGA
%najelegantnija implementacija je skalarni produkt dvaju vektora:Et = x′ ∗ x;
%Redak-vektor množimo sa stupac-vektorom. Zapamtimo taj trik za buduće zadatke!

%sum(abs(x).∧2)

%% energija primjer
% Totalnu energiju kontinuiranog signala računamo kao: ET = integral(|x(t)|^2)dt.
%Kolika je totalna energija signala x1 (t) = sin(4πt/T) na intervalu t ∈ [0, 2T] uz T = 2? 
% %Izračunajte analitički olovkom na papiru.
%Isti problem izračunajte analitički korištenjem paketa za simboličku matematiku.

syms t;         %syms t def t kao simboličku promjenjivu= može koristiti za simboličke 
                % operacije poput integracije, derivacije i manipulacije izrazima bez potrebe za numeričkim vrijednostima
T = 2;
x1 = sin(4*pi*t/T);
E_T = int(x1^2, t, 0, 2*T);
disp(['Totalna energija signala: ', char(E_T)]);

%E_T_int = int(f^2, t, 0, 2*T);
%E_T_sum = (1/Fs)*sum(abs(f).^2);

n=0:4;
Ts = 0.25;
xz = cos(2*pi*n*Ts);
E_aprox = (Ts)*sum(abs(xz).^2);
fprintf('%d\n', E_aprox);

%% Eulerova aprox energije signala
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
% Eda1 = sum(abs(da1).^2) * T_da1;
% Eda2 = sum(abs(da2).^2) * T_da2;
% Ene1 = sum(abs(ne1).^2) * T_ne1;
% Ene2 = sum(abs(ne2).^2) * T_ne2;

Eda1=(da1.')*da1;
Eda2=(da2.')*da2;
Ene1=(ne1.')*ne1;
Ene2=(ne2.')*ne2;

% Prikaz rezultata
fprintf('Eda1: %.4f\n' , Eda1);
fprintf('Eda2: %.4f\n', Eda2);
fprintf('Ene1: %.4f\n', Ene1);
fprintf('Ene2 %.4f\n', Ene2);

fprintf('Energije su dobre\n');

%% Snaga periodičnog signala
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

%% ČIŠĆENJE
clc;
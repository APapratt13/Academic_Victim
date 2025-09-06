%% PERIODIČNOST
%Najprije razmatramo signale x1(t) = sin(4πt/T) i x2(t) = sin(2πt^2/T) pri 
% cemu je konstanta T=2

%% a) crtanje dva signala na intervalu t e [0, 2T] korištenjem figure, plot(...)
%   Kako ćete zadati vektor t? Neka korak vremena bude T/1000.
%   Hoćete li u izrazu za t2 koristiti t∧2 ili t.∧2. Zašto? 
%   Možete li temeljem dobivenih slika zaključiti da li je pojedini signal 
%   periodičan ili nije?
T = 2;
t = 0:T/1000:2*T;              %vektort grafa je u obliku početak:korak:kraj

x1 = sin(4*pi*t/T);
x2 = sin(2*pi*t.^2/T);          %vektori su matrice pa je t^2 potencirana 
                                %matrica i tako ju treba tretirati

figure, plot(t, x1), grid on            %periodičan: ponavlja se isti  
title('Signal x1(t) = sin(4pi t / T)')  %segment u jednakim intervalima
xlabel('t'), ylabel('x1(t)')

figure, plot(t, x2), grid on            %aperiodičan: ne ponavlja se isti 
title('Signal x2(t) = sin(2pi t / T)')  %segment u jednakim intervalima
xlabel('t'), ylabel('x2(t)')


%% b) periodičnost VKS (CTS) 
% Vremenski kontinuirani signal x(t) je periodičan ako postoji temeljni
% period T0 takav da x(t)=x(t+T0) za svaki t iz skupa realnih brojeva
% (T0>0)


%% c) Po def, ispitati koji su od zadanih periodični i odrediti T0
T01 = 1;  

% Tražimo najmanji period za koji važi sin funkcije 
while abs(sin(4*pi*t/T) - sin(4*pi*(t + T01)/T)) > eps      %Umjesto direktnog uspoređivanja sa ~=, koristimo abs(sin1 - sin2) > eps, što omogućava uspoređivanje dva broja sa tolerancijom greške. eps je najmanja razlika između dva broja u MATLAB-u
    T01 = T01 + 1;
    if T01 > 100 % Osiguranje da ne uđemo u beskonačnu petlju
        disp("x1 je aperiodičan");
        return;
    end
end
if max(abs(sin(4*pi*(t + T01)/T) - sin(4*pi*(t + 2*T01)/T))) <= 1e-6
    disp("x1 je periodičan");
    fprintf("Najmanji period T0 = %d\n", T01);  %T01=1
else
    disp("x1 je aperiodičan");
end

T02=1;
while abs(sin(2*pi*t.^2/T) - sin(2*pi*(t + T02).^2/T)) > eps      
    T02 = T02 + 1;
    if T02 > 100 % Osiguranje da ne uđemo u beskonačnu petlju
        disp("x2 je aperiodičan");
        return;
    end
end
if max(abs(sin(2*pi*(t + T01).^2/T) - sin(2*pi*(t + 2*T01).^2/T))) <= 1e-6
    disp("x2 je periodičan");
    fprintf("Najmanji period T0 = %d\n", T02);
else
    disp("x2 je aperiodičan");  %x2 je aperiodičan
end


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



%% TEST NE2
Fs = 44100;
load('audioSignals.mat', 'ne2'); 

zvuk_ne2 = ne2(49765:50027);
figure;
stem(zvuk_ne2, 'b', 'filled'); 
grid on;
title('Jedna perioda signala');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');

N_ne2 = length(zvuk_ne2);         
disp(['Broj uzoraka N u periodi je: ', num2str(N_ne2)]); %number-to-string

T_ne2 = N_ne2/Fs;
disp(['Vrijeme jedne periode je: ', num2str(T_ne2), ' sekundi'])
disp(['Frekvencija mojih glasnica: ', num2str(1/T_ne2), ' Hz'])

%% ZVUK E2
zZvuk_ne2 = repmat(zvuk_ne2, 100, 2); 
soundsc(zZvuk_ne2, Fs, Nb);

%% close
%close all;
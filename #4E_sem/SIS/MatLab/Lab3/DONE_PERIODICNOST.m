%%2.PERIODICNOST;

%% 2d) periodičnost signala ne1
load('audioSignals.mat', 'ne1'); 

y1 = ne1(46940:47186);
%Prikaz izdvojene periode
figure;
stem(y1, 'r', 'filled'); 
grid on;
title('Jedna perioda signala E');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');


Fs= 44100; %Hz

N_ne1 = length(y1);         %funkcija vraća broj elemenata u vektoru y1, što je broj uzoraka u jednom periodu

disp(['N_ne1: ', num2str(N_ne1)]); %number-to-string

T_ne1 = N_ne1/Fs;
disp(['T_e: ', num2str(T_ne1), ' sekundi'])
disp(['f_e: ', num2str(1/T_ne1), ' Hz'])

%umjetni signal
z1 = repmat(y1, 100, 2); 
soundsc(z1, Fs, Nb);

%% 2e) periodičnost signala da1
load('audioSignals.mat', 'da1'); 

y2 = da1(44023:44265);
%disp(size(y2));  % Ispisuje dimenzije signala y2 (1x255)
% Prikaz izdvojene periode
figure;
stem(y2, 'g', 'filled'); 
grid on;
title('Jedna perioda signala A');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');

N_da1 = length(y2);         
disp(['N_a: ', num2str(N_da1)]); %number-to-string

T_da1 = N_da1/Fs;
disp(['T_a: ', num2str(T_da1), ' sekundi'])
disp(['f_a: ', num2str(1/T_da1), ' Hz'])

%umjetni signal
z2 = repmat(y2, 100, 2); 
soundsc(z2, Fs, Nb);
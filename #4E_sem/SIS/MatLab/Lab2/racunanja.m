%% Periodičnost
fprintf('\n - - - - - - - - - 2.Periodičnost - - - - - - - - - - - - - - - - - -');
Fs= 44100; %Hz
%uzorak jedne periode signala NE1
load('audioSignals.mat', 'ne1'); 
y1 = ne1(49219:49483);  
figure;
stem(y1, 'r', 'filled'); 
grid on;
title('Jedna perioda signala');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');

N_ne1 = length(y1);         
disp(['Broj uzoraka N u periodi E je: ', num2str(N_ne1)]); %number-to-string

T_glas_ne1 = N_ne1/Fs;
disp(['Vrijeme jedne periode E je: ', num2str(T_ne1), ' sek'])
disp(['Frekvencija mojih glasnica: ', num2str(1/T_ne1), ' Hz'])

z1 = repmat(y1, 100, 2); 
soundsc(z1, Fs, Nb);

%uzorak jedne periode signala DA1
load('audioSignals.mat', 'da1'); 
y2 = da1(42431:42678);
figure;
stem(y2, 'g', 'filled'); 
grid on;
title('Jedna perioda signala');
xlabel('n (diskretno vrijeme)');
ylabel('Amplituda');

N_da1 = length(y2);         
disp(['Broj uzoraka N u periodi A je: ', num2str(N_da1)]); %number-to-string

T_glas_da1 = N_da1/Fs;
disp(['Vrijeme jedne periode A je: ', num2str(T_da1), ' sek'])
disp(['Frekvencija mojih glasnica: ', num2str(1/T_da1), ' Hz'])

z2 = repmat(y2, 100, 2); 
soundsc(z2, Fs, Nb);

%% Energija i snaga
fprintf('\n - - - - - - - - - 3. Energija i snaga - - - - - - - - - - - - - - - - - -');
Fs= 44100; %Hz

load('audioSignals.mat', 'da1'); 
N_da1 = length(da1);
T_da1 = N_da1/Fs;

load('audioSignals.mat', 'da2'); 
N_da2 = length(da2);
T_da2 = N_da2/Fs;

load('audioSignals.mat', 'ne1'); 
N_ne1 = length(ne1);
T_ne1 = N_ne1/Fs;

load('audioSignals.mat', 'ne2'); 
N_ne2 = length(ne2);
T_ne2 = N_ne2/Fs;

% energjia
Eda1 = sum(abs(da1).^2) * T_da1;
Eda2 = sum(abs(da2).^2) * T_da2;
Ene1 = sum(abs(ne1).^2) * T_ne1;
Ene2 = sum(abs(ne2).^2) * T_ne2;

fprintf('Eda1: %.4f\n' , Eda1);
fprintf('Eda2: %.4f\n', Eda2);
fprintf('Ene1: %.4f\n', Ene1);
fprintf('Ene2 %.4f\n', Ene2);

fprintf('Energije su dobre\n');

%snaga
Pz1 = sum(abs(z1).^2)/(length(z1));         %da1
Pz2 = sum(abs(z3).^2)/(length(z3));	        %ne1

fprintf('Pz1: %e\n', Pz1);
fprintf('Pz2: %e\n', Pz2);

Pz1k = (Fs/(length(z1))) * sum(abs(z1).^2) * (1/Fs);
Pz2k = (Fs/(length(z3))) * sum(abs(z3).^2) * (1/Fs);

fprintf('Pz1k: %e\n', Pz1k);
fprintf('Pz2k: %e\n', Pz2k);

fprintf('DOBRO JE\n');

%Pz1=Pz1k

%% Norme
% L1x = sum(abs(x))
fprintf('\n - - - - - - - - - - - - - 4. Norme - - - - - - - - - - - - - - - - - - - - -');
load('audioSignals.mat', 'da1'); 
load('audioSignals.mat', 'da2'); 
load('audioSignals.mat', 'ne1'); 
load('audioSignals.mat', 'ne2'); 

L1da1 = sum(abs(da1));
L1da2 = sum(abs(da2));
L1ne1 = sum(abs(ne1));
L1ne2 = sum(abs(ne2));

fprintf('L1da1: %.4f\n', L1da1);
fprintf('L1da1: %.4f\n', L1da1);
fprintf('L1da2: %.4f\n', L1da2);
fprintf('L1ne1: %.4f\n', L1ne1);
fprintf('L1ne2: %.4f\n', L1ne2);

fprintf('dobro\n');

%matrica kuteva
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
fprintf(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
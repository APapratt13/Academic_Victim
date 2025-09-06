%% NORME

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

%% čišćenje
clc;
%% prva sekcija
% izračun rezultata
a1 = [1, 2, -1, -2, 3];  % kreirajmo a1
b1 = [0, 1, -1, -1, -2];  % kreirajmo a2

rez = a1 .^ b1;  % potenciranje po elementima
disp(rez)  % prikaz rezultata

%% druga sekcija
% crtanje rezultata
figure;
stem(rez)
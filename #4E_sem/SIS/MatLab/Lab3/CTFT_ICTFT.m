%% Define symbolic variables
%prikazuje primjer kako izračunati Fourierovu transformaciju za centrirani pravokutni puls x(t) = μ(t+12)−μ(t−12) jedinične površine
syms t w real
% Define parameter a
a = 4;

%% Define signal x
x = heaviside(t + a/2) - heaviside(t - a/2); %centrirani pravokutni puls x(t) = μ(t+12)−μ(t−12) jedinične površin

% Plot x
figure, ezplot(x, [-a/2 - 1, a/2 + 1]), grid on, title('Signal x')

%% Calculate CTFT
X = fourier(x, w);
pretty(simplify(X)) % simplify and display X    %CTFT od gate funkcije je sinc^2

%% Plotting magnitude and phase response...

% Amplitude/Magnitude
figure, ezplot(abs(X), [-20, 20]), grid on,     
title('Amplitudni spektar')

% Phase
figure, ezplot(atan(imag(X) / real(X)), [-20, 20]), grid on,
title('Fazni spektar')

%% Calculate ICTFT
xr = ifourier(X, t);                            %ICTFT od sinc^2 je gate funkcija - vracamo se nazad

% Plot xr
figure, ezplot(xr, [-a/2 - 1, a/2 + 1]), grid on,
title('Signal x dobiven primjenom ICTFT-a')

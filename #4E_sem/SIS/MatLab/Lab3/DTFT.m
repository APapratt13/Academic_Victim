% Signal x
x = [1 -1 2 1];

% Define vector omega
w = linspace(-pi, pi, 5000);

% Determine DTFT
X = freqz(x, 1, w);

% Plotting Magnitude and Phase
figure, plot(w, abs(X)), grid on;
title('Amplitudni spektar');

figure, plot(w, angle(X)), grid on;
title('Fazni spektar');

%% energija
E = sum(abs(x).^2);

fprintf("energija: %.2f\n", E);
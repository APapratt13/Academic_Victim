%% Define symbolic variables
syms t k real

% Define signal x and calculate period
omega01 = 60*pi;
omega02 = 10*pi;
x = 10*sin(omega01*t) + 5*cos(omega02*t);
T01 = 2*pi/omega01;
T02 = 2*pi/omega02;
T0 = 0.2;

%% Calculate CTFS by definition
X = int(x * exp(-2*pi*1j/T0 * t * k), -T0/2, T0/2) / T0;
pretty(simplify(X)) % Display solution

%% Evaluate symbolic function at n = -7 to 7
n = -7:1:7;
X_values = zeros(length(n), 1); % Allocate memory

for nn = n
    X_values(nn - min(n) + 1) = subs(limit(X, k, nn));
end

%% Plotting Magnitude and Phase
figure, stem(n, abs(X_values)), grid on
title('Amplitudni spektar')

figure, stem(n, angle(X_values)), grid on
title('Fazni spektar')

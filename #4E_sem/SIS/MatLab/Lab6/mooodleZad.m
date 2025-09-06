%% ZAD1
%% A)
% Koeficijenti karakterističnog polinoma (uz y[n], y[n-1], y[n-2])
a = [1 0.8 0.6];

% Polovi su nule karakterističnog polinoma
poles = roots(a);

% Udaljenosti od ishodišta
distances = abs(poles);

disp('Polovi sustava:');
disp(poles);

disp('Udaljenosti polova od ishodišta:');
disp(distances);


%% c)
%y[n] + a1*y[n−1] + a2*y[n−2] = b0*u[n] + b1*u[n−1] + b2*u[n−2]
 
 % Definicija koeficijenata jednadžbe razlike
a = [1, 0.8, 0.6];              % Koeficijenti uz y[n], y[n-1], y[n-2]
b = [0.6, 0.5, 0.6];            % Koeficijenti uz delta[n], delta[n-1], delta[n-2]

N = 6;                          % Želimo h[n] za n = 0 do 5 (ukupno 6 uzoraka)
x = [1, zeros(1, N-1)];         % Ulaz je jedinicni impuls (delta funkcija)
y = zeros(1, N);                % Izlazni vektor (h[n])

% Rješavanje razlike korak po korak
for n = 1:N
    % Računanje izlaza y[n]
    % y[n] = -a(2)*y[n-1] - a(3)*y[n-2] + b(1)*x[n] + b(2)*x[n-1] + b(3)*x[n-2]
    
    yn1 = 0; yn2 = 0;
    if n-1 >= 1, yn1 = y(n-1); end
    if n-2 >= 1, yn2 = y(n-2); end

    xn = x(n);
    xn1 = 0; if n-1 >= 1, xn1 = x(n-1); end
    xn2 = 0; if n-2 >= 1, xn2 = x(n-2); end

    y(n) = -a(2)*yn1 - a(3)*yn2 + b(1)*xn + b(2)*xn1 + b(3)*xn2;
end

% Ispis rezultata
disp('Impulsni odziv h[n]:');
disp(y);

% Ispis vrijednosti za n = 5
fprintf('h[5] = %.5f\n', y(6));

%% D)
omega = pi/3;
z = exp(1j * omega); % e^(jω)

% Brojnik i nazivnik H(z)

num = 0.6 + 0.5/z+ 0.6/(z^2);
den = 1 + 0.8/z + 0.6/(z^2);

H = num / den;

amplitude = abs(H);

fprintf('\nAmplitudna karakteristika |H(e^{jω})| za ω = π/3 iznosi: %.4f\n', amplitude);


%% E)
phase = angle(H); % Faza u radijanima
phase_deg = rad2deg(phase); % Za ljepši prikaz u stupnjevima, ako želiš

fprintf('Fazna karakteristika ∠H(e^{jω}) za ω = π/3 iznosi: %.4f rad (%.2f°)\n', phase, phase_deg);
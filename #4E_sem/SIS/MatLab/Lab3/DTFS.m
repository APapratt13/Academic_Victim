% Signal x
x = [-1; 1; 2; 0; 1];

% Period length
N = length(x);

% DTFS of x
X = fft(x) / N;

% Amplitude plot
figure, stem(0:(N-1), abs(X)), grid on;

% Shifted amplitude plot
figure, stem(-2:2, abs(fftshift(X))), grid on;

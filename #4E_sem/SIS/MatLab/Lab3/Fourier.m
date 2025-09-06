load("lab2_predano.mat", 'da1', 'ne1', 'y1', 'z1', 'y2', 'z2');

%Y2 DTFS
x = y2;
% Period length
N = length(x); % N = 5
% DTFS of x is the FFT divided by the length.
y2dtfs = fft(x)/N;

%Y1 DTFS
x = y1;
% Period length
N = length(x); % N = 5
% DTFS of x is the FFT divided by the length.
y1dtfs = fft(x)/N;

%DA1 DTFT
x = da1;

 % Define vector omega
 w = linspace(-pi,pi,5000);

 % Determine DTFT
 da1dtft = freqz(x,1,w);

%NE1 DTFT
x = ne1;

% Define vector omega
w = linspace(-pi,pi,5000);

% Determine DTFT
ne1dtft = freqz(x,1,w);

%Z2 CTFS
l = -100:1:100;
z2ctfs = zeros(length(l),1);
N1 = length(y2); 
for k = l
    zbroj = 0;
    for n = 0:1:(N1-1)
        zbroj = zbroj + (z2(n+1) * exp((-1i*k)*((2*pi)/N1)*n));
    end
    z2ctfs(k-min(l)+1) = zbroj/N1;
end

%Z1 CTFS
l = -100:1:100;
z1ctfs = zeros(length(l),1);
N1 = length(y1); 
for k = l
    zbroj = 0;
    for n = 0:1:(N1-1)
        zbroj = zbroj + (z1(n+1) * exp((-1i*k)*((2*pi)/N1)*n));
    end
    z1ctfs(k-min(l)+1) = zbroj/N1;
end

 %Z2 FREQ, Z1 FREQ
 clc;
 fs = 44100;
 z1frek = fs / length(y1);
 z2frek = fs / length(y2);
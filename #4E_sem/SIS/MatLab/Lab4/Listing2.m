%%Listing 2: Izračun odziva korištenjem konvolucijske sume

h = ones(3,1);              % impulse response: [1; 1; 1]

N0 = 9;
u = ones(N0,1);             % input signal: N0 ones

y = conv(u, h, 'full');     % calculate linear convolution
y(6+1)
n = (0:length(y)-1).';      % define time axis for plotting

% plot the result
figure
stem(n, y)
grid on


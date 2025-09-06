%% Audio recorder initialization
Fs = 44100; % Sampling rate 44.1 kHz
Nb = 16; % Number of bits 16
Nc = 1; % Number of channels 1 (mono)
ID = -1; % Audio device identifier (default)
T = 4; % Recording duration 4 sec
info = audiodevinfo % Returns information about the input
% and output audio devices on the system
info.input(1) % Display the information about
% the first input device
% optional
% ID = 0; % uncomment to select the input audio device
% specified by the device identifier (ID) 0
% Create an audio recording object
recObj = audiorecorder(Fs, Nb, Nc, ID);


%% Audio player initialization
U = randn(T*Fs, 1); % Random noise
playObj = audioplayer(U, Fs);


%% Simultaneously execute the following two commands (Ctrl+ENTER):
recObj.record(T);
play(playObj)
%OVE DVIJE NAREDBE S CTRL V KOPIRATI I ONDA PRITISKATI STALNO CRTL ENTER DOK SE PRESTANE
%SNIMANJE, TEK ONDA KOPIRATI OVO ISPOD
%% Recorded data
Y = getaudiodata(recObj)*10000; % Extract the audio data
%% Check the recording
% Extract the central parts
U = wkeep(U, 2*Fs);
Y = wkeep(Y, 2*Fs);
% Plot the result
figure, plot(Y), grid
% Repeat the measurements if needed


% Phi = [Y(n-1) Y(n-2) U(n) U(n-1) U(n-2)]
% and
% Theta = [-a1 -a2 b0 b1 b2] '
Phi = [[0; Y(1:end-1)], [0; 0; Y(1:end-2)], ...
U, [0; U(1:end-1)], [0; 0; U(1:end-2)]];
% Solve the overdetermined system Phi * Theta = Y :
Theta = Y \ Phi;
% Such a solution ensures the least square error in Y
a = [1 -Theta(1:2)]; % Left hand side of the difference equation
b = Theta(3:end); % Right hand side of the difference equation

%% Results
figure
zplane(b, a) % Pole-zero plot

%% Mirroring poles to ensure the stability of the model
aroots = roots(a);
% Check if there are poles outside the unit circle...
ind = abs(aroots) > 1;
% ..and mirror them to the reciprocal positions:
aroots(ind) = aroots(ind) ./ abs(aroots(ind)).^2;
a = poly(aroots); % Back to the polynomial coefficients
figure
zplane(b, a) % Pole-zero plot after (eventual) stabilization


t = 0.04:0.04:4;
u = ones(size(t));
s = filter(b, a, u);
zi = [1, 1]
n = 0:1:99
u = cos(2*pi*440*n*(1/Fs));
yc = filter(b, a, u, zi);
im = imread('a1.jpeg'); % Read your face photo here
figure
image(im)
hold on
N = 20;
% Resize the photo to fit the full screen.
% Count out loud and click N times,
% starting from the top of the face.
% Proceed in a clockwise direction,
% marking the edges of the face.
% Counting will ensure that the intervals between the clicks are
% approximately 1 second.
% Note that N/4 clicks should be made in each quadrant.
[X, Y] = ginput(N); % Edge of the face coordinates
plot(X, Y);
% If you succeeded, the curve frames your face.
% If not - repeat the procedure!

%%
% Movement equation in the state-space representation:
% x[n+1] = x[n] + vx[n] * deltaT;
% vx[n+1] = vx[n];
% y[n+1] = y[n] + vy[n] * deltaT;
% vy[n+1] = vy[n];
%
% 4 equations in matrix form:
% Xst[n+1] = A * Xst[n];
% where state vector is: Xst = [x vx y vy] ' ;
% and the system matrix A is:
A = eye(4);
A(1,2) = 0.01; % deltaT
A(3,4) = 0.01;
% B=0 % Input matrix is zero
% Output matrix: only X and Y coordinates are observable:
C = [1 0 0 0; 0 0 1 0];
% D=0 % Input/output matrix is zero
% Initialization
Out = zeros(2, N); % Allocate space for the result
Xst = [X(1) 10 Y(1) 10]'; % Initial state vector
Out(:,1) = [X(1) Y(1)]';
P = eye(4);
for n=2:N
% State equation
Xst = A * Xst; % A - equation of movement in matrix form
% Output equation
Out(:,n) = C*Xst;
% A little bit of magic
P = A*P*A' + eye(4);
% Correction using the real data
K = P*C' / (C*P*C'); % gain
Xst = Xst + K*([X(n); Y(n)] - C * Xst);
% Correction = gain * error
P = (eye(4) - K*C)*P;
end
%% Plot the result
plot(Out(1,:)', Out(2,:)', 'y')
hold off


%% Pogreške
xErr = 0;
yErr = 0;
xErrMax = 0;
yErrMax = 0;
for i = 1 : 20
 if(abs(X(i) - Out(1,i)) > xErrMax)
 xErrMax = abs(X(i) - Out(1,i));
 end
 if(abs(Y(i) - Out(2,i)) > yErrMax)
 yErrMax = abs(Y(i) - Out(2,i));
 end
 xErr = xErr + (X(i) - Out(1,i))^2;
 yErr = yErr + (Y(i) - Out(2,i))^2;
end
xErr = xErr / 20;
yErr = yErr / 20;
[h,t] = impz(b,a, 100)
%clearvars -except a b h s yc X Y Out xErr yErr xErrMax yErrMax
save('0036558491.mat', 'a', 'b', 'h', 's', 'yc', 'X', 'Y', 'Out', 'xErr', 'yErr', 'xErrMax', 'yErrMax');

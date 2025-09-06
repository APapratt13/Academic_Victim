%% prikaz signala
load('audioSignals.mat', 'da1'); 
figure;
plot(da1);  % Plavi kontinuirani graf
grid on;
title('Signal da1');
xlabel('Vrijeme (uzorci)');
ylabel('Amplituda');

load('audioSignals.mat', 'da2'); 
figure;
plot(da2);  % Plavi kontinuirani graf
grid on;
title('Signal da2');
xlabel('Vrijeme (uzorci)');
ylabel('Amplituda');

load('audioSignals.mat', 'ne1'); 
figure;
plot(ne1);  % Plavi kontinuirani graf
grid on;
title('Signal ne1');
xlabel('Vrijeme (uzorci)');
ylabel('Amplituda');

load('audioSignals.mat', 'ne2'); 
figure;
plot(ne2);  % Plavi kontinuirani graf
grid on;
title('Signal ne1');
xlabel('Vrijeme (uzorci)');
ylabel('Amplituda');



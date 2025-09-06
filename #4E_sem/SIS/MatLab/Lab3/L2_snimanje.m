%% Execute the following four lines (Ctrl+ENTER) and say a word:
disp('Start speaking.');
recordblocking(recObj, T)
disp('End of recording.');

x1 = getaudiodata(recObj); % Extract the audio data
da1 = x1;
%% Check the recording
% Plot the result
figure, plot(x1), grid

% Listen to the recording
soundsc(x1, Fs, Nb);

% Repeat the procedure until obtaining a satisfactory recording
% -------------------------------------------------------------------------


%% Execute the following four lines (Ctrl+ENTER) and say a word:
disp('Start speaking.');
recordblocking(recObj, T)
disp('End of recording.');

x2 = getaudiodata(recObj); % Extract the audio data
da2 = x2;
%% Check the recording
% Plot the result
figure, plot(x2), grid

% Listen to the recording
soundsc(x2, Fs, Nb);

% Repeat the procedure until obtaining a satisfactory recording
% -------------------------------------------------------------------------

%% Execute the following four lines (Ctrl+ENTER) and say a word:
disp('Start speaking.');
recordblocking(recObj, T)
disp('End of recording.');

x3 = getaudiodata(recObj); % Extract the audio data
ne1 = x3;
%% Check the recording
% Plot the result
figure, plot(x3), grid

% Listen to the recording
soundsc(x3, Fs, Nb);

% Repeat the procedure until obtaining a satisfactory recording
% -------------------------------------------------------------------------

%% Execute the following four lines (Ctrl+ENTER) and say a word:
disp('Start speaking.');
recordblocking(recObj, T)
disp('End of recording.');

x4 = getaudiodata(recObj); % Extract the audio data
ne2 = x4;
%% Check the recording
% Plot the result
figure, plot(x4), grid

% Listen to the recording
soundsc(x4, Fs, Nb);

% Repeat the procedure until obtaining a satisfactory recording
% -------------------------------------------------------------------------
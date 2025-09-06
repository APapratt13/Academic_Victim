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


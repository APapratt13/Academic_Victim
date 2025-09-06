function sig = alignsig(ref, sig)
%ALIGNSIG
% [SIG] = ALIGNSIG(REF, SIG)
% Aligns SIG to REF, adjust SIG length to REF length

% Correlation == convolution with reversed sig
corrRefSig = conv(ref, sig(end:-1:1));
% Maximum corresponds to the best alignment
[~, ind] = max(abs(corrRefSig));
% Calculate delay of sig to the reference
delay = length(sig) - ind;

if delay > 0 % sig is delayed
sig(1:delay) = []; % remove the delay
elseif delay < 0 % sig is advanced
sig(1-delay:end-delay) = sig; % add the delay
sig(1:-delay) = 0;
end

% adjust the length of sig
len = length(ref);
sig(len+1) = 0; % extend
sig(len+1:end) = []; % cut the surplus
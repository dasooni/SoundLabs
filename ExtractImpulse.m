function ExtractImpulse(sweepfile, impulsefile)
% Uses a recorded frequency sweep in stereo, sweepfile to calculate 
% the corresponding impulse response, and saves the file in impulsefile
% The sweep needs to be recorde using sweep15s.wav

% Generates some info from the sweep need
[test, testfft, sweeprate]=synthSweep(15,44100, 30, 20000);
[y Fs]=audioread(sweepfile);
[irLin, irNonLin] = extractIRstereo(y, testfft);
audiowrite(impulsefile,irLin, Fs);
 
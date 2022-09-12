function Convolutionreverbb(audiofile, IRfile, Reverbfile)

% Läs audiofilen
filename=audiofile;
[x,Fs] = audioread(filename);

% Läs impulsrespons

filename=IRfile;

[imp,Fsimp] = audioread(filename);


% Do convolution with FFT%
y = fconv(x,imp);
%y=conv(x,imp);


% write output
audiowrite(Reverbfile,y,Fs);


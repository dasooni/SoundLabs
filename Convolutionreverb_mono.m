function Convolutionreverbb(audiofile, IRfile, Reverbfile)

% L�s audiofilen
filename=audiofile;
[x,Fs] = audioread(filename);

% L�s impulsrespons

filename=IRfile;

[imp,Fsimp] = audioread(filename);


% Do convolution with FFT%
y = fconv(x,imp);
%y=conv(x,imp);


% write output
audiowrite(Reverbfile,y,Fs);


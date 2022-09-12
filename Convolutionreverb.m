function Convolutionreverb(audiofile, IRfile, Reverbfile)

% Läs audiofilen
[input_audio,Fs] = audioread(audiofile);
left_input=input_audio; %[:,1];
right_input=input_audio;
% Läs impulsrespons

[imp,Fsimp] = audioread(IRfile);
left_imp=imp(:,1);
right_imp=imp(:,2);

% Do convolution with FFT%
out_left = fconv(left_input,left_imp);
out_right = fconv(right_input,right_imp);

output_data=[out_left out_right];


% write output
audiowrite(Reverbfile,output_data, Fs);

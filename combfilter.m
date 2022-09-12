function[]=combfilter(filename, newfile, delay)

% Per Sandström 2012

% delay in ms
[input,samp_rate]=audioread(filename); 
delaypoints= abs(round(delay*samp_rate/1000));
input=input.';
delay=abs(delay);

quiet=zeros(1, delaypoints);

delayed_input = [quiet input];
original_input =[input quiet];
summed_input= (delayed_input + original_input)/2;

% slå ihop kanalerna och skapa en
% N X 2 matris (2 kanaler) samt normalisera
% peak1=max(abs(left_input));
% peak2=max(abs(right_input));
% peak=max(peak1, peak2);
% left_input=left_input/peak;
% right_input=right_input/peak;
% mono=
% left_input=left_input.';
% right_input=right_input.';

% final_out=[left_input right_input];

summed_input=summed_input';
clear delayed_input original_input;

% Spara Wav-fil
audiowrite(newfile, summed_input ,samp_rate);
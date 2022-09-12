function[]=phasepanning(filename, newfile, delay)

% Per Sandström 2012

% delay in ms
[left_input,samp_rate]=audioread(filename); 
delaypoints= abs(round(delay*samp_rate/1000));
left_input=left_input.';
right_input=left_input;

quiet=zeros(1, delaypoints);

if (delay >= 0)  
right_input= [quiet right_input];
left_input= [left_input quiet];
end;

if (delay < 0)  
right_input= [right_input quiet];
left_input= [quiet left_input];
end

% slå ihop kanalerna och skapa en
% N X 2 matris (2 kanaler) samt normalisera
peak1=max(abs(left_input));
peak2=max(abs(right_input));
peak=max(peak1, peak2);
left_input=left_input/peak;
right_input=right_input/peak;
left_input=left_input.';
right_input=right_input.';

final_out=[left_input right_input];


clear left_input right_input;

% Spara Wav-fil
audiowrite(newfile, final_out,samp_rate);
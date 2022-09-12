%% PANNING EFFECT ON MONO-AUDIO INPUT.
% Copyright (c) 2012, Vinay Kumar Tadepall BSD-license
% Modified by Per Sandström to save wav-file
function[]=panning(filename, newfile)

% Reading a mono-audio input which is of type N X 1 (columns represent
% number of channels)
%[left_input,samp_rate]=wavread(filename);  
[left_input,samp_rate] = audioread(filename);
right_input=left_input;

% Dividing the sample length into uniform blocks of smaller size.
range=(length(left_input)/400):(length(left_input)/400):length(left_input);
pan=-1;  % Initialization of "pan" value.
i=1;
j=1;

while(i<=length(left_input)) 
    while(pan<1)
        while(i<=range(j))

            % Code to create panning effect.
            left_input(i)=left_input(i)-(pan*left_input(i));
            right_input(i)=right_input(i)+(pan*right_input(i));
            
            i=i+1;
        end
        j=j+1;
        
        % Changing the "pan" value in uniform steps.
        pan=pan+0.05;
    end
    while(pan>-1)
        while(i<=range(j))
            
            % Code to create panning effect.
            left_input(i)=left_input(i)-(pan*left_input(i));
            right_input(i)=right_input(i)+(pan*right_input(i));
            
            i=i+1;
        end
        j=j+1;
        
        % Changing the "pan" value in uniform steps.
        pan=pan-0.05;
    end
end

% Combining the left_input and right_input to make a stereo signal of type
% N X 2 matrix (2 channels)
peak1=max(abs(left_input));
peak2=max(abs(right_input));
peak=max(peak1, peak2);
left_input=left_input/peak;
right_input=right_input/peak-0.01;
final_out=[left_input right_input];
clear left_input right_input;

% playing the stereo output to the PC audio speaker.
%audiowritewrite(final_out,samp_rate, newfile)

audiowrite(newfile, final_out, samp_rate)
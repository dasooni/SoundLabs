%% PANNING EFFECT ON MONO-AUDIO INPUT.
function[]=panning1()
samp_rate=11025; % Default value of Sample rate.
while(1)
    pan=-1;
    while(pan<1)
        i=1;    
        % Recording the PC audio input device.
        left_input=wavrecord(10*samp_rate,samp_rate,'double');
        right_input=left_input;
        while(i<=length(left_input))        
            
            % Code for panning effect.
            left_input(i)=left_input(i)-(pan*left_input(i));
            right_input(i)=right_input(i)+(pan*right_input(i));
            i=i+1;
        end
        
        % Combining the left_input and right_input to create a stereo
        % signal of type N X 2 (2 channels).
        final_out=[left_input right_input];
        clear left_input right_input;
            
        % playing the stereo output to the PC audio speaker.
        wavplay(final_out)
            
        % Changing the "pan" value in uniform steps.
        pan=pan+0.2;
     end
     while(pan>-1)
        i=1;
        left_input=wavrecord(10*samp_rate,samp_rate,'double');
        right_input=left_input;
        while(i<=length(left_input))
                
            % Code for panning effect.
            left_input(i)=left_input(i)-(pan*left_input(i));
            right_input(i)=right_input(i)+(pan*right_input(i));
            i=i+1;
        end
            
        % Combining the left_input and right_input to create a stereo
        % signal of type N X 2 (2 channels).
        final_out=[left_input right_input];
        clear left_input right_input;
            
        % playing the stereo output to the PC audio speaker.
        wavplay(final_out)
            
        % Changing the "pan" value in uniform steps.
        pan=pan-0.2;
     end  
end
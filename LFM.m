function [outputY] = LMF(x,fmFreq,Fs,fmDepth,waveForm,dutyC)

[r,c]=size(x);

if (r==1),   % convert row vector to column
    x = x(:);  len = c;
else
    len = r;
end

t = (0:1/Fs:((len-1)/Fs))';
t = t(:,ones(1,size(x,2)));

kf = (fmFreq/Fs)*2*pi/fmDepth;

switch waveForm
    case '1'
        if 0
            % grunden
            outputY = sin(2*pi*fmFreq*t + kf*cumsum(x));
        else
            outputY = sin(kf*cumsum(x));
        end
    case '2'
        outputY = sawtooth(kf*cumsum(x),dutyC);
    case '3'
        outputY = square(kf*cumsum(x),dutyC);
end


end
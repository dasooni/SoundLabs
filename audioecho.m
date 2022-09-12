function [ output] = audioecho( signal, delaytime, gain, fs)
% antal sampel att fördröja
N=round(delaytime*fs);

% skapa en tillräckligt lång utvektor
output=zeros(1,length(signal)*2+N);
% Fyll på signalen i utvektorn
for n=1:length(signal);
    output(n)=signal(n);
end
signal=[signal zeros(1,length(signal)+N)];

% Fördröjningsledningen
for n=N+1:length(output);
    output(n)=signal(n)+gain*signal(n-N);
end

% Normalisera till max 1
output=output/max(abs(output));  
end


function [irLin, irNonLin] = extractIRnew(sweep_response, invsweepfft)
% 

% EXTRACTIR Extract impulse response from swept-sine response.
%   [irLin, irNonLin] = extractIR(sweep_response, invsweepfft) 
%   Extracts the impulse response from the swept-sine response.  Use
%   synthSweep.m first to create the stimulus; then pass it through the
%   device under test; finally, take the response and process it with the
%   inverse swept-sine to produce the linear impulse response and
%   non-linear simplified Volterra diagonals.  The location of each
%   non-linear order can be calculated with the sweepRate - this will be
%   implemented as a future revision.
%   
%   Developed at Oygo Sound LLC
%
%   Equations from Muller and Massarani, "Transfer Function Measurement
%   with Sweeps."

if(size(sweep_response,1) > 1)
    sweep_response = sweep_response';
end
left_sweep=sweep_response(:,1);
right_sweep=sweep_response(:,2);

N = length(invsweepfft);
left_sweepfft = fft(left_sweep,N);
right_sweepfft = fft(right_sweep,N);
%%% convolve sweep with inverse sweep (freq domain multiply)

left_ir = real(ifft(invsweepfft'.*left_sweepfft));
left_ir = circshift(left_ir', length(left_ir)/2); 
left_irLin = left_ir(end/2+1:end);
left_irNonLin = left_ir(1:end/2);

right_ir = real(ifft(invsweepfft'.*right_sweepfft));
right_ir = circshift(right_ir', length(right_ir)/2); 
right_irLin = right_ir(end/2+1:end);
right_irNonLin = right_ir(1:end/2);

lIr=left_irLin';
rIr=right_irLin';

irLin=[lIr rIr];
normfactor=max(irLin);
normfactor=max(normfactor);
irLin = irLin/normfactor;
irNonLin=[left_irNonLin right_irNonLin];
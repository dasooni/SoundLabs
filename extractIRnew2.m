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


left_sweep=sweep_response(:,1);
right_sweep=sweep_response(:,2);

%%% convolve sweep with inverse sweep (freq domain multiply)

[left_ir, irNonLin] = extractIR(left_sweep, invsweepfft);
[right_ir, irNonLin] = extractIR(right_sweep, invsweepfft);

lIr=left_ir;
rIr=right_ir;

irLin=[lIr rIr];
normfactor=max(irLin);
normfactor=max(normfactor);
irLin = irLin/normfactor;
irNonLin=[irNonLin irNonLin];
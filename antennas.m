%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code generates planar antenna arrays model                                %                                                   %
% This is version 1.0 (Last edited: 2022-07-25)                                  %
% Author: N. Chukhno                                                             %
% University Mediterranea of Reggio Calabria, Italy and CNIT, Italy.             %
% Universitat Jaume I, Spain                                                     %
% Email: nadezda.chukhno@unirc.it                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%A. B. Constantine, Antenna Theory: Analysis and Design. Wiley Interscience, 2005.
% table with gains is provided in https://trepo.tuni.fi/bitstream/handle/10024/136731/Optimal_Multicasting_in_Millimeter_Wave_5G_NR_Systems_with_Multi_beam_Directional_Antennas.pdf?sequence=1
%Chukhno, Nadezhda, et al. "Optimal Multicasting in Millimeter Wave 5G NR with 
%Multi-beam Directional Antennas." IEEE Transactions on Mobile Computing (2021).

clear all
N=64; % number of antenna elements in horizontal plane
theta=102/N; % HPBW (approximation)
betta=0; %the phase excitation difference affecting the physical orientation of the array.
pl_th=acos(-betta+2.782/(N*pi)); % the upper and the lower 3-dB points
n_th=acos(-betta-2.782/(N*pi)); %the upper and the lower 3-dB points a
alpha=2*abs((pi/2-n_th))*180/pi; %HPBW
g=(pl_th-n_th);
fun = @(t) sin(N*pi.*cos(t)./2)./sin(pi.*cos(t)./2);
q = integral(fun,n_th,pl_th);
linear_gain=q/g
gain_dbi=pow2db(linear_gain)



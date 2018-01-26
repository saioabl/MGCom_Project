%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% m-file for model: VSC_Grid_MyModel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear 
close all  

% *************************************************************************
% Basic Model parameters
% *************************************************************************
Ts = 2e-4; % s, sampling time
fs = 1/Ts; % Hz, sampling frequency
fsw = fs; % Hz, switching frequency


% *************************************************************************
% Physical Model VSC 
% *************************************************************************

% DC-link
C_dc = 5000e-06; % F, dc-link capacitor
V_dc = 680; % V, dc voltage source
R_dc = 1e-5; % ohms, dc-link resitance

% IGBT bridge
Rs = 5000; % ohms, snubber resitance IGBT
Cs = inf; % F; snubber capacitance IGBT
Ron = 1e-3; % ohms, conducting resistance IGBT

% Filter
Rf=6e-3; % ohm, filter resistance
Lf=2e-3; % H, filter inductance


% *************************************************************************
% Network model
% *************************************************************************

%  Voltage source
fn = 50; % Hz, rated frequency
wn = 2*pi*fn; % rad/s, rated angular frequency
VLL_rms = 230*sqrt(3); % V
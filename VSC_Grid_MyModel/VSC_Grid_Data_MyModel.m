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
fsw = fs;  % Hz, switching frequency


% *************************************************************************
% Physical Model VSC 
% *************************************************************************

% DC-link
C_dc = 5000e-06; % F, dc-link capacitor
V_dc = 680;      % V, dc voltage source
R_dc = 1e-5;     % ohms, dc-link resitance

% IGBT bridge
Rs = 5000;       % ohms, snubber resitance IGBT
Cs = inf;        % F; snubber capacitance IGBT
Ron = 1e-3;      % ohms, conducting resistance IGBT

% Filter
Rf=6e-3;         % ohm, filter resistance
Lf=2e-3;         % H, filter inductance


% *************************************************************************
% Network model
% *************************************************************************

%  Voltage source
fn = 50;               % Hz, rated frequency
wn = 2*pi*fn;          % rad/s, rated angular frequency
VLL_rms = 230*sqrt(3); % V


% *************************************************************************
% Current Controller (cc)-- L.H book
% *************************************************************************

alpha_cc = 2*pi*fs/10; % rad/s, bandwidth (2*pi*500)
Ki_cc = alpha_cc*Rf;   % Integral gain
Kp_cc = alpha_cc*Lf;   % Proportional gain 


% *************************************************************************
% PLL -- L.H book
% *************************************************************************

alpha_PLL = 2*pi*fs/1000;  % rad/s, bandwidth (alpha_cc/100)
Ki_PLL = alpha_PLL^2;      % Integral gain
Kp_PLL = alpha_PLL*2;      % Proportional gain
samp_delay = 1.5*Ts;       % phase delay b.of discretization 1*Ts + 0.5 Ts
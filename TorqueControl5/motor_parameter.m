% 2KW PMDC Motor simulation

clear all;

Po = 1957;    % rated power
Ra = 0.8;     % amature resistance
La = 3e-3;
Jn = 0.00252;   % 전동기 관성 
Bn = 0;
Vrpm_rated = 1313;
Vrn_rated = Vrpm_rated/60*2*pi;
Trated = Po/Vrn_rated;
K = 0.764;
la_rated = Trated/K;
Va_rated = 120;

Ta = La/Ra;  %electrical time constant
Tn = Jn*Ra/(K*K);  %electromechanical time constant

s= tf('s');
Bload = 0;
Jload = 0;

Beq = Bn + Bload;
Jeq = Jn + Jload;

Gm = (K/(Jeq*La))/(s^2 + ((Ra/La)*s + (Beq/Jeq)*s) + ((Ra*Beq)/(Jeq*La) + K*K/(Jeq*La)));
% Gm = (K/(Jeq*La))/(s^3 + ((Ra/La)*s^2 + (Beq/Jeq)*s^2) + (((Ra*Beq)/(Jeq*La)*s) + (K*K/(Jeq*La)*s)));
% step(Va_rated * Gm * 60/(2*pi));

% xlim([0,0.1]);

% grid;

fcc = 300;
vcc = 2 * pi *fcc;

Kp_cc = vcc * La;
Ki_cc = vcc * Ra;
Ka_cc = 1/Kp_cc;



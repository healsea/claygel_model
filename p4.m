% parameters
clear
% the gap of n must be 1, or the sum(final) will not be the area.
n = 2000:1:4000;

%crosslinker density
%np = 8.2e19;
np = 8.72e21;
% crosslinker distance
D = sqrt(3)/2*(2/np)^(1/3);
% kuhn length
b = 1.1e-10;
%D = b*100;
% equivalent sphere crosslinker
r0 = 1e-8; 
% active part per crosslinker
nsite = 108;
k_active = b^2*nsite/4/r0^2;
%k_active = 0.0058;
%fstr = fstr_easy*kb*T/b; chain break force
fstr_easy = 4;

kb = 1.38e-23;
T = 295;
lambda = 1:0.1:8;

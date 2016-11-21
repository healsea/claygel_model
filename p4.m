% parameters
clear
% the gap of n must be 1, or the sum(final) will not be the area.
n = 11500:1:14000;

%crosslinker density
np = 1e19;
%np = 8.72e21;
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

% This part try to test the appropriate n and constant added in the process of computing final
% D = sqrt(3)/2*(2/np)^(1/3);
% % compute chain length distribution
% G = 3*D^2./(2*b^2.*n);
% mid = k_active/sqrt(pi).*(sqrt(6*n).*exp(-G)+3*D/b*sqrt(pi*n).*erf(sqrt(G))-sqrt(6)*exp(-G.*n)-3*D/b.*erf(sqrt(G.*n)));
% final=k_active*sqrt(3/2/pi./n).*exp(-G-mid+7600);% un-normalized P, +500 to avoid final to be so small to regonized as zero in matlab
% P = final/sum(final);
% plot(n,P)
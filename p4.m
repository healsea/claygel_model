
clear
% the gap of n must be 1, or the sum(final) will not be the area.
n = 2000:1:4000;

%np = 8.2e19;
np = 8.72e21;
D = sqrt(3)/2*(2/np)^(1/3);
b = 1.1e-10;
%D = b*100;
r0 = 1e-8; % equivalent sphere crosslinker
nsite = 108;
k = b^2*nsite/4/r0^2;
%k = 0.0058;

G = 3*D^2./(2*b^2.*n);

mid = k/sqrt(pi).*(sqrt(6*n).*exp(-G)+3*D/b*sqrt(pi*n).*erf(sqrt(G))-sqrt(6)*exp(-G.*n)-3*D/b.*erf(sqrt(G.*n)));

final=k*sqrt(3/2/pi./n).*exp(-G-mid+500);% un-normalized P, +5000 to avoid final to be so small to regonized as zero in matlab
P = final/sum(final);

plot(n,P)
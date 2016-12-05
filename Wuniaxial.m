% this is for uniaxial strain test in water with swell
%p4

% crosslinker distance
%D = sqrt(3)/2*(2/np)^(1/3);
% This D assume D/b = 100 when np = 8.2e19
D = (b*100)*(8.2e19/np)^(1/3);
% compute chain length distribution
G = 3*D^2./(2*b^2.*n);
mid = k_active/sqrt(pi).*(sqrt(6*n).*exp(-G)+3*D/b*sqrt(pi*n).*erf(sqrt(G))-sqrt(6)*exp(-G.*n)-3*D/b.*erf(sqrt(G.*n)));
final=k_active*sqrt(3/2/pi./n).*exp(-G-mid);% un-normalized P, +7600 to avoid final to be so small to regonized as zero in matlab For np=1e19
P = final/sum(final);
plot(n,P)

%lambda pre = 3
pre = 5;
lambda = sqrt(1/pre):0.2:5;
I = sqrt((pre^2+2.*lambda.*lambda)/3);

omega = 3e-29;
Wstr = zeros(1,length(lambda));
Wmix = zeros(1,length(lambda));

nc = zeros(1,length(lambda));
bestlambda = zeros(1,length(T));
nsite = 108;
for kk = 1:length(T)
for i = 1:length(lambda)
    nc(i) = 1/(coth(fstr_easy)-1/fstr_easy)*D/b*I(i); % only for isotropic dilation
    ini = find(n>nc(i),1);  %find the shortest chain
    %uniaxial stretch amount
    for j = ini:length(P)
        beta = invL(I(i)*D/n(j)/b);
        beta1 = invL(1/sqrt(n(j)));
        %Consider force is 0 when relaxed
        Wstr(i) = Wstr(i)+ 4*np*n(j)*kb*T(kk)*(beta/tanh(beta)-beta1/tanh(beta1)+log(beta/sinh(beta))-log(beta1/sinh(beta1)))*nsite*P(j);

    end
    omegac = pre*lambda(i)*lambda(i)-1;
    c = omegac/omega;
    kexi = -12.947+0.04496*T(kk)+(17.92-0.0569*T(kk))/(1+omegac);
    %Wstrsuo(i) = 0.5*0.01/omega*kb*T(kk)*(pre^2+2*lambda(i)^2-1-2*log(pre*lambda(i)^2));
    Wmix(i) = kb*T(kk)*(c*log(omegac/(1+omegac))+kexi*c/(1+omegac));
end

[x,y] = min(real(Wstr+Wmix));
bestlambda(kk) = lambda(y)

end
plot(T,bestlambda.^2*pre)
%plot(lambda,Wstr)

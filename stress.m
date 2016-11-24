% Derive from W, for uniaxial stress test
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

% nominal stress
S = zeros(1,length(lambda));

for i = 1:length(lambda)
    I = sqrt(((lambda(i))^2+2/lambda(i))/3);
    
    nc(i) = 1/(coth(fstr_easy)-1/fstr_easy)*D/b*I;
    
    %find the shortest chain
    ini = find(n>nc(i),1);  

    for j = ini:length(P)
        beta = invL(I*D/n(j)/b);
        beta1 = invL(1/sqrt(n(j)));
        S(i) = S(i) + 4*np*kb*T*D/b*(lambda(i)-(lambda(i))^(-2))*nsite*P(j)*(beta-beta1)/3/I;
    end
end
%semilogx(lambda.^3,Wstr*150./Wmix)
plot(lambda ,S) 
xlabel('stretch ratio');
ylabel('stress/Pa');
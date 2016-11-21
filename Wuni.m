% W for uniaxial stress test in water
%p4

T = 295;
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

% volume of water molecule
omega = 3e-29;
N = 0.01/omega;% Appear in Suo's paper but may use in Gao's paper as Norg

Wstr = zeros(1,length(lambda));
Wmix = zeros(1,length(lambda));

for i = 1:length(lambda)
    I = sqrt(((lambda(i))^2+2/lambda(i))/3);
    
    nc(i) = 1/(coth(fstr_easy)-1/fstr_easy)*D/b*I;
    
    %find the shortest chain
    ini = find(n>nc(i),1);  

    for j = ini:length(P)
        beta = invL(I*D/n(j)/b);
        beta1 = invL(1/sqrt(n(j)));
        Wstr(i) = Wstr(i)+ 4*np*n(j)*kb*T*(beta/tanh(beta)-beta1/tanh(beta1)+log(beta/sinh(beta))-log(beta1/sinh(beta1)))*nsite*P(j);
    end
end
%semilogx(lambda.^3,Wstr*150./Wmix)
plot(lambda ,Wstr) %the radius of gel is 3mm 
xlabel('stretch ratio');
ylabel('stretch energy');
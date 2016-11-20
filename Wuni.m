% W for uniaxial stress test
%p4

% compute chain length distribution
G = 3*D^2./(2*b^2.*n);
mid = k_active/sqrt(pi).*(sqrt(6*n).*exp(-G)+3*D/b*sqrt(pi*n).*erf(sqrt(G))-sqrt(6)*exp(-G.*n)-3*D/b.*erf(sqrt(G.*n)));
final=k_active*sqrt(3/2/pi./n).*exp(-G-mid+500);% un-normalized P, +500 to avoid final to be so small to regonized as zero in matlab
P = final/sum(final);
plot(n,P)

% nominal stress
Wstr = zeros(1,length(lambda));

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
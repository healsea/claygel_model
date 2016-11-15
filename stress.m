% Derive from W, for uniaxial stress test
p4

kb = 1.38e-23;
T = 295;
lambda = 1:0.1:5;

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

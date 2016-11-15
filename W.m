
p4

kb = 1.38e-23;
T = 306;
lambda = 1:0.1:5;

% volume of water molecule
omega = 3e-29;
N = 0.01/omega;% Appear in Suo's paper but may use in Gao's paper as Norg

% energy of stretch, mix and organic stretch
Wstr = zeros(1,length(lambda));
Worg = zeros(1,length(lambda));
Wmix = zeros(1,length(lambda));
% nominal stress
S = zeros(1,length(lambda));

Norg = np*7.5*nsite; % fit the data
norg = 200;

for i = 1:length(lambda)
    % I = lambda(i)
    % uniaxial stretch and assume no swell
    I = sqrt(((lambda(i))^2+2/lambda(i))/3);
    
    nc(i) = 1/(coth(fstr_easy)-1/fstr_easy)*D/b*I;
    
    %find the shortest chain
    ini = find(n>nc(i),1);  

    for j = ini:length(P)
        beta = invL(I*D/n(j)/b);
        beta1 = invL(1/sqrt(n(j)));
        %Wstr(i) = Wstr(i)+ 4*np*n(j)*kb*T*(beta/tanh(beta)+log(beta/sinh(beta)))*nsite*P(j);
        %force = 0 when relaxed
        Wstr(i) = Wstr(i)+ 4*np*n(j)*kb*T*(beta/tanh(beta)-beta1/tanh(beta1)+log(beta/sinh(beta))-log(beta1/sinh(beta1)))*nsite*P(j);
        % uniaxial stretch nominal stress
        S(i) = S(i) + 4*np*kb*T*D/b*(lambda(i)-(lambda(i))^(-2))*nsite*P(j)*(beta-beta1)/3/I;
    end

    beta_org = invL(I/sqrt(norg));
    Worg(i) = Norg*norg*kb*T*(beta_org/tanh(beta_org)+log(beta_org/sinh(beta_org)));
    omegac = lambda(i)^3-1;
    c = omegac/omega;
    kexi = -12.947+0.04496*T+(17.92-0.0569*T)/(1+omegac);
    Wmix(i) = kb*T*(c*log(omegac/(1+omegac))+kexi*c/(1+omegac));
end
%semilogx(lambda.^3,Wstr*150./Wmix)
plot(lambda ,S) 

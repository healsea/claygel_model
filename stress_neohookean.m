% Derive from S in NeoHookean model, for uniaxial stress test
% parameters
%clear
omega = 3e-29;
N = NN/omega;
kb = 1.38e-23;
lambda = 1:0.1:8;
T = 306;

% nominal stress
S = N*kb*T*(lambda-1./lambda./lambda);

plot(lambda ,S) 
hold on
xlabel('stretch ratio');
ylabel('stress/Pa');
% stress change with np
p4

npp = logspace(19,19+log10(3.8),10);
stre = zeros(length(npp),length(lambda));
for k = 1:length(npp)
    % overwrite original parameter
    np = npp(k);
    stress
    stre(k,:) = S;
    k
end
xlabel('stretch ratio')

% for i=1:5:length(lambda)
%     plot(npp,stre(:,i))
%     %legend('np = 1e19','fstr = 3e19','fstr = 8e19','fstr = 2e20','fstr = 6e20','fstr = 2e21','fstr = 5e21','fstr = 1e22','fstr = 4e22','fstr = 1e23')
%     hold on
% end

for i=1:3
    plot(lambda,stre(i,:))
    legend('np = 1e19','np = 3e19','np = 8e19','np = 2e20','np = 6e20')
    hold on
end
% stress change with fstr
p4

fstrEasy = 1:10;
stre = zeros(length(fstrEasy),length(lambda));
for k = 1:length(fstrEasy)
    % overwrite original parameter
    fstr_easy = fstrEasy(k);
    stress
    stre(k,:) = S*0.003^2*3.1416;
    k
end
for i=1:10
    plot(lambda,stre(i,:))
    legend('fstr = 1','fstr = 2','fstr = 3','fstr = 4','fstr = 5','fstr = 6','fstr = 7','fstr = 8','fstr = 9','fstr = 10')
    hold on
end
xlabel('stretch ratio')
ylabel('force/N')
% stress change with fstr
p4

fstrEasy = 1:10;
stre = zeros(length(fstrEasy),length(lambda));
for k = 1:length(fstrEasy)
    % overwrite original parameter
    fstr_easy = fstrEasy(k);
    stress
    stre(k,:) = S;
    k
end
for i=1:10
    plot(lambda,stre(i,:))
    legend('1','2','3','4','5','6','7','8','9','10')
    hold on
end
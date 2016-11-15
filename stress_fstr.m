% stress change with fstr
p4

fstrEasy = 1:2;
stre = zeros(length(fstrEasy),length(lambda));
for k = 1:length(fstrEasy)
    % overwrite original parameter
    fstr_easy = fstrEasy(k);
    stress
    stre(k,:) = S*0.003^2*3.1416;
    k
end

%data processing
str = '1117_thin3_100.mat';
load(str);
[r len] = dataprocess1(str);
A = 3.1416*r^2;
pos = pos(2:length(pos)-100);
loadd = loadd(2:length(loadd)-100)/A;
loadd = medfilt1(loadd,15);
lam = (pos-pos(1))/len*1.4 + 1;
plot(lam,loadd)
%legend(strcat('Length = ',num2str(len),'  Radius = ',num2str(r)))
hold on

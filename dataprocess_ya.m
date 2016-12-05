%data processing for supress
str = '1129_5_144.mat';
load(str);
[r len] = dataprocess1(str);
A = 3.1416*r^2;
pos = pos(cut:length(pos)-100);
loadd = loadd(cut:length(loadd)-100)/A;
loadd = medfilt1(loadd,15);
lam = (pos-pos(1))/len + 1;
plot(lam,loadd)
%legend(strcat('Length = ',num2str(len),'  Radius = ',num2str(r)))
hold on

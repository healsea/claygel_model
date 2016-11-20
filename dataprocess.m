%data processing
load('1117_5_266.mat');
len = 26.6;
A = 3.1416*0.006^2;
pos = pos(2:length(pos)-100);
loadd = loadd(2:length(loadd)-100)/A;
loadd = medfilt1(loadd,15);
lam = (pos-pos(1))/len + 1;
plot(lam,loadd)
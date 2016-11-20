%data processing
load('1117_thin5_112.mat');
pos = pos(2:length(pos)-100);
load = load(2:length(load)-100);
load = medfilt1(load,15);
plot(pos,load)
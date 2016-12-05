read = importdata('D:\Box Sync\¿ÆÑÐ\data\PT1204_thin2_87_silica\Test1\Test1.Stop.csv');
time = read.data(:,1);
loadd = read.data(:,8);
pos = read.data(:,9);
save 1204_silica_thin2_87.mat time loadd pos
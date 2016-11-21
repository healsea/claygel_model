function [ r,len ] = dataprocess1( str )
% dataprocess1 extract crossection area and length from file name
if(strfind(str,'thin'))
    r = 0.003;
else
    r = 0.0075;
end

startlen = strfind(str,'_');
startlen = startlen(end);
endlen = strfind(str,'.mat');
len = str2num(str(startlen+1:endlen-1))/10;
end


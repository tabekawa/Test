
%% test MATLAB script to run on NIG super computer
function []=testMATLAB190305_1(strId)

if nargin==0
    strId='1';
end

saveFileName = ['ResultTest/testMATLAB_' datestr(now,'yymmdd_HHMMSS_FFF') '_' strId];

disp(saveFileName)
a = 0;
for i = 1 : 5
    a = a + i*str2double(strId);
    disp(num2str(a))
end

save(saveFileName, 'a', 'saveFileName')
end

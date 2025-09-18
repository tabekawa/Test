%% mainä÷êîÇÃÉRÉìÉpÉCÉã
function compileByMcc(fileName)

if ischar(fileName)
    mccStr = ['mcc -m ' fileName  ' -R -singleCompThread'];
    eval(mccStr);
else
    for i = 1 : length(fileName)
        disp(num2str(i))
        mccStr = ['mcc -m ' fileName{i}  ' -R -singleCompThread'];
        eval(mccStr);
    end
end

saveMCRVersion()

end

function []=saveMCRVersion()

%% save MATLAB version as a text file

% fileattrib('mcrVersion.txt', '+w');

verStruct = ver('MATLAB');
verTxt = verStruct.Version;
verTxt = strrep(verTxt, '.', '');
verTxt = ['v' verTxt];
idTxtFile = fopen('mcrVersion.txt', 'w');
fprintf(idTxtFile, verTxt);
fclose(idTxtFile);

%fileattrib('mcrVersion.txt', '-w');

end
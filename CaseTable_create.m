% [file,path] = uigetfile('*.caseTable');
% dataname = [path,'\',file];
% 
% % Data reading options
% opts = fixedWidthImportOptions("NumVariables", 4);
% opts.DataLines = [92, Inf];                         %92 text lines before results start
% opts.VariableWidths=[17 10 17 16];
% opts.VariableNames=["Name", "Speed", "Load", "Moment"];
% opts.VariableTypes=["string", "double", "double", "double"];

c=[001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 028 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 047 048 049 050 051 052 053 054 055 056 057 058 059 060 061 062 063 064 065 066 067 068 069 070 071 072 073 074 075 076 077 078 079 080 081 082 083 084 085 086 087 088 089 090 091 092 093 094 095 096 097 098 099]';
Speed=[0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.0025 0.005 0.01 0.015 0.02 0.03 0.04 0.05 0.06 ]';
AntriebsMoment=[1873.47 1873.47 1873.47 1873.47 1873.47 1873.47 1873.47 1873.47 1873.47 2341.84 2341.84 2341.84 2341.84 2341.84 2341.84 2341.84 2341.84 2341.84 2810.21 2810.21 2810.21 2810.21 2810.21 2810.21 2810.21 2810.21 2810.21 3278.58 3278.58 3278.58 3278.58 3278.58 3278.58 3278.58 3278.58 3278.58 3746.94 3746.94 3746.94 3746.94 3746.94 3746.94 3746.94 3746.94 3746.94 4215.31 4215.31 4215.31 4215.31 4215.31 4215.31 4215.31 4215.31 4215.31 4683.68 4683.68 4683.68 4683.68 4683.68 4683.68 4683.68 4683.68 4683.68 5152.05 5152.05 5152.05 5152.05 5152.05 5152.05 5152.05 5152.05 5152.05 5620.42 5620.42 5620.42 5620.42 5620.42 5620.42 5620.42 5620.42 5620.42 6088.784 6088.784 6088.784 6088.784 6088.784 6088.784 6088.784 6088.784 6088.784 6557.15 6557.15 6557.15 6557.15 6557.15 6557.15 6557.15 6557.15 6557.15]';
AbtriebsMoment=[-2914.3 -2914.3 -2914.3 -2914.3 -2914.3 -2914.3 -2914.3 -2914.3 -2914.3 -3642.86 -3642.86 -3642.86 -3642.86 -3642.86 -3642.86 -3642.86 -3642.86 -3642.86 -4371.43 -4371.43 -4371.43 -4371.43 -4371.43 -4371.43 -4371.43 -4371.43 -4371.43 -5100.01 -5100.01 -5100.01 -5100.01 -5100.01 -5100.01 -5100.01 -5100.01 -5100.01 -5828.58 -5828.58 -5828.58 -5828.58 -5828.58 -5828.58 -5828.58 -5828.58 -5828.58 -6557.15 -6557.15 -6557.15 -6557.15 -6557.15 -6557.15 -6557.15 -6557.15 -6557.15 -7285.72 -7285.72 -7285.72 -7285.72 -7285.72 -7285.72 -7285.72 -7285.72 -7285.72 -8014.3 -8014.3 -8014.3 -8014.3 -8014.3 -8014.3 -8014.3 -8014.3 -8014.3 -8742.87 -8742.87 -8742.87 -8742.87 -8742.87 -8742.87 -8742.87 -8742.87 -8742.87 -9471.44 -9471.44 -9471.44 -9471.44 -9471.44 -9471.44 -9471.44 -9471.44 -9471.44 -10200.01 -10200.01 -10200.01 -10200.01 -10200.01 -10200.01 -10200.01 -10200.01 -10200.01]';

%Read txt into cell A
fileID = 'CaseTable_test.caseTable';
fid = fopen(fileID,'r');
i = 1;
tline = fgetl(fid);
A{i} = tline;
pat="Case 1";     % find text Case 1, important that names in case explorer aren't changed
while ischar(tline)
    i = i+1;
    tline = fgetl(fid);
    A{i} = tline;
    if ischar(A{i})==1
        index(i)=contains(A{i},pat);
    else
        index(i)=0;
    end
end
fclose(fid);

% Change cell A
idx=find(index==1);
for i=1:length(c)
A{idx+i-1} = sprintf('%s',['"Case ' num2str(c(i)) '"' '        ' num2str(Speed(i)) ' ' num2str(AntriebsMoment(i)) ' ' num2str(AbtriebsMoment(i))]);
end

% Write cell A into txt
fid = fopen('test_filled.caseTable', 'w');
for i = 1:numel(A)
    fprintf(fid,'%s\n', A{i});
end
fclose(fid);
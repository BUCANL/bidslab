% Currently only operates on the open file in EEGLAB
% Based on: https://docs.google.com/document/d/1PmcVs7vg7Th-cGC-UrX8rAhKUHIzOI-uIOh69_mvdlw/edit#

splitterName = strsplit(EEG.filename,'.');
outName = [splitterName(1), '_annotations.tsv'];

splitterPath = strsplit(EEG.filename,'_');
outPath = ['./derivatives/lossless/', splitterPath(1), '/eeg/'];

fullName = cell2mat([outPath,outName]);
fID = fopen(fullName,'w');
fprintf(fID,'onset\tduration\tlabel\tchannels\n');

for i=1:length(EEG.marks.chan_info)
    fprintf(fID,'0\tn/a\tchan_%s',EEG.marks.chan_info(i).label);
    markedChan = find(EEG.marks.chan_info(i).flags == 1);
    fprintf(fID,'\t[');
    for j=1:length(markedChan)
        if j > 1
            fprintf(fID,',');
        end
        fprintf(fID,'''EEG%d''', markedChan(j));
    end
    fprintf(fID,']\n');
end

for i=1:length(EEG.marks.comp_info)
    fprintf(fID,'0\tn/a\tcomp_%s',EEG.marks.comp_info(i).label);
    markedChan = find(EEG.marks.comp_info(i).flags == 1);
    fprintf(fID,'\t[');
    for j=1:length(markedChan)
        if j > 1
            fprintf(fID,',');
        end
        fprintf(fID,'''ICA%d''', markedChan(j));
    end
    fprintf(fID,']\n');
end

fclose(fID);
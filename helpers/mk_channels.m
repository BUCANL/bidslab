function channels=mk_channels(EEG,fname)

% load current file only if it hasn't been loaded already
if ~exist('EEG','var') || (exist('EEG','var') && isempty(EEG)) || ...
  (~isempty(EEG) && ~strcmp(fname,[EEG.filepath '/' EEG.filename]));
    EEG = pop_loadset('filename',fname);
end
disp(['Creating ' fname(1:end-8) '_channels.tsv file...']);
channels={'name','type','status'}; %description,sampling_frequency,low_cutoff,high_cutoff,notch,status

if isfield(EEG,'marks');
    channels={channels{:},'manual'};
end
for i=1:length(EEG.chanlocs);
   channels{i+1,1}=EEG.chanlocs(i).labels;
   if strcmp(EEG.chanlocs(i).type,'');
      channels{i+1,2}='NA';
   else
      channels{i+1,2}=EEG.chanlocs(i).type;
   end
   if isfield(EEG,'marks');
      if EEG.marks.chan_info(1).flags(i);
         channels{i+1,3}='good';
      else
          channels{i+1,3}='bad';
      end
   else
      channels{i+1,3}='good';
   end
end

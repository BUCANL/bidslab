function version = eegplugin_bidslab(fig,try_strings,catch_strings)
    version = 'bidslab_v0.1';
    addpath(genpath(fileparts(which(mfilename()))));
    filemenu=findobj(fig,'Label','File');
    bidslabMenu = uimenu( filemenu, 'Label', 'BIDSLAB','separator','on');
    cmd = 'pop_bidsImport(EEG);';
    importCmd=[try_strings.no_check cmd catch_strings.store_and_hist];
    uimenu(bidslabMenu,'label','Import BIDS','callback',importCmd);
    cmd = 'pop_bidsExport(EEG);';
    exportCmd=[try_strings.no_check cmd catch_strings.store_and_hist];
    uimenu(bidslabMenu,'label','Export BIDS','callback',exportCmd);
end
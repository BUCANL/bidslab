# BIDSLAB
The BIDSLAB plugin for EEGLAB is an addon which allows for importing and exporting of BIDS standardized EEG data while potentially preserving annotation and markup based structures. When importing, the structure created inside of the EEGLAB file is stored as outlined in the [Vised Marks](https://github.com/BUCANL/Vised-Marks) documentation. Exporting is done in adherence to the BIDS standards listed in the following section.

## BIDS References
* [Main BIDS Document](https://bids-specification.readthedocs.io/en/latest/)
* [BIDS EEG Section](https://bids-specification.readthedocs.io/en/latest/04-modality-specific-files/03-electroencephalography.html)
* [BEP021: Common Electrophysiological Derivatives Draft](https://docs.google.com/document/d/1PmcVs7vg7Th-cGC-UrX8rAhKUHIzOI-uIOh69_mvdlw)

## Installation
Navigate to your EEGLAB folder, then follow the code snippet below.
```bash
cd plugins
git clone 'git clone https://github.com/BUCANL/bidslab.git'
```

# TeraMATLAB
The following is a collection of scripts for performing THz measurements using script-based acquisition in MATLAB. In-line data processing utilizes function that are distributed in THz data processing package "Nelly" ( https://github.com/YaleTHz/nelly ) and should be installed in the path of data acquisition codes.[1]

Data acquisition scripts were originally developed in MATLAB 2018b and have been deployed in the newest version (MATLAB 2023b).

# Currently Supported Hardware
- Stanford Research Systems SR810/SR830 Lock-in amplifier
  - Communication via USB-GPIB using on of the following adapters:
    - Agilent/Keysight 82357B
    - National Instruments GPIHB-USB-HS
- Thorlabs BBD30X controller for DDS direct-drive delay stages
  - Communication via USB  
- Zaber X-MCC series multi-axis universal controller
  - Communcation via ethernet

# References
1.) Tayvah, U. T.; Spies, J. A.; Neu, J.; Schmuttenmaer, C. A. "Nelly: A User-Friendly and Open-Source Implementation of Tree-Based Complex Refractive Index Analysis for Terahertz Spectroscopy" _Anal. Chem._ **2021**, _93_, 11243-11250.

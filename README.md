# TeraMATLAB
The following is a collection of scripts for performing THz measurements[1,2] using script-based acquisition in MATLAB. In-line data processing utilizes function that are distributed in THz data processing package "Nelly" (https://github.com/YaleTHz/nelly) and should be installed in the path with data acquisition codes.[3]

Data acquisition scripts were developed in MATLAB 2020b and have been deployed in the newest version (MATLAB 2023b).

Measurements are run through scripts found in [measurement_scripts] using functions to initialize and run step acquisition measurements. Averaging is performed within these scripts and there are functions for measurements found in [acquisition]. An [acquisition] function can be quit by pressing 'q' in the data acquisition window (Figure 1). Currently, stage movement commands are hard-coded in their device-specific, native syntax for speed.

# Currently Supported Hardware
- Stanford Research Systems SR810/SR830 Lock-in amplifier
  - Communication via USB-GPIB with one of the following adapters:
    - Agilent/Keysight 82357B
    - National Instruments GPIHB-USB-HS
  - Currently implemented using [instrfind] and [gpib], which will be discontinued in later versions of MATLAB. Communication via [visadev] in development.
- Thorlabs BBD30X controller for DDS direct-drive delay stages
  - Communication via USB
- Zaber X-MCC series multi-axis universal controller
  - Communcation via ethernet

# Hardware Support In Development
- Thorlabs K10CR1 motorized rotation mount
  - Communication via USB
  - Code is available, but not deployed in the main package.
- Thorlabs M30X motorized linear translation stage
  - Communication via USB
  - Code is available, but not deployed in the main package.
 
# Application Programming Interface
- measurement_scripts
  - run_thz_tds.m
  - run_linescan.m
- acquisition
  - step_acquisition_lock_in.m
  - line_scan_lock_in.m
- initialization/disconnect
- utilities

# References
1.) Neu, J.; Schmuttenmaer, C. A. "Tutorial: An Introduction to Terahertz Time-Domain Spectroscopy (THz-TDS)" _J. Appl. Phys._ **2018**, _124_, 231101.

2.) Spies, J. A.; Neu, J.; Tayvah, U. T.; Capobianco, M. D.; Pattengale, B.; Ostresh, S.; Schmuttenmaer, C. A. "Terahertz Spectroscopy of Emerging Materials" _J. Phys. Chem. C_ **2020**, _124_, 22335.

3.) Tayvah, U. T.; Spies, J. A.; Neu, J.; Schmuttenmaer, C. A. "Nelly: A User-Friendly and Open-Source Implementation of Tree-Based Complex Refractive Index Analysis for Terahertz Spectroscopy" _Anal. Chem._ **2021**, _93_, 11243.

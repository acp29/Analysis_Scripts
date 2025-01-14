# Offline Series Resistance Compensation 

Plans to develop a script to accurately compensate for series resistance changes throughout the course of longer recordings of smaller events such as mEPSCs.  

Will build off work by Andrew Penn ([rscomp_Penn.m](https://github.com/acp29/Peaker/blob/master/manip/rscomp.m)).

## RS_Comp_OGS.m

Script aiming to perform offline series resistance compensation. Currently aimed at .tdms files (due to scaling and ephysIO integration), but could (and definitely should) adapt this to be able to work for other file formats to fully leverage ephysIO.

Functionality currently includes data splitting, estimation of whole cell properties, Rs compensation and saving. Convenient plots are provided to see difference. 

## Useful reading;
*Traynelis 1998* [Software based correction of single compartment series resistance errors](https://reader.elsevier.com/reader/sd/pii/S016502709800140X?token=96FC34C471B6073F72A93ACB903AAD18722E80F62A05B26AAB45CD3ABD184C199DAB109016855A5F90E4E77CBEB9ED44)  
*Campagnola, Kratz & Manis 2016* [ACQ4 Documentation, Release 0.9.2](https://acq4.readthedocs.io/_/downloads/en/latest/pdf/)  
*Santos-Sacchi 1993* [Voltage dependent ionic conductances of type 1 psiral ganglion cells from the guinea pig inner ear](https://www.jneurosci.org/content/jneuro/13/8/3599.full.pdf)  
*Drexel-Geo Lab* Series [Resistance Compensation](https://github.com/ogsteele/Analysis_Scripts/blob/master/mEPSC/RS_Comp/Drexel_Gao_Lab_Series_Resistance_Compensation.pdf)  


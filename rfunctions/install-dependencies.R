# install necessary packages with default install.packages() settings
package_list <- c('R.matlab', 'cifti', 'data.table','reshape2')
install.packages(pkgs = package_list)

# DESCRIPTIONS ----------------------------------------------------------------
# R.matlab:   read in subjDesignMat.mat
# cifti:      read .nii and .gii and map to coordinate structures
# data.table: fread() for fast reading of csv format,
#               efficiency of data.table objects
# reshape2:   melt() function 
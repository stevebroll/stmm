# Load temp data sets for 100307 very inflated --------------------------------
library(data.table)

cat('Creating very inflated map...', fill = TRUE)
run2_l_vinf_map <- as.matrix(fread("/share/RDirectory/stmm/rfunctions/single_subject/temp_data_100307/LR_L_vinf.csv"))
cat('Creating very inflated map...', fill = TRUE)
run2_r_vinf_map <- as.matrix(fread("/share/RDirectory/stmm/rfunctions/single_subject/temp_data_100307/LR_R_vinf.csv"))
run2_vinf       <- rbind(run2_l_vinf_map, run2_r_vinf_map)


# NOTES -----------------------------------------------------------------------
# need to automate file loading with aws
# correct to concanete L and R?

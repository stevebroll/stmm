# Optional input for subject number -------------------------------------------

if (default) {
  # set default subject number to be 100307
  subject_id <- '100307'
} else {
  # accept user input for subject number
  cat('Enter subject ID: ')
  subject_id <- readLines(con = stdin(), n=1)
}
# print assigned subject number
cat(paste(c('Subject ID:', subject_id, sep=' ')))

# Generate file path ----------------------------------------------------------

# automate file path of design mat for assigned subject number
project_directory <- getwd() # if not working in Rproj, redefine variable
                             #  to be location of Data/MOTOR/Subjects folder
file_path <- paste(c(project_directory, '/Data/MOTOR/Subjects/',
                     subject_id, '/subjDesignMat.mat'), sep='', collapse = '')
# read .mat file at path

# Read design mat -------------------------------------------------------------
library(reshape2)
library(R.matlab)

design_mat <- readMat(file_path) #R.matlab
subj_mat   <- design_mat$subjDesignMat
names_mat  <- melt(design_mat$varNamesDesignMat)[3] #reshape2

# Optional input for task -----------------------------------------------------

if (default) {
  # set default task to be just rf
  task_id <- 'rf'
} else {
  # accept user input for task id
  cat('Enter task ID: ')
  task_id <- readLines(con = stdin(), n=1)
}
# print assigned task
cat(paste(c('Task ID:', task_id, sep=' ')))

# Extract runs for task -------------------------------------------------------

tasklist <- which(names_mat==task_id)
design_1 <- subj_mat[1:(nrow(subj_mat)/2), tasklist]
design_2 <- subj_mat[(nrow(subj_mat)/2 + 1):nrow(subj_mat), tasklist]

# NOTES -----------------------------------------------------------------------
# interactive()?
# need to catch input errors
# need to allow multiple inputs for task
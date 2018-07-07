# Complete cases function
# It counts 
complete <- function(directory, id = 1:332) {
  all_files <- list.files(directory)
  files_scope <- all_files[id]
  DF <-  read.csv(file.path(directory, files_scope[1]), header = TRUE)
  for (f in files_scope[-1]) {
    DF <- rbind(DF, read.csv(file.path(directory, f)), header = TRUE)
  }
#  complete_DF <- c()  ## initialize complete_DF
  df <- data.frame(c("", ""))
  colnames(df) <- c("ID", "nobs")
  for (f in id)
    df <- rbind(df, (c(id, length(DF[complete.cases(DF$sulfate, DF$nitrate)&&DF$ID==id]))))
#   c(id, legnth(DF[complete.cases(DF$sulfate, DF$nitrate)&&(DF$ID==id)]
#   complete_DF <- c(complete_DF, complete.cases(DF$sulfate, DF$nitrate) 
#   complete_DF <- complete.cases(DF$sulfate, DF$nitrate)
#  return(length(complete_DF[complete_DF==TRUE]))
  return(df)
  }
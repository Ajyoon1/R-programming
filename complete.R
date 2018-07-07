# Complete cases function
# It counts occurrence of complete cases by ID and returns the data frame 
complete <- function(directory, id = 1:332) {
  all_files <- list.files(directory)
  files_scope <- all_files[id]
  DF <-  read.csv(file.path(directory, files_scope[1]), header = TRUE)
  for (f in files_scope[-1]) {
    DF <- rbind(DF, read.csv(file.path(directory, f)), header = TRUE)
  }
## Select all rows with complete observations for sulfate and nitrate columns
  df <- DF[complete.cases(DF[ , 2:3]), ]
  df_count <- data.frame(table(df$ID))
  colnames(df_count) <- c("id", "nobs")
  return(df_count)
  }

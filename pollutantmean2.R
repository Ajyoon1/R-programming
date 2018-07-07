pollutantmean2 <- function(directory, pollutant, id = 1:332) {
  all_files <- list.files(directory)
  files_scope <- all_files[id]
  files_scope
  DF <-  read.csv(file.path(directory, files_scope[1]))
  for (f in files_scope[-1]) 
    DF <- rbind(DF, read.csv(file.path(directory, f)))
  if ( pollutant == "sulfate" )
    pm <- mean(DF$sulfate[!is.na(DF$sulfate)])
  else
    pm <- mean(DF$nitrate[!is.na(DF$nitrate)])
  return(pm)
}
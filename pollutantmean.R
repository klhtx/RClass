pollutantmean <- function(directory, pollutant, id = 1:332)
{
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  alldat <- NULL
  for( i in id )
  {
      sFile <- sprintf("%s/%03d.csv", directory, i)
      x <- read.csv(sFile)
      dat <- x[,pollutant]
      dat <- dat[ !is.na(dat) ]
      if(length(dat) > 0)
      {
        alldat <- c(alldat, dat)
      }
  }  
  mean(alldat)
}
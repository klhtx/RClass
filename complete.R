complete <- function(directory, id = 1:332) 
{
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    ## blank frame
    dat = data.frame(id=NULL, nobs=NULL)
    ## Loop through the files
    for( i in id )
    {
        sFile <- sprintf("%s/%03d.csv", directory, i)
        x <- read.csv(sFile)
        y <- x[,"nitrate"]
        z <- x[,"sulfate"]
        g <- complete.cases(y,z)
        cnt <- sum(as.integer(g))
        dat <- rbind(dat, data.frame(id=i, nobs=cnt))
    }  
    dat
}

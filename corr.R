corr <- function(directory, threshold = 0) 
{
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations

    ## all files
    id = 1:332
    ## blank vector
    dat = NULL
    ## Loop through the files
    for( i in id )
    {
        sFile <- sprintf("%s/%03d.csv", directory, i)
        x <- read.csv(sFile)
        y <- x[,"nitrate"]
        z <- x[,"sulfate"]
        g <- complete.cases(y,z)
        cnt <- sum(as.integer(g))
        if(cnt >= threshold)
        {
            y <- y[g]
            z <- z[g]
            val = cor(y,z)
            dat = c(dat, val)
        }
    }  
    dat
}

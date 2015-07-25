corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    fileNames <- list.files(directory, full.names=TRUE) #Create a list with all files from the provided folder
    
    completedCases <- subset(complete(directory), nobs > threshold, select = id) #Get only the completed IDs
    
    correlations <- numeric(0)
    
    for (i in completedCases$id){
        #Loop rbinding the files together according the ids provided
        DataSet <- read.csv(fileNames[i])
        
        DataSet <- DataSet[complete.cases(DataSet), ]
        
        correlations <- c(correlations, cor(DataSet$sulfate, DataSet$nitrate))
    }
    
    return(correlations)
        
}

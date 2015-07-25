pollutantmean <- 
function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    fileNames <- list.files(directory, full.names=TRUE) #Create a list with all files from the provided folder
    
    pollutantDataSet <- data.frame() #Creates an empty data frame
    
    for (i in id){
        #Loop rbinding the files together according the ids provided
        pollutantDataSet <- rbind(pollutantDataSet, read.csv(fileNames[i]))
    }
    
    #Calculate the mean of all selected files
    mean(pollutantDataSet[, pollutant], na.rm = TRUE)
    
}

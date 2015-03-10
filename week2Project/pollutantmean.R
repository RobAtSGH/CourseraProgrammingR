pollutantmean <- function(directory, pollutant, id = 1:332) {
    # 'directory' is a character vector of length 1 indicating
    # the location of the CSV files
    # 'pollutant' is a character vector of length 1 indicating
    # the name of the pollutant for which we will calculate the
    # mean; either "sulfate" or "nitrate".
    # 'id' is an integer vector indicating the monitor ID numbers
    # to be used

    # First, create the list of files to open.
    files <- paste(directory,"/",formatC(id,width=3,format="d",flag="0"),".csv",sep="")
    # Open all the files as a list
    airquality <- lapply(files,read.csv)
    # Collapse the list into a single large dataframe
    airquality <- do.call(rbind,airquality)

    ## Return the mean of the pollutant across all monitors listed
    ## in the 'id' vector (ignoring NA values), to 4 significant digits.
    round(mean(airquality[,pollutant],na.rm=TRUE),3)
}

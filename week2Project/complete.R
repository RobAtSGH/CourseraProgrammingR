complete <- function(directory, id = 1:332) {
    # 'directory' is a character vector of length 1 indicating
    # the location of the CSV files
    # 'id' is an integer vector indicating the monitor ID numbers
    # to be used
    goodaq <- data.frame()
    files <- paste(directory,"/",formatC(id,width=3,format="d",flag="0"),".csv",sep="")
    for (i in files) {
        aq <- read.csv(i)
        goodaq <- rbind(goodaq,c(aq$ID[1],nrow(aq[complete.cases(aq),])))
    }
    # Return a data frame of the form:
    # id nobs
    # 1  117
    # 2  1041
    # ...
    # where 'id' is the monitor ID number and 'nobs' is the
    # number of complete cases
    colnames(goodaq) <- c("id","nobs")
    goodaq
}

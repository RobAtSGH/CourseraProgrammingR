complete <- function(directory, id = 1:332) {
    # 'directory' is a character vector of length 1 indicating
    # the location of the CSV files
    # 'id' is an integer vector indicating the monitor ID numbers
    # to be used
    ids <- vector("numeric",0)
    nnobs <- vector("numeric",0)
    files <- paste(directory,"/",formatC(id,width=3,format="d",flag="0"),".csv",sep="")
    aqdata <- lapply(files,read.csv)
    for (aqframe in aqdata) {
        ids <- c(ids,aqframe[1,"ID"])
        nnobs <- c(nnobs,nrow(aqframe[complete.cases(aqframe),]))
    }
    # Return a data frame of the form:
    # id nobs
    # 1  117
    # 2  1041
    # ...
    # where 'id' is the monitor ID number and 'nobs' is the
    # number of complete cases
    cbind(id=ids,nobs=nnobs)
}

corr <- function(directory, threshold = 0) {
    # 'directory' is a character vector of length 1 indicating
    # the location of the CSV files
    # 'threshold' is a numeric vector of length 1 indicating the
    # number of completely observed observations (on all
    # variables) required to compute the correlation between
    # nitrate and sulfate; the default is 0

    # Initialize a vector for the results
    result=vector("numeric",0)

    # Get number of complete obs for all files in the target directory
    aqobs <- complete(directory)
    # Create a logical vector of rows where complete obs > threshold
    xthresh <- aqobs[,"nobs"] > threshold
    # Create a vector of station ids that exceed threshold
    goodids <- aqobs[xthresh,"id"]
    if (length(goodids) > 0) {
        # Read all files for the good stations into a list of dataframes
        files <- paste(directory,"/",formatC(goodids,width=3,format="d",flag="0"),".csv",sep="")
        aqdata <- lapply(files,read.csv)

        # Loop through dataframe list, extracting sulfate and nitrate vectors
        # producing a cor() for complete sets. Append to the result vector.
        for (testframe in aqdata) {
            result <- c(result,cor(testframe$sulfate,testframe$nitrate,use="complete.obs"))
        }
    }
    # Return a numeric vector of correlations
    result
}

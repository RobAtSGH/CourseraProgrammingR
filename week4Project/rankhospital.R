rankhospital <- function (state, outcome,num="best") {
    # Read hospital outcome data and factorize the state column
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    data[,7] <- as.factor(data[,7])
    
    # Transform the outcome into dataframe column name
    col <- paste("Hospital.30.Day.Death..Mortality..Rates.from",
                 transform_condition(outcome),sep=".")
    
    # Check that the supplied State is valid
    if (!is.element(state,data[,7])) {
        stop("invalid state")
    }
    # Check that the supplied outcome is valid
    if (!is.element(col,colnames(data))) {
        stop("invalid outcome")
    }
    
    # Get a subset of the data for the specified state
    ss <- data[data$State==state,]
    # Coerce the requested ranking data into numeric form
    ss[,col] <- suppressWarnings(as.numeric(ss[,col]))
    # Order the list by the requested ranking, alpha tie break on name
    ss <- ss[order(ss[,col],ss$Hospital.Name),]
    # Discard entries where the value of the selected column is NA
    ss <- ss[!is.na(ss[,col]),]
    
    # Check if the number requested is valid, and return NA if not
    if (!is.element(num,c("best","worst",as.character(1:nrow(ss))))) {
        return(NA)
    }
    
    if (num == "best") { # Return name of first element as best
        ss[,2][[1]]
    } else if (num == "worst") {
        ss[,2][[nrow(ss)]] # Return name of last element as worst
    } else {
        ss[,2][[as.numeric(num)]] # Return name of requested rank number
    }
}

transform_condition <- function (condition) {
    # First, we capitalize the first letters of the condition
    s <- strsplit(condition, " ")[[1]]
    condition <- paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "",
                       collapse = " ")
    # Replace spaces with dots and return
    gsub(" ",".",condition)
}
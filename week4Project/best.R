best <- function (state, outcome) {
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
    # Return the top name of a list sorted by mortality and then name
    ss[order(ss[,col],ss$Hospital.Name),2][[1]]
}

transform_condition <- function (condition) {
    # First, we capitalize the first letters of the condition
    s <- strsplit(condition, " ")[[1]]
    condition <- paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "",
                       collapse = " ")
    # Replace spaces with dots and return
    gsub(" ",".",condition)
    }
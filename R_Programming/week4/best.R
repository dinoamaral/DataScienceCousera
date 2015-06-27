hosp_name <- function(measures, outcome_num, state) {
  #All rows that has the state selected, which is located at col = 7
  state_sub <- measures[measures[, 7] == state,]
  #The rows selected above with the outcome columns
  outcome_sub <- state_sub[, outcome_num]
  minimum <- min(outcome_sub, na.rm=TRUE)
  minimum_index <- which(outcome_sub == minimum)
  #the name of hospital is in col = 2
  hospital_name <- state_sub[minimum_index,2]
  return(hospital_name)    
}

best <- function(state, outcome, num) {
  ## Read outcome data
  measures <- read.csv("./data/outcome-of-care-measures.csv", colClasses="character")
  # map the disease heart attack, heart failure, pneumonia as numeric !!!
  measures[, 11] <- as.numeric(measures[, 11])
  measures[, 17] <- as.numeric(measures[, 17])
  measures[, 23] <- as.numeric(measures[, 23])
  ## Check that state and outcome are valid
  valid_outcome <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% measures$State){
    stop("Invalid State")
  } else if (!outcome %in% valid_outcome){
    stop("Invalid outcome")
  }  else {
    if ( outcome == "heart attack") {
      hospital <- hosp_name(measures, 11, state)
    }
    else if ( outcome == "heart failure") {
      hospital <- hosp_name(measures, 17, state)
    }
    else {
      hospital <- hosp_name(measures, 23, state)
    }
    return(hospital)
  }
}  




num_finder <- function(measures, col, state, num) {
    #All rows that has the state selected, which is located at col = 7
    state_sub <- measures[measures[, 7] == state,]
    #The rows selected above with the outcome columns
    outcome_sub <- state_sub[, col]
    len <- dim(state_sub[!is.na(outcome_sub), ])[1]
    if (num == "best"){
      rank <- state_sub[, 2][order(outcome_sub, state_sub[, 2])[1]]
    } else if (num == "worst"){
      rank <- state_sub[, 2][order(outcome_sub, state_sub[, 2])[len]]
    } else if (num > len){
       rank <- NA
    } else {
       rank <- state_sub[, 2][order(outcome_sub, state_sub[, 2])[num]]    
    }
    return(rank)
}

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  measures <- read.csv("./data/outcome-of-care-measures.csv", colClasses="character")
  ## Check that state and outcome are valid
  measures[, 11] <- as.numeric(measures[, 11])
  measures[, 17] <- as.numeric(measures[, 17]) 
  measures[, 23] <- as.numeric(measures[, 23])
  ## Check that state and outcome are valid
  valid_outcome <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% measures$State){
    stop("Invalid State")
  } else if (!outcome %in% valid_outcome){
    stop("Invalid outcome")
  } else {
      if(outcome == "heart attack") {
        rank <- num_finder(measures, 11, state, num) 
      } else if(outcome == "heart failure") {
        rank <- num_finder(measures, 17, state, num) 
      } else {
        rank <- num_finder(measures, 23, state, num) 
      }
    }
    return(rank)
  }
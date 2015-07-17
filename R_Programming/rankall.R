setwd("~/GitHub/DataScienceCousera/R_Programming")
hosp_finder <- function(state_sub, col, num) {
  outcome_sub <- as.numeric(state_sub[, col])
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

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  measures <- read.csv("./data/outcome-of-care-measures.csv", colClasses="character")
  # Create a vector with valid diseases
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  state_target <- sort(unique(measures$State))
  state_len <- length(state_target)
  hosp <- rep("", length(state_target))
  ## Check that state and outcome are valid
  valid_outcome <- c("heart attack", "heart failure", "pneumonia")
  if (!outcome %in% valid_outcome){
    stop("Invalid outcome")
   } else {
     for (i in 1:state_len){
    # serach for each state
     state_sub <- measures[measures[,7]==state_target[i], ]   
     if(outcome == "heart attack") {
       hosp[i] <- hosp_finder(state_sub, 11, num) 
     } else if (outcome == "heart failure") {
       hosp[i] <- hosp_finder(state_sub, 17, num) 
     } else {
       hosp[i] <- hosp_finder(state_sub, 23, num) 
     }   
   }
}   
#create data frame with the hospital names and the abrevisted state name
data_final <- data.frame(hospital=hosp, state=state_target)
return(data_final)
}
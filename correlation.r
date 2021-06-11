source("complete.r")

corr <- function(directory, threshold = 0){
  
  #get the absolute file path
  directory <- paste0(getwd(),"/",directory,"/",sep='') 
  
  #get observation
  obsevations <- complete(directory)
  
  #filter by threshold, subset select nobs > threshold
  filtered_observations <- subset(observations, observations$nobs > threshold)
  
  
  files.list <- list.files(directory)
  correlation <- vector()
  
  for (i in filtered_observations$id) {
    
    #read the file
    file_dir <-paste(directory,files.list[i],sep="")
    file_data <- read.csv(file_dir)
    
    #remove NA
    file_data <- subset(file_data,complete.cases(file_data))
    #calculate the correlation and accumulate in vector form
    correlation <- c(correlation,cor(file_data$nitrate,file_data$sulfate))
  }
  #return the correlation
  correlation
}



complete <- function(directory, id = 1:332){
  
  #get the absolute path of the file
  directory <- paste(getwd(),"/",directory,"/",sep="")
  
  
  #list the files in vector form
  files.list <- list.files(directory)
  
  #the monitor id number
  Id <- vector()
  
  #number of complete cases
  nobs <- vector()
  
  for (i in id){
    
    #read the file
    file_dir <-paste(directory,files.list[i],sep="")
    file_data <- read.csv(file_dir)
    
    #accumulate id and nobs in vector form
    Id <- c(Id, i)
    #sum all the values while skipping the na values
    nobs <- c(nobs, sum(complete.cases(file_data)))
    
  }
  
  #return a data fram of id and nobs in vector form
  data.frame(ID = Id, nobs = nobs)
}

complete("specdata",23)

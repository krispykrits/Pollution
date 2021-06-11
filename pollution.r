pollutantmean <- function(directory, pollutant, id= 1:332){
  
  #assign variable directory to paste the absolute path of the first
  #parameter
  #location of the csv file
  directory <- paste(getwd(),"/",directory,"/",sep="")
  
  #list the directory files in a vector form
  files.list <- list.files(directory)
  
  #creates data frames, tightly coupled collections of variables 
  #which share many of the properties of matrices and of lists, 
  dat <- data.frame()
  
  #for each id passed as a parameter
  for (i in id){
    
    #Read the file
    file_dir <- paste(directory,files.list[i],sep="")
    file_data <- read.csv(file_dir)
    
    #accumulate the data
    dat <- rbind(dat,file_data)
  }
  
  #na.rm removes missing values from the data if they are coded as NA
  mean(dat[[pollutant]],na.rm=TRUE)
}

pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata","nitrate",23)
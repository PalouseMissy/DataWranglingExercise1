#load the data
refine_original <- read.csv(C:/Users/mlee/Desktop/refine_original.csv)
>   View(refine_original)

#clean up brand names
refine_original$company <- lapply(refine_original$company,tolower)

#separate product code and number
refine_original$product_number <- refine_original$Product.code...number

refine_original$product_code <- sapply(strsplit(as.character(refine_original$Product.code...number), "-"), "[" ,1)

refine_original$product_number <- sapply(strsplit(as.character(refine_original$product_number), "-"), "[" ,2)

#add product categories
createCategory <- function(x){
  if(x=='p')
    return("Smartphone")
  if(x=='v')
    return("TV")
  if(x=='x')
    return("Laptop")
  if(x=='q')
    return("Tablet")
} 
refine_original$product_category <- lapply(refine_original$product_code,createCategory)


#Create dummy variables for company and product category

createBinaryValPhilips<- function(x){
  if(x=="philips")
    return(1)
  else{
    return(0)
  }
}
createBinaryValunilever<- function(x){
  if(x=="unilever")
    return(1)
  else{
    return(0)
  }
}
createBinaryValakzo<- function(x){
  if(x=="akzo")
    return(1)
  else{
    return(0)
  }
}
createBinaryValvan_houten<- function(x){
  if(x=="van_houten")
    return(1)
  else{
    return(0)
  }
}
refine_original$company_philips <- lapply(refine_original$company,createBinaryValPhilips)
refine_original$company_akzo <- lapply(refine_original$company,createBinaryValakzo)
refine_original$company_van_houten <- lapply(refine_original$company,createBinaryValvan_houten)
refine_original$company_unilever <- lapply(refine_original$company,createBinaryValunilever)

createBinaryValsmartphone<- function(x){
  if(tolower(x)=="smartphone")
    return(1)
  else{
    return(0)
  }
}
createBinaryValtv<- function(x){
  if(tolower(x)=="tv")
    return(1)
  else{
    return(0)
  }
}
createBinaryVallaptop<- function(x){
  if(tolower(x)=="laptop")
    return(1)
  else{
    return(0)
  }
}
createBinaryValtablet<- function(x){
  if(tolower(x)=="tablet")
    return(1)
  else{
    return(0)
  }
}

refine_original$product_smartphone <- lapply(refine_original$product_category,createBinaryValsmartphone)
refine_original$product_tv <- lapply(refine_original$product_category,createBinaryValtv)
refine_original$product_laptop <- lapply(refine_original$product_category,createBinaryVallaptop)
refine_original$product_tablet <- lapply(refine_original$product_category,createBinaryValtablet)

head(refine_original)

write.csv(refine
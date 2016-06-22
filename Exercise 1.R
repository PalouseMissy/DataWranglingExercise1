
R version 3.0.3 (2014-03-06) -- "Warm Puppy"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> #load data table
  > refine_original <- read.csv("C:/Users/mlee/Desktop/refine_original.csv")
>   View(refine_original)
> 
  > #clean up brand names
  > refine_original$company <- lapplyrefine_original$company,tolower)
Error: unexpected ',' in "refine_original$company <- lapplyrefine_original$company,"
> 
  > #separate product code and numer
  > refine_original$product_number <- refine_original$Product.code...number
> 
  > refine_original$product_code <- sapply(strsplit(as.character(refine_original$Product.code...number), "-"), "[" ,1)
> 
  > refine_original$product_number <- sapply(strsplit(as.character(refine_original$product_number), "-"), "[" ,2)
> 
  > #add product categories
  > createCategory <- function(x){
    +     if(x=='p')
      +         return("Smartphone")
    +     if(x=='v')
      +         return("TV")
    +     if(x=='x')
      +         return("Laptop")
    +     if(x=='q')
      +         return("Tablet")
    + } 
> refine_original$product_category <- lapply(refine_original$product_code,createCategory)
> 
  > 
  > #Create dummy variables for company and product category
  > 
  > createBinaryValPhilips<- function(x){
    +     if(x=="philips")
      +         return(1)
    +     else{
      +         return(0)
      +     }
    + }
> createBinaryValunilever<- function(x){
  +     if(x=="unilever")
    +         return(1)
  +     else{
    +         return(0)
    +     }
  + }
> createBinaryValakzo<- function(x){
  +     if(x=="akzo")
    +         return(1)
  +     else{
    +         return(0)
    +     }
  + }
> createBinaryValvan_houten<- function(x){
  +     if(x=="van_houten")
    +         return(1)
  +     else{
    +         return(0)
    +     }
  + }
> refine_original$company_philips <- lapply(refine_original$company,createBinaryValPhilips)
> refine_original$company_akzo <- lapply(refine_original$company,createBinaryValakzo)
> refine_original$company_van_houten <- lapply(refine_original$company,createBinaryValvan_houten)
> refine_original$company_unilever <- lapply(refine_original$company,createBinaryValunilever)
> 
  > createBinaryValsmartphone<- function(x){
    +     if(tolower(x)=="smartphone")
      +         return(1)
    +     else{
      +         return(0)
      +     }
    + }
> createBinaryValtv<- function(x){
  +     if(tolower(x)=="tv")
    +         return(1)
  +     else{
    +         return(0)
    +     }
  + }
> createBinaryVallaptop<- function(x){
  +     if(tolower(x)=="laptop")
    +         return(1)
  +     else{
    +         return(0)
    +     }
  + }
> createBinaryValtablet<- function(x){
  +     if(tolower(x)=="tablet")
    +         return(1)
  +     else{
    +         return(0)
    +     }
  + }
> 
  > refine_original$product_smartphone <- lapply(refine_original$product_category,createBinaryValsmartphone)
> refine_original$product_tv <- lapply(refine_original$product_category,createBinaryValtv)
> refine_original$product_laptop <- lapply(refine_original$product_category,createBinaryVallaptop)
> refine_original$product_tablet <- lapply(refine_original$product_category,createBinaryValtablet)
> 
  > head(refine_original)
company Product.code...number             address   city         country
1 Phillips                   p-5 Groningensingel 147 arnhem the netherlands
2 phillips                  p-43 Groningensingel 148 arnhem the netherlands
3  philips                   x-3 Groningensingel 149 arnhem the netherlands
4  phllips                  x-34 Groningensingel 150 arnhem the netherlands
5  phillps                  x-12 Groningensingel 151 arnhem the netherlands
6 phillipS                  p-23 Groningensingel 152 arnhem the netherlands
name product_number product_code product_category company_philips
1   dhr p. jansen              5            p       Smartphone               0
2   dhr p. hansen             43            p       Smartphone               0
3   dhr j. Gansen              3            x           Laptop               1
4   dhr p. mansen             34            x           Laptop               0
5  dhr p. fransen             12            x           Laptop               0
6 dhr p. franssen             23            p       Smartphone               0
company_akzo company_van_houten company_unilever product_smartphone product_tv
1            0                  0                0                  1          0
2            0                  0                0                  1          0
3            0                  0                0                  0          0
4            0                  0                0                  0          0
5            0                  0                0                  0          0
6            0                  0                0                  1          0
product_laptop product_tablet
1              0              0
2              0              0
3              1              0
4              1              0
5              1              0
6              0              0

#############################################################################
#Getting data from PDF/TXT to R
##############################################################################

rm(list=ls())

library(readxl)
library(tidyverse)
library(stringr)
library(stringi)
library(WriteXLS)

home <- "~/Dropbox/Brazil Contributions Data/"

#############################################################################
#Fixing mistakes in conversion
##############################################################################

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0024.xlsx"))

#Fixing errors related to contribution/expenses values
temp$X__1 <- gsub("R\\$", "", temp$X__1)
temp$X__1 <- gsub("RS", "", temp$X__1)
temp$X__1 <- gsub("CX3", "00", temp$X__1)
temp$X__1 <- gsub("f", "", temp$X__1)
temp$X__1 <- gsub("i", "", temp$X__1)
temp$X__1 <- gsub("\"00“", "00", temp$X__1)
temp$X__1 <- gsub("00\"", "00", temp$X__1)
temp$X__1 <- gsub(",", ".", temp$X__1)
temp$X__1 <- chartr("ÓÕÒO", "0000", temp$X__1) 
temp$X__1 <- chartr("ÓÕÒO", "0000", temp$X__1)
temp$X__2 <- gsub("U.UU", "0.00", temp$X__2)
temp$X__2 <- gsub("Ú,UÚ", "0.00", temp$X__2)
temp$X__2 <- gsub(",", ".", temp$X__2)
temp$`VALOR URR` <- gsub(",", ".", temp$`VALOR URR`)
temp$`VALOR URR` <- gsub("\\^", "", temp$`VALOR URR`)

#Fixing problems with accents/encoding
temp$DOADOR <- chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU", temp$DOADOR) 
temp$DOADOR <- gsub("I", "", temp$DOADOR) 
temp$DOADOR <- gsub("i", "", temp$DOADOR) 
temp$DOADOR <- gsub("\\“", "", temp$DOADOR) 
temp$`j CPF/CGC` <-  gsub("\\^", "", temp$`j CPF/CGC`)
temp$`j CPF/CGC` <-  gsub("\\*", "", temp$`j CPF/CGC`)
temp$`j CPF/CGC` <-  gsub("\\}", "", temp$`j CPF/CGC`)
temp$`j CPF/CGC` <-  gsub("\\'", "", temp$`j CPF/CGC`)
temp$`j CPF/CGC` <-  gsub(",", ".", temp$`j CPF/CGC`)

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
temp$DATA <-  gsub("1996", "1998", temp$DATA)
temp$DATA <-  gsub("19061", "1998", temp$DATA)
temp$DATA <-  gsub("1906", "1998", temp$DATA)
temp$DATA <- gsub("1908", "1998", temp$DATA)
temp$DATA <-  gsub("1900", "1998", temp$DATA)
temp$DATA <-  gsub("1968", "1998", temp$DATA)

#Fixing Coding Form of Resource
temp$`ESPÉCIE RECURSO` <- gsub("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

WriteXLS(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0024.xlsx"))






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

test <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0024.xlsx"))

#Fixing errors related to contribution/expenses values
test$X__1 <- gsub("R\\$", "", test$X__1)
test$X__1 <- gsub("RS", "", test$X__1)
test$X__1 <- gsub("CX3", "00", test$X__1)
test$X__1 <- gsub("f", "", test$X__1)
test$X__1 <- gsub("i", "", test$X__1)
test$X__1 <- gsub("\"00“", "00", test$X__1)
test$X__1 <- gsub("00\"", "00", test$X__1)
test$X__1 <- gsub(",", ".", test$X__1)
test$X__1 <- chartr("ÓÕÒO", "0000", test$X__1) 

#Fixing problems with accents/encoding
test$DOADOR <- chartr("ÇÀÁÃÂÉÊÍÓÕÔÚÜ", "CAAAAEEIOOOUU", test$DOADOR) 
test$`j CPF/CGC` <-  gsub("\\^", "", test$`j CPF/CGC`)
test$`j CPF/CGC` <-  gsub("\\*", "", test$`j CPF/CGC`)
test$`j CPF/CGC` <-  gsub("\\}", "", test$`j CPF/CGC`)
test$`j CPF/CGC` <-  gsub("\\'", "", test$`j CPF/CGC`)

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
test$DATA <-  gsub("1996", "1998", test$DATA)
test$DATA <-  gsub("19061", "1998", test$DATA)
test$DATA <-  gsub("1906", "1998", test$DATA)
test$DATA ���<-  gsub("1908", "1998", test$DATA)
test$DATA <-  gsub("1900", "1998", test$DATA)
test$DATA <-  gsub("1968", "1998", test$DATA)

#Exclude lines unnecessary
test <- test[-67,]

WriteXLS(test, "~/Desktop/temp.xlsx",  col.names = TRUE, row.names = F)







# doInstall <- TRUE  # Change to FALSE if you don't want packages installed.
# toInstall <- c("ROAuth", "streamR", "ggplot2", "stringr",
#                "maps", "Rfacebook", "devtools", "quanteda",
#                "igraph", "rvest", "httr", "yaml", "reshape", "formatR", "readtext",
#                "stringi", "corpus", "Unicode", "ghit", 
#                "gtools", "tm", "readxl", "xlsx", "tesseract")
# if (doInstall) install.packages(toInstall)
# if (doInstall) devtools::install_github("netdem-usc/netdemR")
# #ghit::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))
# 
# 
# library("openxlsx")
# library(stringr)
# library(stringi)
# library(gtools)
# library(tm)
# library(readxl)
# library(xlsx)
# library(tesseract)
# 
# options(scipen = 999) #disabling sci notation
# 
# 
# home <- "~/Desktop/temp/Contributions/00002201/"
# 
# system("pdftotext")
# system("pdftotext ~/Desktop/temp/Contributions/00002201/p13.pdf")
# 
# #These components need to be installed...
# file.exists(Sys.which(c("pdfinfo", "pdftotext")))
# file.exists(Sys.which(c("pdf_info", "ps2ascii")))
# 
# tt <- readPDF(control = list(text = "-layout"))
# rr <- tt(elem = list(uri = "~/Desktop/temp/Contributions/00002201/p14.pdf"), language = "pt", id = "id1")
# txt <- iconv(rr$content, from = "latin1")
# 
# 
# 
# text <- ocr(paste0(home, "p13.pdf"))
# cat(text)


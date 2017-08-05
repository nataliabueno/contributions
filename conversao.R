#############################################################################
#Getting data from PDF/TXT to R
##############################################################################

rm(list=ls())


doInstall <- TRUE  # Change to FALSE if you don't want packages installed.
toInstall <- c("ROAuth", "streamR", "ggplot2", "stringr",
               "maps", "Rfacebook", "devtools", "quanteda",
               "igraph", "rvest", "httr", "yaml", "reshape", "formatR", "readtext",
               "stringi", "corpus", "Unicode", "ghit", 
               "gtools", "tm", "readxl", "xlsx", "tesseract")
if (doInstall) install.packages(toInstall)
if (doInstall) devtools::install_github("netdem-usc/netdemR")
#ghit::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))


library("openxlsx")
library(stringr)
library(stringi)
library(gtools)
library(tm)
library(readxl)
library(xlsx)
library(tesseract)

options(scipen = 999) #disabling sci notation


home <- "~/Desktop/temp/Contributions/00002201/"

system("pdftotext")
system("pdftotext ~/Desktop/temp/Contributions/00002201/p13.pdf")

#These components need to be installed...
file.exists(Sys.which(c("pdfinfo", "pdftotext")))
file.exists(Sys.which(c("pdf_info", "ps2ascii")))

tt <- readPDF(control = list(text = "-layout"))
rr <- tt(elem = list(uri = "~/Desktop/temp/Contributions/00002201/p14.pdf"), language = "pt", id = "id1")
txt <- iconv(rr$content, from = "latin1")



text <- ocr(paste0(home, "p13.pdf"))
cat(text)


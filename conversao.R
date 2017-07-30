#############################################################################
#Getting data from PDF/TXT to R
##############################################################################

rm(list=ls())


library("openxlsx")
library(stringr)
library(stringi)
library(gtools)
library(tm)
library(readxl)
library(xlsx)
options(scipen = 999) #disabling sci notation


home <- "~/Dropbox/"

#These components need to be installed...
file.exists(Sys.which(c("pdfinfo", "pdftotext")))
file.exists(Sys.which(c("pdf_info", "ps2ascii")))

tt <- readPDF(control = list(text = "-layout"))
rr <- tt(elem = list(uri = "file_to_beconverted.pdf"), language = "pt", id = "id1")
txt <- iconv(rr$content, from = "latin1")

save(txt, file = "file.RData")


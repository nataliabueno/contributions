#############################################################################
#Getting data from PDF/TXT to R
##############################################################################

rm(list=ls())

library(dplyr)
library(stringr)
library(readxl)
library(readr)
library(magrittr)
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

##############################################################
###############################New item 
##############################################################

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0025.xlsx"))

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
temp$X__1 <- gsub("Q", "0", temp$X__2) #adicao, novo
temp$X__2 <- gsub("U.UU", "0.00", temp$X__2)
temp$X__2 <- gsub("Ú,UÚ", "0.00", temp$X__2)
temp$X__2 <- gsub(",", ".", temp$X__2)
temp$`VALOR \\ UFIR` <- gsub(",", ".", temp$`VALOR \\ UFIR`) #modificado da planilha 24
temp$`VALOR \\ UFIR` <- gsub("\\^", "", temp$`VALOR \\ UFIR`) #modificado da planilha 24
temp$`VALOR \\ UFIR` <- gsub("Ò", "0", temp$`VALOR \\ UFIR`) #novo por cause de erro novo de conversao


#Fixing problems with accents/encoding
temp$DOADOR <- chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU", temp$DOADOR) 
temp$DOADOR <- gsub("I", "", temp$DOADOR) 
temp$DOADOR <- gsub("i", "", temp$DOADOR) 
temp$DOADOR <- gsub("\\“", "", temp$DOADOR) 
temp$`CPF/CGC` <-  gsub("\\^", "", temp$`CPF/CGC`) #modificado
temp$`CPF/CGC` <-  gsub("\\*", "", temp$`CPF/CGC`)
temp$`CPF/CGC` <-  gsub("\\}", "", temp$`CPF/CGC`)
temp$`CPF/CGC` <-  gsub("\\'", "", temp$`CPF/CGC`)
temp$`CPF/CGC` <-  gsub(",", ".", temp$`CPF/CGC`)

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
temp$DATA <-  gsub("1996", "1998", temp$DATA)
temp$DATA <-  gsub("19061", "1998", temp$DATA)
temp$DATA <-  gsub("1906", "1998", temp$DATA)
temp$DATA <- gsub("1908", "1998", temp$DATA)
temp$DATA <-  gsub("1900", "1998", temp$DATA)
temp$DATA <-  gsub("1968", "1998", temp$DATA)
temp$DATA <-  gsub("\\*", "\\/", temp$DATA)

#Fixing Coding Form of Resource
temp$`ESPECIE RECURSO` <- gsub("É", "E", temp$`ESPECIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

WriteXLS(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0025.xlsx"))


##############################################################
############################### p8-79 - 0030
##############################################################

home <- "C:/Users/work_/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0030.xlsx"))

#Fixing errors related to contribution/expenses values
temp$`"VALÕR^~~ R$` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
  str_replace_all(",", ".") %>% 
  chartr("ÓÕÒO", "0000",.) %>% 
  chartr("ÓÕÒO", "0000",.) %>% 
  str_replace_all("Q", "0") %>% 
  str_replace_all("C", "0")
temp$`"VALÕR^~~ R$`[27] <- str_replace(temp$`"VALÕR^~~ R$`[27],"\\.","")


temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") 
temp$`VALOR UFIR`[27] <- str_replace(temp$`VALOR UFIR`[27],"\\.","")

#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "")

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/")

for (i in 1:nrow(temp)){
  if (nchar(temp$DATA[i]) < 10){
    data <- str_sub(temp$DATA[i], start = 1, end = 2) %>% 
      str_c(.,"/")
    temp$DATA[i] <- str_replace(temp$DATA[i],str_sub(temp$DATA[i], start = 1, end = 2), data)
  } else{
    temp$DATA[i] %<>%  str_replace_all("i", "")
  }
}

#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0030.csv"))


##############################################################
############################### p8-79 - 0029
##############################################################

home <- "C:/Users/work_/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0029.xlsx"))

#Fixing errors related to contribution/expenses values
temp$`VALOR R$` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% 
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
  str_replace_all(",", ".") %>% 
  chartr("ÓÕÒO", "0000",.) %>% 
  chartr("ÓÕÒO", "0000",.) %>% 
  str_replace_all("Q", ",0") %>% 
  str_replace_all("C", "0") %>% 
  str_replace_all("Õ", "0") %>% 
  str_replace_all("\\|", "") %>% 
  str_replace_all("[“]", "") #Sem solução para este str_replace em especifico



temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") 


#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "")

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("Õ", "0")


# Não funcionou, queria substituir datas como  02106/1998 por 02/06/1998
#for (i in 1:nrow(temp)){
  #if (nchar(temp$DATA[i]) == 16){
    #data <- str_sub(temp$DATA[i], start = 1, end = 3) 
    #if (data != "011"){
      #data <- str_replace(data,"1", "\\/")
      #temp$DATA[i] <- str_replace(temp$DATA[i],str_sub(temp$DATA[i], start = 1, end = 3), data)
    #}
  #}
#}

#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0029.csv"))



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

##############################################################
############################### p8-79 - 0028
##############################################################

home <- ""
temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0028.xlsx"))

#Fixing errors related to contribution/expenses values
temp$`VALOR R$` <- gsub("R\\$", "", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("RS", "", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("CX3", "00", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("f", "", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("i", "", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("\"00“", "00", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("00\"", "00", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub(",", ".", temp$`VALOR R$`)
temp$`VALOR R$` <- chartr("ÓÕÒO", "0000", temp$`VALOR R$`) 
temp$`VALOR R$` <- chartr("ÓÕÒO", "0000", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("U.UU", "0.00", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub("Ú,UÚ", "0.00", temp$`VALOR R$`)
temp$`VALOR R$` <- gsub(",", ".", temp$`VALOR R$`)
temp$`VALOR UFIR` <- gsub(",", ".", temp$`VALOR UFIR`) #modificado da planilha 24
temp$`VALOR UFIR` <- gsub("\\^", "", temp$`VALOR UFIR`) #modificado da planilha 24
temp$`VALOR UFIR` <- gsub("Ò", "0", temp$`VALOR UFIR`) #novo por cause de erro novo de conversao
temp$DATA <- gsub("r", "", temp$DATA)

# Fix the dates
for (i in 1:nrow(temp)){
  if(str_length(temp$DATA[i]) != 10){
     x <- str_c(str_match(temp$DATA[i], "\\d\\d"),"/")
    temp$DATA[i]<- str_replace(temp$DATA[i], str_match(temp$DATA[i], "\\d\\d"),x)
  }
}
#for (i in 1:nrow(temp)){
  #if(str_detect(temp$DATA[i], "\\*")){
    #temp$DATA[i] <- str_replace_all(temp$DATA[i], "\\*", "")
  #}
#}

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
temp$DATA <-  gsub("1908", "1998", temp$DATA)
temp$DATA <-  gsub("1900", "1998", temp$DATA)
temp$DATA <-  gsub("1968", "1998", temp$DATA)
temp$DATA <-  gsub("\\*", "\\/", temp$DATA)

#Fixing Coding Form of Resource
temp$`1 ESPECIE RECURSO` <- gsub("É", "E", temp$`1 ESPECIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

write.csv2(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0028.csv"))


##############################################################
############################### p8-79 - 0031
##############################################################

home <- ""

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0031.xlsx"))

# Remove the first line
temp <- temp[-1,]

#Fixing errors related to contribution/expenses values
temp$VAEQR %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("C", "0") %>% 
  str_replace_all("_", "") %>% 
  str_replace_all("ÍQ", "10") %>% 
  str_replace_all("J", ".") %>% 
  str_replace_all(" ", "") %>% 
  str_replace_all("Í", "1") %>% 
  str_replace_all("\\(/00v", "0.00") %>% 
  str_replace_all("ÇL","0") %>% 
  str_replace_all("Ç","0") %>% 
  str_replace_all("a","0") %>% 
  str_replace_all("'500X>", "50.00")

temp$VAEQR[3] <- "200.00"
temp$VAEQR[4] <- "30.00"
temp$VAEQR[5] <- "10.00"
temp$VAEQR[13] <- "50.00"

for (i in 1:nrow(temp)){
  if (temp$VAEQR[i] == "2.168.00"){
    temp$VAEQR[i] <- "2168.00"
  }
}

temp$`VACOR%ta` %<>%  str_replace_all(",", ".") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") 

for (i in 1:nrow(temp)){
  if (temp$`VACOR%ta`[i] == "2.255.75"){
    temp$`VACOR%ta`[i] <- "2255.75"
  }
}

#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "")

temp$DOADOR[31] <- "JOAO BOSCO DA SILVA"

temp$DOADOR[64] <- "LILIANA APARECIDA DE LIMA"

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

temp$ESPÉCIE %<>% str_replace_all("\\¦", "") %>% 
  str_replace_all("Í", "T")

temp$ESPÉCIE[20] <- "TRF.BANC."
#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0031.csv"))

##############################################################
############################### p8-79 - 0032
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0032.xlsx"))


#Fixing errors related to contribution/expenses values
temp$`—VATOR R$` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("C", "0") %>% 
  str_replace_all("_", "") %>% 
  str_replace_all("ÍQ", "10") %>% 
  str_replace_all("J", ".") %>% 
  str_replace_all(" ", "") %>% 
  str_replace_all("Í", "1") %>% 
  str_replace_all("\\(/00v", "0.00") %>% 
  str_replace_all("ÇL","0") %>% 
  str_replace_all("Ç","0") %>% 
  str_replace_all("a","0") %>% 
  str_replace_all("'500X>", "50.00") %>% 
  str_replace_all("'", "")

temp$`—VATOR R$`[66] <- "10.00"
temp$`—VATOR R$`[65] <- "20.00"

temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") 



#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "")


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

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0032.csv"))


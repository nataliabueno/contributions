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



##############################################################
############################### p8-79 - 0033
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0033.xlsx"))


#Fixing errors related to contribution/expenses values
temp$`R$` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("'", "") %>% 
  str_replace_all("1.450.00", "1450.00") %>% 
  str_replace_all("\\\\", "")


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
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "")

temp$DATA[20] <- "22/06/1998"
temp$DATA[21] <- "22/06/1998"
temp$DATA[26] <- "22/06/1998"
temp$DATA[27] <- "22/06/1998"
temp$DATA[50] <- "24/06/1998"
temp$DATA[51] <- "24/06/1998"
temp$DATA[45] <- "23/06/1998"

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

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0033.csv"))

##############################################################
############################### p8-79 - 0034
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0034.xlsx"))


#Fixing errors related to contribution/expenses values
temp$`VALOR R$` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("R$", "")
temp$`VALOR R$`[66] <- "20.00"


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
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") 


for (i in 1:nrow(temp)){
  if (nchar(temp$DATA[i]) < 10){
    data <- str_sub(temp$DATA[i], start = 1, end = 2) %>% 
      str_c(.,"/")
    temp$DATA[i] <- str_replace(temp$DATA[i],str_sub(temp$DATA[i], start = 1, end = 2), data)
  } else{
    temp$DATA[i] %<>%  str_replace_all("i", "")
  }
}


temp$DATA[29] <- "26/06/1998"


#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0034.csv"))

##############################################################
############################### p8-79 - 0035
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0035.xlsx"))

temp$X__1 <- NULL

#Fixing errors related to contribution/expenses values
temp$`VALOR . V-WV` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("R$", "")

temp$`VALOR . V-WV`[64] <- "10.00"
temp$`VALOR . V-WV`[65] <- "10.00"
temp$`VALOR . V-WV`[66] <- "10.00"

temp$`VALOR \\ UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")
  



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
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")


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

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0035.csv"))

##############################################################
############################### p8-79 - 0036
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0036.xlsx"))



#Fixing errors related to contribution/expenses values
temp$`- ..VALOR/'` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("R$", "")

temp$`- ..VALOR/'`[18] <- "50.00"

temp$`valorX UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")
  



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
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")


for (i in 1:nrow(temp)){
  if (nchar(temp$DATA[i]) < 10){
    data <- str_sub(temp$DATA[i], start = 1, end = 2) %>% 
      str_c(.,"/")
    temp$DATA[i] <- str_replace(temp$DATA[i],str_sub(temp$DATA[i], start = 1, end = 2), data)
  } else{
    temp$DATA[i] %<>%  str_replace_all("i", "")
  }
}

temp$DATA[10] <- "30/06/1998"
temp$DATA[19] <- "30/06/1998"

#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0036.csv"))

##############################################################
############################### p8-79 - 0038
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0038.xlsx"))



#Fixing errors related to contribution/expenses values
temp$`R$` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("R$", "")

temp$`R$`[66] <- "70.00"

temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")
  



#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","")

temp$DOADOR[66] <- temp$DOADOR[65]


temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "")

temp$`ESPÉCIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "")

temp$`ESPÉCIE RECURSO` <- "CARNE BANC."

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
temp$`|datã` %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","")


for (i in 1:nrow(temp)){
  if (nchar(temp$`|datã`[i]) < 10){
    data <- str_sub(temp$`|datã`[i], start = 1, end = 2) %>% 
      str_c(.,"/")
    temp$`|datã`[i] <- str_replace(temp$`|datã`[i],str_sub(temp$`|datã`[i], start = 1, end = 2), data)
  } else{
    temp$`|datã`[i] %<>%  str_replace_all("i", "")
  }
}

temp$`|datã`[1] <- "06/07/1998"


#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0038.csv"))

##############################################################
############################### p8-79 - 0039
##############################################################

home <- "C:/Users/9371814/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0039.xlsx"))


#Fixing errors related to contribution/expenses values
temp$`VÂLÕR R$` %<>% str_replace_all("R\\$", "") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00")

temp$`VALOR UFIR`[63:66] <- "10.40"

temp$`VÂLÕR R$`[66] <- "10.00"

temp$`VÂLÕR R$`[17:18] <- "10.00"

temp$`VALOR UFIR`[17:18] <- "10.40"

temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")
  



#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","")

temp$DOADOR[66] <- "VALDECIRA FROTA ARAUJO"


temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "")

temp$`CPF/CGC`[64] <- "475.719.506-00"
temp$`CPF/CGC`[63] <- "176.574.824-00"
temp$`CPF/CGC`[65] <- "309.288.263-68"

temp$`ESPECIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "")

temp$`ESPECIE RECURSO`[64] <- "CARNE BANC."

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","") %>% 
  str_replace_all("19981", "1998") %>% 
  str_replace_all("1993","1998") %>% 
  str_replace_all("M ","1") %>% 
  str_replace_all("1990","1998")


for (i in 1:nrow(temp)){
  if (nchar(temp$DATA[i]) < 10){
    data <- str_sub(temp$DATA[i], start = 1, end = 2) %>% 
      str_c(.,"/")
    temp$DATA[i] <- str_replace(temp$DATA[i],str_sub(temp$DATA[i], start = 1, end = 2), data)
  } else{
    temp$DATA[i] %<>%  str_replace_all("i", "")
  }
}

temp$DATA[1] <- "09/07/1998"
temp$DATA[64] <- "14/07/1998"


temp$DATA <- lubridate::dmy(temp$DATA, quiet = T)
#Fixing Coding Form of Resource 
# temp$`ESPÉCIE RECURSO` <- str_replace_all("É", "E", temp$`ESPÉCIE RECURSO`) 

#Exclude lines unnecessary
temp <- temp[-67,]

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0039.csv"))

##############################################################
############################### p8-79 - 0040
##############################################################

home <- "C:/Users/work_/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0040.xlsx"))

temp <- temp[-1,]

#Fixing errors related to contribution/expenses values
temp$X__1 %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",")


temp$X__1[41] <- "10,00"
temp$X__1[42] <- "6,00"
temp$X__1[66] <- "10,00"
temp$X__1[56] <- "1450,00"

for (i in 1:nrow(temp)){
  if(temp$X__1[i] == "1,450,00"){
    temp$X__1[i] <- "1450,00"
  }
}

temp$`VALOR UF1R` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")

temp$`VALOR UF1R` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",")%>% 
  str_replace_all("\"","")

temp$`VALOR UF1R`[22] <- "52,02"
temp$`VALOR UF1R`[39] <- "15,61"
temp$`VALOR UF1R`[53:59] <- "1506,69"


#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","")

temp$DOADOR[c(1,19)] <- "NATALIA ROSA DA SILVA"

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("h", "")



temp$`ESPÉCIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("Í", "") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("À", "A") %>% 
  str_replace_all(",",".")

temp$`ESPÉCIE RECURSO`[9] <- "CARNE BANC."
temp$`ESPÉCIE RECURSO`[42] <- "CARNE BANC."
temp$`ESPÉCIE RECURSO`[38] <- "CARNE BANC."
temp$`ESPÉCIE RECURSO`[47] <- "CARNE BANC."
temp$`ESPÉCIE RECURSO`[23] <- "CARNE BANC."

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates # CONTINUAR AQUI
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","") %>% 
  str_replace_all("19981", "1998") %>% 
  str_replace_all("1993","1998") %>% 
  str_replace_all("M ","1") %>% 
  str_replace_all("1990","1998") %>% 
  str_replace_all("X", "/") %>% 
  str_replace_all("37","07")


temp$DATA_2 <- rep("/07/1998", nrow(temp))

for(i in 1:nrow(temp)){
  dia <- str_sub(temp$DATA[i], start = 1,end = 2)
  temp$DATA_2[i] <- str_c(dia,temp$DATA_2[i])
}

temp$DATA_2 %<>% str_replace_all("t", "1") %>% 
  str_replace_all("Í", "1")

temp$DATA_2[9] <- "15/07/1998"

temp$DATA_2 <- lubridate::dmy(temp$DATA_2, quiet = T)
#Fixing Coding Form of Resource 

#Exclude lines unnecessary
temp <- temp[-67,]

temp$espaco <- rep(" ", nrow(temp))
temp$espaco2<- rep(" ", nrow(temp))
temp$espaco3 <- rep(" ", nrow(temp))
temp %<>% select(`CPF/CGC`, espaco, X__1, DOADOR,espaco2,espaco3,`ESPÉCIE RECURSO`, DATA_2) 

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0040.csv"))

##############################################################
############################### p8-79 - 0041
##############################################################

home <- "C:/Users/work_/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0041.xlsx"))

temp <- temp[-1,]

#Fixing errors related to contribution/expenses values
temp$X__1 %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("j", "") %>% 
  str_replace_all("ttT", ",00")


temp$X__1[22] <- "20,00"
temp$X__1[27] <- "50,00"
temp$X__1[35] <- "50,00"
temp$X__1[44] <- "10,00"
temp$X__1[52] <- "20,00"
temp$X__1[59] <- "50,00"
temp$X__1[61] <- "50,00"
temp$X__1[c(65,66)] <- "10,00"
temp$X__1[32] <- "120,00"
temp$X__1[41] <- "50,00"

for (i in 1:nrow(temp)){
  if(temp$X__1[i] == "1,450,00"){
    temp$X__1[i] <- "1450,00"
  } else if (temp$X__1[i] == "10,000,00"){
    temp$X__1[i] <- "10000,00"
  } else if (temp$X__1[i] == "8,000,00"){
    temp$X__1[i] <- "8000,00"
  }else if(temp$X__1[i] == "32,944,82"){
    temp$X__1[i] <- "32944,82"
  }
}

temp$`VALOR URR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")

temp$`VALOR URR` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",")%>% 
  str_replace_all("\"","")

for (i in 1:nrow(temp)){
  if(temp$`VALOR URR`[i] == "1,506.69"){
    temp$`VALOR URR`[i] <- "1506.69"
  } else if (temp$`VALOR URR`[i] == "10,404.74"){
    temp$`VALOR URR`[i] <- "10404.74"
  } else if (temp$`VALOR URR`[i] == "8,323.80"){
    temp$`VALOR URR`[i] <- "8323.80"
  }else if(temp$`VALOR URR`[i] == "34,278.24"){
    temp$`VALOR URR`[i] <- "34278.24"
  }
}

temp$`VALOR URR`[64] <- "20,81"
temp$`VALOR URR`[60] <- "31,21"
temp$`VALOR URR`[7] <- "20,81"


#Fixing problems with accents/encoding
temp$`'doador “ ~~ '` %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("' '","") %>% 
  str_replace_all("~","") 

temp$`'doador “ ~~ '`[c(57,58)] <- "ALICE CARDOSO FERREIRA"
temp$`'doador “ ~~ '`[59] <- "PEDRO DE OLIVEIRA"
temp$`'doador “ ~~ '`[62] <- "MARTHA REGINA SILVA RODRIGUES"
temp$`'doador “ ~~ '`[65] <- "IZANOR PEREIRA"
temp$`'doador “ ~~ '`[66] <- "NEWMA STELA SA"

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("h", "") %>% 
  str_replace_all("L","") %>% 
  str_replace_all("-1","")



temp$`ESPÉCIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("Í", "") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("À", "A") %>% 
  str_replace_all(",",".")

temp$`ESPÉCIE RECURSO`[43] <- "CARNE BANC."


#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates # CONTINUAR AQUI
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","") %>% 
  str_replace_all("19981", "1998") %>% 
  str_replace_all("1993","1998") %>% 
  str_replace_all("M ","1") %>% 
  str_replace_all("1990","1998") %>% 
  str_replace_all("X", "/") %>% 
  str_replace_all("37","07")


temp$DATA_2 <- rep("/07/1998", nrow(temp))

for(i in 1:nrow(temp)){
  dia <- str_sub(temp$DATA[i], start = 1,end = 2)
  temp$DATA_2[i] <- str_c(dia,temp$DATA_2[i])
}

temp$DATA_2[40] <- "27/07/1998"
temp$DATA_2[43] <- "27/07/1998"

temp$DATA_2 <- lubridate::dmy(temp$DATA_2, quiet = T)
#Fixing Coding Form of Resource 

#Exclude lines unnecessary
temp <- temp[-67,]

temp$espaco <- rep(" ", nrow(temp))
temp$espaco2<- rep(" ", nrow(temp))
temp$espaco3 <- rep(" ", nrow(temp))
temp %<>% select(`CPF/CGC`, espaco,DATA_2, X__1,`'doador “ ~~ '`,espaco2,espaco3,`ESPÉCIE RECURSO`,DATA_2) 

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0041.csv"))

##############################################################
############################### p8-79 - 0042
##############################################################

home <- "C:/Users/work_/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0042.xlsx"))


#Fixing errors related to contribution/expenses values
temp$`^-VACDR R$`%<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",") %>% 
  str_replace_all("'","")

temp$`^-VACDR R$`[c(7,8)] <- c("30,00","50,00")
temp$`^-VACDR R$`[26] <- "50,00"
temp$`^-VACDR R$`[c(46,47)] <- c("60,00","50,00")
temp$`^-VACDR R$`[c(10,12,14)] <- "50,00"
temp$`^-VACDR R$`[13] <- "100,00"
temp$`^-VACDR R$`[18] <- "15,00"
temp$`^-VACDR R$`[11] <- "Verificar no documento original"
temp$`^-VACDR R$`[66] <- "Verificar no documento original"


temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")

temp$`VALOR UFIR` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("\\r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",")%>% 
  str_replace_all("\"","")

temp$`VALOR UFIR`[c(10:14,58)] <- c("52,02", "624,28","52,02","104,05","52,02","31,21")




#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("' '","") %>% 
  str_replace_all("~","") %>% 
  str_replace_all("Õ", "O") %>% 
  str_replace_all("0", "O")


temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("h", "") %>% 
  str_replace_all("L","") %>% 
  str_replace_all("-1","") %>% 
  str_replace_all("Q","0")


temp$`ESPÉCIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("Í", "") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("À", "A") %>% 
  str_replace_all(",",".") %>% 
  str_replace_all("Ã", "A") %>% 
  str_replace_all("Õ","O")

temp$`ESPÉCIE RECURSO`[c(1:10,12:39,42,50,65)] <- "CARNE BANC."


#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates # CONTINUAR AQUI
temp$DATA %<>% str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","") %>% 
  str_replace_all("19981", "1998") %>% 
  str_replace_all("1993","1998") %>% 
  str_replace_all("M ","1") %>% 
  str_replace_all("1990","1998") %>% 
  str_replace_all("X", "/") %>% 
  str_replace_all("37","07")


temp$DATA_2 <- rep("/07/1998", nrow(temp))

for(i in 1:nrow(temp)){
  dia <- str_sub(temp$DATA[i], start = 1,end = 2)
  temp$DATA_2[i] <- str_c(dia,temp$DATA_2[i])
}

temp$DATA_2[c(1,8,46,58,64)] <- c("29/07/1998","29/07/1998","31/07/1998","31/07/1998","31/07/1998")

temp$DATA_2 <- lubridate::dmy(temp$DATA_2, quiet = T)
#Fixing Coding Form of Resource 

#Exclude lines unnecessary
temp <- temp[-67,]

temp$espaco <- rep(" ", nrow(temp))
temp$espaco2<- rep(" ", nrow(temp))
temp$espaco3 <- rep(" ", nrow(temp))
temp %<>% select(`CPF/CGC`, espaco,DATA_2,`^-VACDR R$`,DOADOR, espaco2,espaco3,`ESPÉCIE RECURSO`) 

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0042.csv"))

##############################################################
############################### p8-79 - 0055
##############################################################

home <- "/home/nathang/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0055 R- Nathan.xlsx"))

#Fixing errors related to contribution/expenses values
temp$`VALOR R$` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",") %>% 
  str_replace_all("F", "")

temp$`VALOR UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")

temp$`VALOR UFIR` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",")%>% 
  str_replace_all("\"","")

#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","")

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("h", "")

temp$`ESPÉCIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("Í", "") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("À", "A") %>% 
  str_replace_all(",",".")

temp$`ESPÉCIE RECURSO`[25] <- "CARNE BANC."

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates # CONTINUAR AQUI
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","") %>% 
  str_replace_all("19981", "1998") %>% 
  str_replace_all("1993","1998") %>% 
  str_replace_all("M ","1") %>% 
  str_replace_all("1990","1998") %>% 
  str_replace_all("X", "/") %>% 
  str_replace_all("37","07")

temp$DATA[25] <- "05/10/1998"

temp$DATA <- lubridate::dmy(temp$DATA, quiet = T)
#Fixing Coding Form of Resource 

#Exclude lines unnecessary
temp <- temp[-67,]

temp$espaco <- rep(" ", nrow(temp))
temp$espaco2<- rep(" ", nrow(temp))
temp$espaco3 <- rep(" ", nrow(temp))
temp %<>% select(`CPF/CGC`, espaco,DATA,`VALOR R$`,DOADOR, espaco2,espaco3,`ESPÉCIE RECURSO`) 

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0055.csv"))

##############################################################
############################### p8-79 - 0057
##############################################################

home <- "/home/nathang/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0057 R- Nathan.xlsx"))

#Fixing errors related to contribution/expenses values
temp$`’ R$` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",") %>% 
  str_replace_all("\\(", "") %>% 
  str_replace_all("\\;", "")

for (i in 1:nrow(temp)){
  if(temp$`’ R$`[i] == "1,450,00" | temp$`’ R$`[i] == "1,400,00"){
    temp$`’ R$`[i] <- "1450,00"
  }
}
temp$`’ R$`[c(1,4,7,11,19,20,29,37,38,39,41,42,48,65,66)] <- c("40,00", "20,00", "80,00", "90,00", "10,00", "20,00", "100,00", "60,00", "60,00", "60,00", "10,00", "10,00","30,00", "20,00", "20,00")

temp$`VALORA. UFIR` %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")



#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","") %>% 
  str_to_upper()

temp$DOADOR[63] <- "LEILA DOROTEIA DE CASTRO"

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("h", "") %>% 
  str_replace_all("Õ", "0")

temp$`ESPECIE RECURSO`%<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("Í", "") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("À", "A") %>% 
  str_replace_all(",",".") %>% 
  str_replace_all("~1", "") %>% 
  str_replace_all("Ã", "A") %>% 
  str_replace_all("71", "") %>% 
  str_replace_all("Á","A")

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates # CONTINUAR AQUI
temp$DATA_2 <- rep("/10/1998", nrow(temp))

for(i in 1:nrow(temp)){
  dia <- str_sub(temp$DATA[i], start = 1,end = 2)
  temp$DATA_2[i] <- str_c(dia,temp$DATA_2[i])
}

temp$DATA_2 <- lubridate::dmy(temp$DATA_2, quiet = T)
#Fixing Coding Form of Resource 

#Exclude lines unnecessary
temp <- temp[-67,]

temp$espaco <- rep(" ", nrow(temp))
temp$espaco2<- rep(" ", nrow(temp))
temp$espaco3 <- rep(" ", nrow(temp))
temp %<>% select(`CPF/CGC`, espaco,DATA_2,`’ R$`,DOADOR, espaco2,espaco3,`ESPECIE RECURSO`) 

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0057.csv"))

##############################################################
############################### p8-79 - 0056
##############################################################

home <- "/home/nathang/Dropbox/Brazil Contributions Data/"

temp <- read_excel(paste0(home, "Coding/conversion/p8-79.xlsx/p8-79 - 0056 R- Nathan.xlsx"))

temp$X__1 <- NULL

#Fixing errors related to contribution/expenses values
temp$`— R$` %<>% str_replace_all("R\\$", "") %>% 
  str_replace_all("RS", "") %>% 
  str_replace_all("CX3", "00") %>% 
  str_replace_all("f", "") %>% 
  str_replace_all("i", "1") %>% #Intuitivamente dá para saber que o i vale 1
  str_replace_all("o", "0") %>% 
  str_replace_all("\"00“", "00") %>% 
  str_replace_all("00\"", "00") %>% 
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
  str_replace_all("R$", "") %>% 
  str_replace_all("b0]", "00") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("\\$", "") %>% 
  str_replace_all("T0", "00") %>% 
  str_replace_all("R", "") %>% 
  str_replace_all("D", "0") %>% 
  str_replace_all("I", "") %>% 
  str_replace("\\.",",") %>% 
  str_replace_all("\\(", "") %>% 
  str_replace_all("\\;", "")

temp$`— R$`[c(11:18)] <- c("500,00", "560,00", "560,00","560,00","10,00","10,00","60,00","50,00")
temp$`— R$`[c(65,66)] <- c("30,00", "10,00")

temp %<>% rename(UFIR = `VALOR\\J UFIR`) 

temp$UFIR %<>%  str_replace_all(",", ".") %>% #Não deu certo! Talvez tenha que ser mudado manualmente
  str_replace_all("\\^", "") %>% 
  str_replace_all("Ò", "0") %>% 
  str_replace_all("\\'","") %>% 
  str_replace_all("\\-","") %>% 
  str_replace_all("\\•","")

temp$UFIR %<>% str_sub(start = 1,end = 6)

#Fixing problems with accents/encoding
temp$DOADOR %<>%  chartr("ÇÀÁÃÂÉÊÍÓÕÒÔÚÜ", "CAAAAEEIOOOOUU",.) %>% 
  str_replace_all("1", "I") %>% 
  str_replace_all("i", "") %>% 
  str_replace_all("\\“", "") %>% 
  str_replace_all("/", "I") %>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("\"","") %>% 
  str_to_upper()

temp$DOADOR[c(54,60,66)] <- c("CLOVIS DIAS SILVA", "JOSE MAURICIO DA SILVA", "RUBENS RIBEIRO MIRANDA")

temp$`CPF/CGC` %<>%   str_replace_all("\\^", "")  %>% #Alguns casos não poderam ser substituidos pois não tinha a informação sobre eles
  str_replace_all("\\*", "") %>% 
  str_replace_all("\\}", "") %>% 
  str_replace_all("\\'", "") %>% 
  str_replace_all(",", ".")%>% 
  str_replace_all("\\^", "") %>% 
  str_replace_all("r", "") %>% 
  str_replace_all("h", "") %>% 
  str_replace_all("Õ", "0")

temp$`ESPECIE RECURSO` %<>% str_to_upper() %>% 
  str_replace_all("\\[", "") %>% 
  str_replace_all("\"","") %>% 
  str_replace_all("\\^", "")%>% 
  str_replace_all("H", "")%>% 
  str_replace_all("P", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("“", "") %>% 
  str_replace_all("Í", "") %>% 
  str_replace_all("'","") %>% 
  str_replace_all("À", "A") %>% 
  str_replace_all(",",".") %>% 
  str_replace_all("~1", "") %>% 
  str_replace_all("Ã", "A")

#Fixing date problems/make sure that dates are actually wrong before doing this
#Make sure that these are the wrong dates # CONTINUAR AQUI
temp$DATA %<>%   str_replace_all("1996", "1998") %>% 
  str_replace_all("19061", "1998") %>% 
  str_replace_all("1906", "1998") %>% 
  str_replace_all("1908", "1998") %>% 
  str_replace_all("1900", "1998") %>% 
  str_replace_all("1968", "1998") %>% 
  str_replace_all("\\*", "\\/") %>% 
  str_replace_all("'","") %>% 
  str_replace("i", "") %>% 
  str_replace_all("1398", "1998")%>% 
  str_replace_all("F", "")%>% 
  str_replace_all("r", "") %>% 
  str_replace_all("f","") %>% 
  str_replace_all("19981", "1998") %>% 
  str_replace_all("1993","1998") %>% 
  str_replace_all("M ","1") %>% 
  str_replace_all("1990","1998") %>% 
  str_replace_all("X", "/") %>% 
  str_replace_all("37","07") %>% 
  str_replace_all("1966", "1998") %>% 
  str_replace_all("Í", "1") %>% 
  str_replace_all("“T47TMES8", "")

temp$DATA <- lubridate::dmy(temp$DATA, quiet = T)
#Fixing Coding Form of Resource 

#Exclude lines unnecessary
temp <- temp[-67,]

temp$espaco <- rep(" ", nrow(temp))
temp$espaco2<- rep(" ", nrow(temp))
temp$espaco3 <- rep(" ", nrow(temp))
temp %<>% select(`CPF/CGC`, espaco,DATA,`— R$`,DOADOR, espaco2,espaco3,`ESPECIE RECURSO`) 

readr::write_csv(temp, paste0(home, "Coding/conversion/p8-79.xlsx_modified/p8-79 - 0056.csv"))


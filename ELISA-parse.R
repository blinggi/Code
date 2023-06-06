# purpose: parse Tytgat ELISA file to create figures for validation report
#lkjhlkjhl
rm(list=ls())
require(readxl)
require(tidyverse)

#input 
dat = read_xlsx('../SourceFiles/Overview STAT3 ELISA data.xlsx', sheet= 'overview p-Tyr705 STAT3', skip = 0, col_types = 'numeric')

Abs = data.frame(dat[72:78,2:3])
str(Abs)
Std = data.frame(dat[72:78, 20]) #note: values seem reversed 


Dat2= data.frame(cbind(rev(Std$...20), Abs))
colnames(Dat2)=c('StdValue', "AbsRep1", "AbsRep2")
Dat3 = Dat2 %>% pivot_longer(cols=2:3)
           
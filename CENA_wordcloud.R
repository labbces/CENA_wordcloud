#install.packages("PubMedWordcloud",dependencies=TRUE)
library(PubMedWordcloud)
library(stringr)
rm(list=ls())
setwd("/data/diriano/CENA_wordcloud/")
researchersBiol=c('Antonio Figueira','Diego M Riano-Pachon', 'Marli F Fiore', 'Ernani Pinto', 'Tsai Siu Mui', 'Azevedo Joao L', 'Acacio Aparecido Navarrete', 'Lucas William Mendes', 'Martinelli LA',  'Maria Carolina Quecine', 'Helder Louvandini', 'Adibe Luiz Abdalla', 'Francisco Scaglia Linhares', 'Adriana Pinheiro Martinelli', 'Jose Lavres', 'Abreu CH', 'Clissia Barboza da Silva')
researchersNucl=c('Martinelli LA',  'Helder Louvandini', 'Adibe Luiz Abdalla', 'Jose Lavres', 'Abreu CH', 'Valter Arthur', 'Spoto MHF', 'Mastrangelo T', 'Pessenda LC', 'Quirijn de Jong van Lier')
researchersQuim=c('Martinelli LA',  'Adibe Luiz Abdalla', 'Jose Lavres', 'Spoto MHF', 'de Camargo PB', 'Celia Regina Montes', 'Tornisielo VL', 'Martinez DST', 'Ernani Pinto', 'de Carvalho HWP', 'de Alencar SM', 'De Nadai Fernandes EA', 'Rocha FRP', 'Reis Boaventura', 'Melchert WR', 'Kamogawa MY')

pmidsCENAPPG=c()
for (r in unique(c(researchersBiol,researchersNucl,researchersQuim))){
  print(r)
  outfile=r
  outfile=str_replace_all(outfile, "[ ,.]", "_")
  outfile=paste(outfile,'_wordcloud.pdf',sep='')
  pmids=getPMIDs(author=r,dFrom=2019,dTo=2023,n=1000)
  pmidsCENAPPG=append(pmidsCENAPPG,pmids)
  abstracts=getAbstracts(pmids)
  cleanAbs=cleanAbstracts(abstracts)
  pdf(file=outfile)
  plotWordCloud(cleanAbs,min.freq = 3, scale = c(2, 0.3))
  dev.off()
  
}

abstractsCENAPPG=getAbstracts(unique(pmidsCENAPPG))
cleanAbsCENAPPG=cleanAbstracts(abstractsCENAPPG)

pdf(file = "wordCloudCENAPPG.pdf")
plotWordCloud(cleanAbsCENAPPG,min.freq = 2, scale = c(2, 0.3))
dev.off()


getPMIDs(author="Reis Boaventura",dFrom=2019,dTo=2023,n=1000)

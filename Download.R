ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creating a vector of NCBI ID's 
library(rentrez) #loading the rentrez package 
library(dplyr)
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #passing our NCBI ID's to the nuccore database and returning them as FASTA files 

Bburg

Sequences <- strsplit(Bburg, split = "\n\n") #splitting the three seuqences into separate groups 
print(Sequences) #printing the sequences to the console 

Sequences <- unlist(Sequences) #changing the list to a dataframe 

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) #uses Regex to create a header and remove sequences 
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)  #uses Regex to capitilize 'ATCG' and remove headers 
Sequences<-data.frame(Name=header,Sequence=seq) #puts the header and seq into a dataframe 
seq1 <- gsub("[\r\n]", "", Sequences$Sequence) #removes new line characters from the sequence dataframe 
Sequences <- data.frame(Name=header, Sequence=seq1) #creates another dataframe of the header and sequences 
Sequences

setwd("/Users/damianbourne/Desktop/Queens/Academics/Undergrad/4th Year /Semester 2/BIOL432/Assignments/Rentrez")
write.csv(Sequences, "Sequences.csv") #saving the file 















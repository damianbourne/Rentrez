install.packages("rentrez") #installing rentrez
library(rentrez) #loading rentrez into R
ncbi_id <- c("NC_045512.2") #creating a vector of our NCBI ID
Covid <- entrez_fetch(db = "nuccore", id = ncbi_id, rettype = "fasta") #locating and grabbing the sequence data from NCBI

CovidSeq <- gsub("^>.*genome\\n([ATCG].*)", "\\1", Covid) #separating the sequence and header 
CovidFullSeq <- gsub("\n", "", CovidSeq) #removes new line characters from the sequence  
CovidFullSeq

covspl <- strsplit(CovidFullSeq, split = "") #splits the sequence into individual characters 
test <- covspl[[1]][21563:25384] #isolates the Sprotein open reading frame 

coltest <- paste(test, collapse = "") #combines the characters back together 
coltest #prints the Sprotien open reading frame to the console 

#From the blast search, I believe that this is a highly conserved gene as a large number of variants have the exact same sequence.
#All of the different variants have the same max score, total score, and query cover and percent identity


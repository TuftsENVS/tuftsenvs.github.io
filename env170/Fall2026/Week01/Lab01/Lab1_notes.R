
# creating shellfish count vectors
Mya<-c(45,38,75,62,19,62,60,89,26)
Mercenaria<-c(65,56,58,57,34,89,65,61,91)

# making a vector of genus names
genus<-c(rep("Mya",9),rep("Mercenaria",9))

# combining counts for each genus
count<-c(Mya,Mercenaria)

# reading shell length data from text file
meanLength<-scan("shellLengths.txt")

# combining genus, count, and length data into a dataframe
shellfish<-data.frame(genus,count,meanLength)

# plotting the data (changing symbol, size, and color)
plot(shellfish$count,shellfish$meanLength)
plot(shellfish$count,shellfish$meanLength,pch=16)
plot(shellfish$count,shellfish$meanLength,pch=16,cex=1.5)
plot(shellfish$count,shellfish$meanLength,pch=16,cex=1.5,col="blue")

# creating a vector of color names to correspond with each data point in the dataframe
shellfishColors<-c(rep("blue",9),rep("orange",9))

# final plot with labels and legend
  plot(shellfish$count,shellfish$meanLength,pch=16,cex=meanLength-1,col=shellfishColors,xlab="Number of Individuals",ylab="Mean Shell Length",main="Shellfish Samples from Cape Cod Study Sites",xlim=c(18,120))
  legend(55,3.1,legend=c("Mya","Mercenaria"),pch=16,col=c("blue","orange"),title="Genus",bty="n")
  legend(90,3.1,legend=c("1","3"),pch=16,pt.cex=c(1,3),title="Mean length",bty="n")

ggplot(shellfish, aes(x=count,y=meanLength,color=genus,size=meanLength-1)) +
geom_point() +
 # geom_smooth(method="lm",se=FALSE,linetype=2) +
scale_color_manual(values=c("orange", "blue")) +
  labs(x="Number of individuals",y="Mean length (mm)",color="Genus",title="Cape Cod Clams: \nStrength in Numbers?") +
  theme_classic()
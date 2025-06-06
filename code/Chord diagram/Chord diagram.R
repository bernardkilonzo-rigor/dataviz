#load libraries
library(circlize)

#creating data (exam results)
exam_results<-matrix(c(45,78,90,54,65,88,45,40,65,60,87,76,77,43,89,54,67),
                     nrow = 6, ncol = 3)
colnames(exam_results)<-c("Exam_1","Exam_2","Exam_3")
rownames(exam_results)<-c("Maths","Language","History","Science","Technology","Arts")

#saving the plot
png("chord_diagram.png", width = 800, height = 800)

#creating the plot

#creating custom colors
color<-c("Exam_1"="gray80","Exam_2"="gray50","Exam_3"="gray20",
         "Maths"="#855c75","Language"="#d9af6b","History"="#af6458",
         "Science"="#68855c","Technology"="#9c9c5e","Arts"="#526a83")

ch<-chordDiagram(exam_results, grid.col = color, transparency = 0.2)

#Adding title to the plot
title(main = "Exam Performance", col.main ="gray23", cex.main =1)

#close PNG device
dev.off()

#load libraries
library(tidyverse)

#create data
data<-data.frame(ID = 1:5,
                 Project_Task = c("Blog Post","Presentation","Workbook","Website","Video Blog"),
                 percent_complete =c(80,65,30,45,17))

#creating progress bar chart (a simple bar chart)
bc<-data%>%ggplot(aes(y = Project_Task, x = percent_complete))+
  geom_bar(stat = "identity", fill = "#618c03", width = 0.4, alpha = 0.8)+
  geom_text(aes(label = paste0(percent_complete,"%")),size =2.5, vjust = 0.5, hjust = -0.1)+
  labs(y = "Project Name", x = "Percent Complete",
       title = "Project Completion Report", caption = "Viz By: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.ticks = element_line(color = "gray30", linewidth = 0.1),
        axis.line = element_line(color = "gray30", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold", color = "gray25",size = 10),
        axis.text = element_text(family = "serif", color = "gray25", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = bc, filename = "progress_bar_chart.png",
       width = 8, height = 8, units = "in", dpi = 300)

#adding a new column computing 100% complete
data<-data%>%mutate(complete_project = 100)

#creating progress bar chart (as a bar-in-bar chart)
bb<-data%>%ggplot(aes(y = Project_Task))+
  geom_bar(aes(x = percent_complete), stat = "identity", width = 0.2, fill = "#618c03", alpha = 0.8)+
  geom_bar(aes(x = complete_project), stat = "identity", width = 0.4, fill = "#bfb304", alpha = 0.4)+
  geom_text(aes(y = Project_Task, x = percent_complete,label = paste0(percent_complete,"%")),size = 2.5, vjust = 0.5, hjust =-0.5)+
  labs(title = "Project Completion Report", caption = "Viz By: Bernard Kilonzo",
       x = "Percent Complete", y = "Project Name")+
  theme(panel.background = element_blank(),
        axis.text = element_text(family = "serif", size = 9, color = "gray25"),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray25"),
        axis.line = element_line(color = "gray25", linewidth = 0.1),
        axis.ticks = element_line(linewidth = 0.1, color = "gray25"),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 10, color = "gray45"))

#saving the plot
ggsave(plot = bb, filename = "progress_bar_chart_1.png",
       width = 8, height = 6, units = "in", dpi = 300)

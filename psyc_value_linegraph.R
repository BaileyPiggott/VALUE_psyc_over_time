
# psyc VALUE line graph
source("set_up.R")

# choose VALUE criteria:

learning = ps
legend = c("Define Problem", "Identify Strategies", "Propose Solutions", "Evaluate Potential Solutions", "Implement Solutions", "Evaluate Outcomes")
col = rev(brewer.pal(8,"Greens"))
line_vals = c(6,5,4,3,2,1) #values for linetype
shape_vals = c(0,1,2,15,16,17) #values for scale_shape_manual
graph_title = "Problem Solving"

learning = ct
legend = c("Explanation of Issues", "Evidence", "Influence of Context and Assumptions", "Student's Position", "Conclusions") 
col = rev(brewer.pal(7,"Blues")) #colour for scale_colour_manual
line_vals = c(5,4,3,2,1) #values for linetype
shape_vals = c(0,1,2,15,16) #values for scale_shape_manual
graph_title = "Critical Thinking"

learning = wc  
legend = c("Context and Purpose for Writing", "Content Development", "Genre and Disciplinary Conventions", "Sources and Evidence", "Syntax and Mechanics") 
col = rev(brewer.pal(7,"Oranges"))
line_vals = c(5,4,3,2,1) #values for linetype
shape_vals = c(0,1,2,15,16) #values for scale_shape_manual
graph_title = "Written Communication"

learning = summary #summary of the 3 outcomes  
legend = c("Problem Solving", "Critical Thinking", "Written Communication")
col = c("#33CC44", "#3388EE", "#FF8833")
line_vals = c(1,1,1) #solid lines
shape_vals = c(15,16, 17) #values for scale_shape_manual
graph_title = "Learning Outcomes"


# plot:

ggplot(
  data = learning, 
  aes(x=Year, y = mean, 
      colour = learning_outcome, 
      linetype = learning_outcome, 
      shape = learning_outcome)
  ) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  coord_cartesian(xlim = c(1,5), ylim = c(0, 4)) + 
  scale_x_discrete(labels = c("First Year", "Second Year", "Third Year", "Fourth Year", "")) +
  theme(
    axis.text.x = element_text(hjust= -0.5), 
    axis.line = element_line("grey"), 
    panel.grid.major.y = element_line("grey"),
    panel.background = element_rect("white")
  ) +
  labs(title = graph_title, x = "Year", y = "Rubric Level") +
  scale_colour_manual(
    values = col, 
    name = "Learning Outcome",
    labels = legend
  ) +
  scale_linetype_manual(
    values = line_vals,
    name = "Learning Outcome",
    labels = legend
  ) +
  scale_shape_manual(
    values = shape_vals,
    name = "Learning Outcome", 
    labels = legend
  ) # end ggplot description







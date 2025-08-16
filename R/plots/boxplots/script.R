#Simple Boxplot -----------------------------------------------------
#boxplot function that quicky makes a plot from a qualitative independent variable and quantitative dependent
#lazy way to check out different relationships without taking up too much time or space

#package requirements: ggplot2, dplyr, ggpubr

#table should be in normal tidy format

simpleBoxplot <- function(table, independent, dependent){
  #This function creates a boxplot using an independent and dependent variable
  #Uses a table and two columns from the table to create the boxplot
  #input independent and dependent variables as strings E.g 'size','volume'

  #Independent = string representing column with numeric values
  #Dependent = String representing table column with qualitative values
  #table = data frame
  p <- ggboxplot(table, x=independent,y=dependent,
                 color=independent, palette =c("#00AFBB", "#E7B800", '#FF7F00'),
                 add="jitter",shape=independent)

  print(p)
}


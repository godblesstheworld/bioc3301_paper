# This script was performed on R/3.5.0, in Rstudio
# Instructions are for plotting alpha diversity box plot
# Ensure all necessary packages are installed 

# Loading libraries
library(microbiome)
library(ggpubr)
library(knitr)
library(dplyr)
library(RColorBrewer)

# Setting directory
setwd(C:/Users/User/bioc3301)

# Loading data
alpha <- read.csv(file.choose(), header=TRUE)

# Checking correct data loaded
alpha

# Plotting boxplot
ggboxplot(alpha, x = "SamplePh", y = "chao1", fill = "SamplePh", palette = c("skyblue2", "#b2df8a", "lightsalmon", "mistyrose")) + guides(fill=FALSE)

q()
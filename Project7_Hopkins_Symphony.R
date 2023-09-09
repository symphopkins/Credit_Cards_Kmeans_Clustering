#############################################
#                                           #
# Author:     Symphony Hopkins              #
# Date:       04/49/2023                    #
# Subject:    Project 7                     #
# Class:      DSCI 512                      #
# Section:    01W                           #         
# Instructor: Juan David Munoz              #
# File Name:  Project7_Hopkins_Symphony.R   #
#                                           #
#############################################

#1. Load the dataset CreditCards.csv into memory.
#    Answer: See code.

#importing dataset
credit_card <- read.csv("~/Documents/Maryville_University/DSCI_512/Week_7/CreditCards.csv")
View(credit_card)

#2. Perform the k-means cluster analysis.

#importing library
library('cluster')
library('factoextra')

#setting seed for reproducibility
set.seed(1)

#2a.Remove the first column: CUST_ID since it 
#   doesn’t provide any info for cluster.
#   Answer: We assumed CUST_ID is the
#   X column in this dataset, so we removed
#   that column.

credit_card <- subset(credit_card, select=-X)

#2b.Determine the optimal number of clusters. 
#   Justify your answer. It may take longer 
#   running time since it uses a large dataset.
#   Answer: We have determined that the optimal 
#   number of clusters is 2 as indicated by the
#   vertical dotted line in the graph.

credit_card_clust <- fviz_cluster(credit_card, kmeans, method='gap_stat')
print(credit_card_clust)

#2c.Perform k-means clustering using the optimal 
#   number of clusters.
#   Answer: See code.

credit_cards_opt <- kmeans(credit_card, 2, nstart=25)

#2d.Visualize the clusters in different colors.
#   Answer: See code.

fviz_cluster(credit_cards_opt, data=credit_card)

#End Assignment



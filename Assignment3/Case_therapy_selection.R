setwd("C:/Data/Statistics for Data Scientists/Assignment 3 week 6")

# Add pca functions to source
source("PCA.R")

# Load data
load("Case_therapy_selection.RData")

# Overview data
nrow(data_treatment_response) # Number of patients
ncol(data_treatment_response) # Number of metabolites
table(label_treatment_response) # Overview number of responders and non-responders

# Split data intro train / test set
# ...
# Write your own code here

# Partially complete code for LOO-CV on the basis of 120 training observations
lda_pred <- matrix(0,nrow = 120, ncol =10) # Matrix to store cross-validation predictions
for (i in 1:120){ # Leave out ith training observation
  # R loops through the specified values of i. 
  # So, first i is set to 1 before executing the code within the loop
  # Next, i is set to two and the code is carried out
  # this is repeated up to i = 120
  
  # Split training data and training labels according to left out sample
  # Complete expressions below
  #left_out_data <- 
  #left_out_label <-
  #remainder_data <- 
  #remainder_label <- 
  
  # Scale data (if required)
  # Write your own code here
  
  # Dimension reduction with PCA
  # Write your own code here
  
  for (nPC in 1:10){ # Select at maximum 1 to 10 principal components 
    # Using this for loop first the dimension is reduced to the first principal component only
    # Next, the dimension is reduced to the first two components
    # This is repeated up to 10 principal components
    # For each number of principal components a classifier is fitted to the corresponding scores and its performance is evaluated.
    
    # Create data frame for fitting LDA:
    data_remainder_fit <- data.frame(scores_remainder[,1:nPC], remainder_label) 
    
    # Apply LDA
    # Write your own code here.
    
    # Evaludate left-out sample
    predictdf <- data.frame(data = scores_left_out)
    colnames(predictdf) <- colnames(data_fit)[1:nPC]
    #lda_pred[i,nPC] <- # Complete yourself to obtain class prediction for left-out sample using fitted LDA model; Store predicted class 
  }
}
CV_accuracy <- apply(lda_pred,2,FUN = function(x) { mean(x == as.numeric(label_train))}) # Compute cross-validation accuracy of different models 
# Each column in CV_accuracy corresponds to the maximum number of principal components
opt_PC <- which.max(CV_accuracy) # Select number of principal components with highest classification accuracy

# Create final model and validate
# ...
# Write your own code here

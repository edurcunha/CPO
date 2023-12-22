################################################################################
#  cpo_index
################################################################################

#  FUNCTION DESCRIPTION: This function calculates the corrected proportion of   
#                        occurrences.

#  ARGUMENTS
# m: A matrix of two species (columns) by n samples (rows).

cpo_index <- function(m) {

    n_i <- sum(m[,1])
    n_j <- sum(m[,2])
    n_ij <- sum(rowSums(m) == 2)
    N <- nrow(m)
    
    cpo <- n_ij / ( n_i * (n_j / N) )

    return(cpo)

}
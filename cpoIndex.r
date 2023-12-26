################################################################################
#  cpo_index
################################################################################

#  FUNCTION DESCRIPTION: This function calculates the corrected proportion of   
#                        occurrences.

#  ARGUMENTS
# m: A matrix of two species (columns) by n samples (rows).

cpoIndex <- function(m) {

    n_i <- sum(m[,1])
    n_j <- sum(m[,2])
    n_ij <- sum(rowSums(m) == 2)
    N <- nrow(m)
    
    cpo <- n_ij / ( n_i * (n_j / N) )

    return(cpo)

}

#  AUTHORSHIP:
# Name: Eduardo Ribeiro da Cunha
# Email: edurcunha@gmail.com

#  REFERENCE
# Thomaz, S. M. and Michelan, T. S. 2011. Associations between a
# highly invasive species and native macrophytes differ across
# spatial scales. Biological Invasions 13:1881–1891
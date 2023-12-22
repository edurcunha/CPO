################################################################################
#  cpoRand
################################################################################

#  FUNCTION DESCRIPTION: This function calculates the numerical distribution
#                        of CPO using randomizations of species occurrence
#                        a pair of species in a collection of samples. The
#                        algorithm follows the SIM2 randomization model of
#                        Goteli (2000).

#  ARGUMENTS
# m: A matrix of two species (columns) by n samples (rows).
# rand: A number indicating the number of random collections of samples to 
#       generate.
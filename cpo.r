################################################################################
#  cpo
################################################################################

#  FUNCTION DESCRIPTION: This function calculates the corrected proportion of
#                        occurrences (CPO) for a pair of species in a
#                        collection of samples.

#  ARGUMENTS
# m: A matrix of two species (columns) by n samples (rows).
# null.model: Logical. If TRUE, the mean and sd of the c-score null
#                model is provided in the output.
# rand: A number indicating the number of random collections of samples to 
#       generate.

cpo <- function(m, ...) {
    
    extra.arg <- list(
    null.model = FALSE,
    rand = 999)
  
  ellipsis <- list(...)
  
  arg.replace <- names(extra.arg) %in% names(ellipsis)
  
  extra.arg[arg.replace] <- ellipsis[names(extra.arg)[arg.replace] ] 

  
  if( is.matrix(m) ) {
    
    if( ncol(m) == 2 ) {
      
      if( all.equal( sort( unique( c(m, 0, 1) ) ), c(0, 1) ) ){

        if( sum( rowSums(m) > 0 ) >= 1 ) {

            source("cpoIndex.r")

            cpoVal <- cpoIndex(m)
          
          if( extra.arg[['null.model']] ){
            
            null.model <- cpoRand(m, rand = extra.arg[['rand']] )
            
            cpo <- list(CPO = cpoVal,
                           null.dist = null.model)
            
          }
          
          return(cpo)
          
        }
        
      }
      
    }
    
  }
  
  stop("'m' is not a two species (columns) by n sites (rows) 
       presence-absence matrix")

}

# REFERENCE

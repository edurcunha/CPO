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

cpoRand <- function(m, ...) {
  
  extra.arg <- list(
    rand = 999)
  
  ellipsis <- list(...)
  
  arg.replace <- names(extra.arg) %in% names(ellipsis)
  
  extra.arg[arg.replace] <- ellipsis[names(extra.arg)[arg.replace] ]

    if( is.matrix(m) ) {
    
    if( ncol(m) == 2 ) {
      
      if( all.equal( sort( unique( c(m, 0, 1) ) ), c(0, 1) ) ){
        
        if( sum( rowSums(m) > 0 ) >= 1 ) {
          
          cpoRands <- rep(NA, extra.arg[['rand']])
          
          for(i in 1:extra.arg[['rand']]) {
            
            m.rand <- m
            
            m.rand[,2] <- m.rand[ sample( nrow(m.rand) ) ,2] 
            
            cpoRands[i] <- cpo(m = m.rand)
            
          }
          
          return(cpoRands)
          
        }        
        
      }
      
    }
    
  }
  
  stop("'m' is not a two species (columns) by n sites (rows) 
       presence-absence matrix")
       
}
################################################################################
#  cpoPairWise
################################################################################

#  FUNCTION DESCRIPTION: This function calculates the corrected proportion of 
#                        of occurrence index (CPO) for species pairs in a in 
#                        a collection of samples.

#  ARGUMENTS
# m: A matrix of species by samples.
# null.model: Logical. If TRUE, the mean and sd of the c-score null
#             model is provided in the output.
# rand: A number indicating the number of random collections of samples to 
#       generate.

cpoPairWise <- function(m, ...) {
  
  extra.arg <- list(
    null.model = FALSE,
    rand = 999
  )
  
  ellipsis <- list(...)
  
  arg.replace <- names(extra.arg) %in% names(ellipsis)
  
  extra.arg[arg.replace] <- ellipsis[names(extra.arg)[arg.replace] ] 
  
  
  if( is.matrix(m) ) {
    
    if( ncol(m) >= 2 ) {
       
      if( all.equal( sort( unique( c(m, 0, 1) ) ), c(0, 1) ) ){
        
        if( sum( rowSums(m) > 0 ) >= 2 ) {
          
          n.spp <- ncol(m)
          
          spp.names <- colnames(m)
          
          cpoMatrix <- matrix(NA, n.spp, n.spp, 
                                 dimnames = list(spp.names, spp.names))
          
          if( extra.arg[['null.model']] ) {
            
            NullMatrixMean <- matrix(NA, n.spp, n.spp, 
                                   dimnames = list(spp.names, spp.names))
            
            NullMatrixSD <- matrix(NA, n.spp, n.spp, 
                                   dimnames = list(spp.names, spp.names))
            
          }
          
          for(i in 1:(n.spp-1)) {
            
            for(j in (i + 1):n.spp){
              
              m.tmp <- m[ , c(i, j)]
              
              cpoTmp <- cpo(m.tmp, 
                                null.model = extra.arg[['null.model']],
                                rand = extra.arg[['rand']])
              
              if( extra.arg[['null.model']] ) {
                
                cpoMatrix[j,i] <- cpoTmp$CPO
                
                NullMatrixMean[j,i] <- mean(cpoTmp$null.dist)
                
                NullMatrixSD[j,i] <- sd(cpoTmp$null.dist)
                
              } else {
                
                cpoMatrix[j,i] <- cpoTmp
                
              }
              
            } 
            
          }
          
          if( extra.arg[['null.model']] ) {
            
            cpoMatrix <- list(CPO = cpoMatrix,
                                 null.dist.mean = NullMatrixMean,
                                 null.dist.sd = NullMatrixSD)
            
          }
          
          return(cpoMatrix)
          
        }        
        
      }
      
    }
    
  }
  
  stop("'m' is not a species (columns) by sites (rows) presence-absence matrix. Please, check if values are only 1 and 0, and if the 'm' object is a matrix")
  
}


#  AUTHORSHIP:
# Name: Eduardo Ribeiro da Cunha
# Email: edurcunha@gmail.com

#  REFERENCE
# Thomaz, S. M. and Michelan, T. S. 2011. Associations between a
# highly invasive species and native macrophytes differ across
# spatial scales. Biological Invasions 13:1881–1891
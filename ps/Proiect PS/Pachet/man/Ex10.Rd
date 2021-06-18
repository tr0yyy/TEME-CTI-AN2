\name{Ex10}
\alias{Covarianta si coeficientul de corelatie}
\title{Covarianta si coeficientul de corelatie}
\description{
Calculeaza covarianta si coeficientul de corelatie a doua variabile aleatoare continue cu densitate de probabilitate comuna.
}
\usage{
covarianta_corelatie(f,xst,xdr,yst,ydr);
}

\examples{
f<-function(x,y){
  return(3/2*(x^2+y^2))
}
covarianta_corelatia(f, 0, 1, 0, 1)
}

\name{ex5}
\alias{momente initiale si centrate}
\title{momente centrate si initiale}
\description{
Calculul mediei, dispersiei si a momentelor initiale si centrate pana la ordinul 4 (daca exista).
}
\usage{
momentCentrat(f,ordin)
momentInitial(f,ordin)
patruMomente(f)
}

\examples{
f1 <- function(x){
  if(x > 0 && x < 20)
    return(1/20)
  else
    return(0)
}
patruMomente(f1)
}

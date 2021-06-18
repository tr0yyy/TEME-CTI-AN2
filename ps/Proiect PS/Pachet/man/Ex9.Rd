\name{ex9}
\alias{generare n variabile}
\title{generare n variabile}
\description{
Generarea a n valori dintr-o repartitie de variabile aleatoare continue.
}
\usage{
generareNValori(f, n, stanga, dreapta)
}

\examples{
f1<-function(x){
  if(x >= 0)
    return(1-exp(-2*x))
  else return(0)
}

generareNValori(f1,50,0.1,100)
}

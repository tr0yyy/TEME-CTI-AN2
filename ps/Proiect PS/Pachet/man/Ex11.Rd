\name{Ex11}
\alias{Densitatea marginala si conditionala}
\title{Densitatea marginala si conditionala}

\description{
Calculeaza densitatea marginala si conditionala a doua variabile aleatoare continue, in functie de parametrii dati.
Pentru a calcula densitatea conditionala, se vor da si capetele intervalului conditional.
}
\usage{

densitate_marginalaX(f,a,b);
densitate_marginalaY(f,a,b);

densitate_marginalaX(f,a,b,c,d);
densitate_marginalaY(f,a,b,c,d);

}

\examples{
#exemplu de functie de densitate comuna pe domeniul [0,1]x[0,1]
functie_densitate_comuna <- function() {
  return(function(x, y) (
     4* x * y
  ))
}
densitate_marginalaX(functie_densitate_comuna,0,1,0,1);
densitate_marginalaY(functie_densitate_comuna,0,1,0,1);
}


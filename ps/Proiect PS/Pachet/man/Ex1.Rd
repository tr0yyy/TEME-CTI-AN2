\name{ex1}
\alias{ConstantaDeNormalizareK}
\title{ConstantaDeNormalizareK}
\description{
Fiind data o functie f, introdusa de utilizator, determinarea unei constante de normalizare k. In cazul in care o asemenea constanta nu exista, afisarea unui mesaj corespunzator catre utilizator.
}
\usage{
ConstantaDeNormalizareK(f)
}

\examples{
f2 <- function(x){
    return(1 / x)
}
ConstantaDeNormalizareK(f2)
}

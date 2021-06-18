\name{Ex6}
\alias{Calculare medie si dispersie v.a.c}
\title{Medie si dispersie v.a.c}
\description{
Acesta poate calcula media cat si dispersia unei variabile aleatorii de tip g(x).}
\usage{
calcul_medie(g,f,lower,upper)
calcul_dispersie(g,f,lower,upper)
}
\arguments{
  \item{g}{Functia variabilei aleatorii dorite.}
  \item{f}{Va reprezenta functia de densitate probabilitate repartitiei.}
  \item{lower}{Este membrul inferior al intervalului.}
  \item{upper}{Este membrul superior al intervalului.}
}
\value{
In functie de ce este apelat din functie aceasta va returna valoarea mediei variabilelei E(x) sau valoarea dispersiei variabilelei Var(x).}
\examples{
f1 <- function(x)(2*(x^3))
f2 <- function(x)(exp(1)^(-2*x))
calcul_medie(f1,f2,0,Inf)
calcul_dispersie(f1,f2,0,Inf)
}

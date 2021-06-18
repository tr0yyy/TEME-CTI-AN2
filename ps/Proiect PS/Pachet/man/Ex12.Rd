\name{Ex12}
\alias{Calcularea sumei si diferentei intre 2 v.a.c}
\title{Suma si diferenta intre 2 v.a.c}
\description{
  Rolul exercitiului 12 este de a construi suma sau diferenta a doua variabile aleatoare continue folosindu-ne de formula de convolutie.}
\usage{
suma_convolutie(f,g)
diferenta_convolutie(f,g)
plot(f,from=-5,to=6,type="l")
plot(g,from=-5,to=6,type="l")
plot(s,from=-5,to=6,type="l")
plot(d,from=-5,to=6,type="l")
}
\arguments{
  \item{f}{Reprezinta functia densitate de probabilitate a primei variabile aleatorii continue.}
  \item{g}{Reprezinta functia densitate de probabilitate a celei de a doua variabile aleatorii continue.}
}
\value{
Cele 2 functii vor returna suma cat si diferenta celor 2 variabile.}
\references{
https://www.afahc.ro/ro/facultate/cursuri/ccg/MSE/C07\%20-\%20Convolutia\%20semnalelor.pdf
 https://math.stackexchange.com/questions/2628366/why-is-the-pdf-of-the-sum-of-two-continuous-random-variables-the-convolution-of
}
\examples{
f <- function(x)(dnorm(x))
g <- function(x) (dnorm(x,mean=1))
s <- Vectorize(suma_convolutie(f,g))
d <- Vectorize(diferenta_convolutie(f,g))

plot(f,from=-5,to=6,main="Functie densitate de probabilitate v.a.c 1.",type="l",col ="magenta")
plot(g,from=-5,to=6,main="Functie densitate de probabilitate v.a.c 2.",type="l",col ="magenta")
plot(s,from=-5,to=6,main="Graficul sumei.",type="l",col ="magenta")
plot(d,from=-5,to=6,main="Graficul diferentei.",type="l",col ="magenta")
}

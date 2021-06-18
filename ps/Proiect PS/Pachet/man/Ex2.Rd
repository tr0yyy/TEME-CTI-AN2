\name{Ex2}
\alias{Testare densitate de probabilitate}
\title{Testare densitate de probabilitate}
\description{Functia creata in cadrul exercitiului 2, testeaza daca o functie este sau nu densitate de probabilitate.}
\usage{densitate(f,lower,upper,pas)}
\arguments{
  \item{f}{Functia ce trebuie testata.}
  \item{lower}{Membrul inferior al intervalului.}
  \item{upper}{Membrul superior al intervalului.}
  \item{pas}{Pasul la care se aloca valori din interval.}
}
\value{Programul va returna un TRUE/FALSE in functie de tipul functiei.}
\examples{
f1 <- function(x){
if (x > 0 && x < 4){
   3/5 * (2*x-6*x^2)
}else{
   0
}
}
f2 <- function(x){
 if (x > 0 && x < 4){
   3/20*(x^2-2*x+1)
 }else{
   0
 }
}
densitate(f1,-10000,10000,1)
densitate(f2,-10000,10000,0.01)
}

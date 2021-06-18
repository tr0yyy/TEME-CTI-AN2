# Cerinta: Reprezentarea grafica a densita??ii ??i a func??iei de reparti??ie pentru diferite valori ale 
# parametrilor reparti??iei. ??n cazul ??n care func??ia de reparti??ie nu este data ??ntr-o forma 
# explicita(ex. reparti??ia normala) se accepta reprezentarea grafica a unei aproximari a 
# acesteia.

library(pracma)

# Integram functia densitate de probabilitate(cdf) ca sa obtinem 
# valoarea functiei de repartitie cumulativa

PDF_to_CDF <- function(f, x)
{
  tryCatch(
    {
      integrate (f, 0, x)$value
    },
    error= function (e){
      print(e)
    }
  )
}

# Verificam conditiile functiei de densitate
# 1. Este pozitiva

verif_densitate <- function(f, a, b) {
  for (x in seq(a, b, 0.1)){
    if( f(x) < 0 ){
      print(paste("PDF nu poate sa aiba valori negative",))
      return(FALSE)
    }
  }
  
  # 2.Probabilitatea totala trebuie sa fie 1
  
  total <- integral(Vectorize(f), max(-Inf, a), min(b, +Inf))
  
  if(abs(total - 1) >0.1){
    print ( paste ("Eroare, probabilitatea cumulata totala trebuie sa fie egala cu 1") )
    return ( FALSE )
  }
  
  return(TRUE)
  
}

# Afisam graficul densitatii

plot_densitate <- function(f, a, b, name=""){
  # Validam PDF
  if(!verif_densitate(f, a, b)){
    return()
  }
  
  #Afisam graficul PDF
  
  ax <- seq(a, b, 0.1)
  ay <- c()
  for (x in ax){
    ay= append(ay, f(x))
  }
  
  plot (ax , ay , type ="l", main = noquote ( paste ( name , " PDF ")) , col =" magenta ", xlab ="x", ylab="y")
}

#Afisam graficul repartitiei

plot_repartitie <- function(F, a, b, name){
  ax <- seq(a, b, 0.01)
  ay <- c()
  for (x in ax){
    ay = append (ay, F(x))
  }
  plot (ax, ay , col =" magenta ", type ="l", main = noquote ( paste ( name , " CDF ")) , xlab ="x", ylab="y")
  
  
} 
#Cream o functie de afisare pentru functiile
# unde nu cunoastem functia de repartitie  

plot_repartitie_gen <- function(f, a, b){
  
  if( !verif_densitate(f, a, b)){
    return()
  }
  
  ax <- seq(a, b, 0.01)
  ay <- c()
  for (x in ax) {
    ay = append(ay, PDF_to_CDF(f, x))
  }
  plot (ax , ay , col =" magenta ", type ="l", main ="CDF ", xlab ="x", ylab ="y")
  
}

parse_repartitii_cunoscute <- function(name, CDF=FALSE, ...) {
  params <- list(...)
  if (name == "uniform") {
    if (!is.null(params$a) && !is.null(params$b)) {
      a <- params$a
      b <- params$b
      if (a >= b) {
        return("parametri incorecti")
      }
      
      f <- function(x) 1 / (b - a)
      F <- function(x)(x - a) / (b - a)
      if (CDF) {
        plot_repartitie(F, a, b, name)
      }
      else {
        plot_densitate(f, a, b, name)
      }
    }
    else {
      return("parametrii necesari nu au fost pasati")
    }
  }
  else if (name == "exp") {
    if (!is.null(params$lambda)) {
      lambda <- params$lambda
      if (lambda <= 0) {
        return("parametrii incorecti")
      }
      
      f <- function(x) (lambda * exp(1)^(-lambda * x))
      F <- function(x) (1 - exp(1)^(-lambda * x))
      if (CDF) {
        plot_repartitie(F, 0, 70, name)
      }
      else {
        plot_densitate(f, 0, 70, name)
      }
    }
    else {
      return("parametrii necesari nu au fost pasati")
    }
  }
  else if (name == "normal") {
    if (!is.null(params$mu && !is.null(params$sigma))) {
      mu <- params$mu
      sigma <- params$sigma
      if (sigma <= 0) {
        return("parametrii incorecti")
      }
      
      f <- function(x) ((1 / (sigma * sqrt(pi * 2)))*(exp(1)^((-(x - mu)^2)/(2  * sigma ^ 2))))
      F <- function(x) (pnorm(x, mu, sigma))
      
      if (CDF) {
        plot_repartitie(F, -30, 30, name)
      }
      else {
        plot_densitate(f, -30, 30, name)
      }
    }
    else {
      return("parametrii necesari nu au fost pasati")
    }
  }
  else if (name == "cauchy") {
    if (!is.null(params$location && !is.null(params$scale))) {
      location <- params$location
      scale <- params$scale
      if (scale <= 0) {
        return("parametrii incorecti")
      }
      
      f <- function(x) 1 / (pi * scale * (1 + ((x - location) / (scale))^2))
      F <- function(x) (1 / pi) * atan((x - location) / scale) + 1 / 2
      
      if (CDF) {
        plot_repartitie(F, -30, 30, name)
      }
      else {
        plot_densitate(f, -30, 30, name)
      }
    }
  }
  else {
    print("repartitie necunoscuta")
  }
}

#EXEMPLE:

# parse_repartitii_cunoscute("uniform", FALSE, a=5, b=12)
# parse_repartitii_cunoscute("uniform", TRUE, a=5, b=12)
# parse_repartitii_cunoscute("exp", FALSE, lambda=7)
# parse_repartitii_cunoscute("exp", TRUE, lambda=5)
# parse_repartitii_cunoscute("normal", FALSE, mu=2, sigma=3)
# parse_repartitii_cunoscute("normal", TRUE, mu=2, sigma=3)
# parse_repartitii_cunoscute("cauchy", FALSE, location=0, scale=3)
# parse_repartitii_cunoscute("cauchy", TRUE, location=0, scale=3)
# plot_repartitie_gen(function(x) x / 22, 0, 2)
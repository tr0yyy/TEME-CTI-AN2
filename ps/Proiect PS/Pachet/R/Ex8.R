library(mlr3misc)
library(R6)

# Cerinta: Afi??area unei "fi??e de sinteza" care sa con??ina informa??ii de baza despre respectiva 
# reparti??ie(cu precizarea sursei informa??iei!). Relevant aici ar fi sa preciza??i pentru ce e 
# folosita ??n mod uzual acea reparti??ie, semnifica??ia parametrilor, media, dispersia etc.


data = Dictionary$new()

item = R6Class("Item")

# UNIFORM #

data_ob = Dictionary$new()

data_ob$add("Sursa", R6Class(public = list(print = "Curs + Wikipedia")))

data_ob$add("Notatie", R6Class(public = list(print = "U(a, b)")))

data_ob$add("Parametri", R6Class(public = list(print = "-Inf < a < b < Inf")))

data_ob$add("Domeniu", R6Class(public = list(print = "x in [a, b]")))

data_ob$add("PDF", R6Class(public = list(print = "1 / (b - a)")))

data_ob$add("CDF", R6Class(public = list(print = "(x - a) / (b - a)")))

data_ob$add("Media", R6Class(public = list(print = "(1 / 2) * (a + b)")))

data_ob$add("Mediana", R6Class(public = list(print = "(1 / 2) * (a + b)")))

data_ob$add("Utilizari", R6Class(public = list(print = "1. In domeniul economiei pentru inventariere, in special pentru analiza ciclului de viata a unui produs nou. 
                                                         2. Solutie pentru erorile de cuantificare, un exemplu fiind conversia analog-to-digital.")))
data$add("uniform", data_ob)


# EXPONENTIAL #


data_ob = Dictionary$new()
data_ob$add("Sursa", R6Class(public = list(print = "Curs + Wikipedia")))

data_ob$add("Parametri", R6Class(public = list(print = "labmda > 0")))

data_ob$add("Domeniu", R6Class(public = list(print = "x in [0, +Inf]")))

data_ob$add("PDF", R6Class(public = list(print = "lambda * exp(1)^(-lambda * x)")))

data_ob$add("CDF", R6Class(public = list(print = "1 - exp(1)^(-lambda * x)")))

data_ob$add("Media", R6Class(public = list(print = "1 / labmda")))

data_ob$add("Mediana", R6Class(public = list(print = "ln2 / lambda")))

data_ob$add("Utilizari", R6Class(public = list(print = "Pe baza unui set de date, aceasta distributie poate poate estima precis evenimente care vor avea lic in viitor.
                                                         De exemplu: durata de descompunere a unei particule radioactive; 
                                                                     durata dintre 'click'-urile unui detector Geiger.")))

data$add("exponential", data_ob)


# NORMAL #

data_ob = Dictionary$new()
data_ob$add("Sursa", R6Class(public = list(print = "Curs + Wikipedia")))

data_ob$add("Notatie", R6Class(public = list(print = "N(mu, sigma^2)")))

data_ob$add("Parametri", R6Class(public = list(print = "mu in R, sigma ^ 2 >= 0")))

data_ob$add("Domeniu", R6Class(public = list(print = "x in [-Inf, +Inf]")))

data_ob$add("PDF", R6Class(public = list(print = "(1 / (sigma * sqrt(pi * 2)))*(exp(1)^((-(x - mu)^2)/(2  * sigma ^ 2)))")))

data_ob$add("CDF", R6Class(public = list(print = "(1 / 2) * (1 + erf((x - mu) / (sigma * sqrt(2)))")))

data_ob$add("Media", R6Class(public = list(print = "mu")))

data_ob$add("Mediana", R6Class(public = list(print = "mu")))

data_ob$add("Utilizari", R6Class(public = list(print = "Numeroase aplicatii, variand de la fizica pana la biologie, pana si la statisticarezultatelor unui examen. ")))

data$add("normal", data_ob)


# CAUCHY #

data_ob = Dictionary$new()
data_ob$add("Sursa", R6Class(public = list(print = "Curs + Wikipedia")))

data_ob$add("Parametrii", R6Class(public = list(print = "x0, y > 0")))

data_ob$add("Domeniu", R6Class(public = list(print = "x in [-Inf, Inf]")))

data_ob$add("CDF", R6Class(public = list(print = "(1 / pi) * arctan((x - x0) / y) + (1/2)")))

data_ob$add("PDF", R6Class(public = list(print = "1 / (pi * y * (1 + (x - x0) / y)^2)")))

data_ob$add("Mediana", R6Class(public = list(print = "x0")))

data_ob$add("Media", R6Class(public = list(print = "undefined")))

data_ob$add("Utilizari", R6Class(public = list(print = "Utilizata in hidrologie, distributia Cauchy poate fi aplicata fenomenelor extreme, precum furtuni de o zi sau inundatii.")))

data$add("cauchy", data_ob)



# FUNCTIE DE AFISARE #

afisare <- function(distribution_name) {
  
  out_data = data$get(distribution_name)
  
  for (key in out_data$keys()) {
    
    print(noquote(paste(key, ": ", out_data$get(key)$print, sep="")))
    
  }
}

# EXEMPLE
#afisare("uniform")
#afisare("normal")
#afisare("exponential")
#afisare("cauchy")
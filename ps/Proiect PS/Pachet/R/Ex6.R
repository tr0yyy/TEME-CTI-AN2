##Calculul mediei si dispersiei unei variabile aleatoare g(X), unde X are o repartitie continua cunoscuta iar g este o functie continua precizata de utilizator.

#Verificare functie de repartitie
#x1<x2=>f(x1)<f(x2)
#f(x-0)=f(x)
#lim f(x)=0 cand x - > -Inf
#lim f(x)=1 cand x - > Inf

#Calculare medie
calcul_medie<- function(g,functie_dens_prob,lower,upper){
  integrala_medie <- function(x){g(x)*functie_dens_prob(x)}
  medie <- integrate(Vectorize(integrala_medie),lower,upper) $ value
  return(medie)
}

#Calculare dispersie
calcul_dispersie <- function(g,functie_dens_prob,lower,upper){
  integrala_dispersie <- function(x){(g(x)-calcul_medie(g,functie_dens_prob,lower,upper))^2*functie_dens_prob(x)}
  dispersie <- integrate(Vectorize(integrala_dispersie),lower,upper) $ value
  return(dispersie)
}

#Testare
#
# f1 <- function(x)(2*(x^3))
# f2 <- function(x)(exp(1)^(-2*x))
# calcul_medie(f1,f2,0,Inf)
# calcul_dispersie(f1,f2,0,Inf)



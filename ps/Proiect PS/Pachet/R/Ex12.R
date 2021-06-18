##Construirea sumei si diferentei a doua variabile aleatoare continue independente(folositi formula de convolutie)

#Formula de convolutie analogica
#a(n)=Integrala(x(t)*y(n-t))


#Calcularea sumei folosind functia de convolutie Z=X+Y unde X si Y sunt variabile aleatorii => Y=Z-X
suma_convolutie <- function (f,g){function(z){
  integrala_con_sum <- function(x){g(z-x)*f(x)}
  sum <- integrate(Vectorize(integrala_con_sum),-Inf,Inf) $ value
  return(sum)
}}

#Calcularea diferentei folosind functia de convolutie Z=X-Y unde X si Y sunt variabile aleatorii => Y=X-Z
diferenta_convolutie <- function (f,g){function(z){
  integrala_con_dif <- function(x){g(x-z)*f(x)}
  dif <- integrate(Vectorize(integrala_con_dif),-Inf,Inf) $ value
  return(dif)
}}

##Testare
# f <- function(x)(dnorm(x))
# g <- function(x) (dnorm(x,mean=1))
# s <- Vectorize(suma_convolutie(f,g))
# d <- Vectorize(diferenta_convolutie(f,g))
# plot(f,from=-5,to=6,main="Functie densitate de probabilitate v.a.c 1.",type="l",col ="magenta")
# plot(g,from=-5,to=6,main="Functie densitate de probabilitate v.a.c 2.",type="l",col ="magenta")
# plot(s,from=-5,to=6,main="Graficul sumei.",type="l",col ="magenta")
# plot(d,from=-5,to=6,main="Graficul diferentei.",type="l",col ="magenta")

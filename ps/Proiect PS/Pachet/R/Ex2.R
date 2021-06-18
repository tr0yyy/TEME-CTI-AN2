## Verificarea daca o functie introdusa de utilizator este densitate de probabilitate.

densitate <- function(f,lower,upper,pas){
  val <- seq(lower,upper,pas);
  #Verificare functie pozitiva
  if(all(f(val)>=0)=='TRUE'){
    #Verificare integrabilitate
    if(typeof(integrate(Vectorize(f),-Inf,Inf))=='logical' && integrate(Vectorize(f),-Inf,Inf)==FALSE || integrate(Vectorize(f),-Inf,Inf) $ message!="OK"){
      return(FALSE)
    }
    else{
      i = integrate(Vectorize(f),-Inf,Inf) $ value
      if (round(i)==1){
        print("Functia este densitate de probabilitate.")
        return("TRUE")
      }
      else{
        print("Functia nu este densitate de probabilitate.")
        return("FALSE")
      }
    }
  }
  else{
    print("Functia este negativa pe intervalul ales.")
    return("FALSE")
  }
}

##TESTARE
# #Functie ce nu indeplineste conditiile
# f1 <- function(x){
# if (x > 0 && x < 4){
#     3/5 * (2*x-6*x^2)
#  }else{
#     0
#  }
# }
# #Functie ce indeplineste conditiile
# f2 <- function(x){
#   if (x > 0 && x < 4){
#     3/20*(x^2-2*x+1)
#   }else{
#     0
#   }
# }
# test <- integrate(Vectorize(f),-Inf,Inf) $ value
# print(test)
#
# densitate(f1,-10000,10000,1)
# densitate(f2,-10000,10000,0.01)

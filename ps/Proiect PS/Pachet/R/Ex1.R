ConstantaDeNormalizareK <- function(functie)
{
  integrala <- integrate(Vectorize(functie), -Inf, Inf)$value;
  if (integrala != 0){
    return(1 / integrala);
  }
  else{
    print("Aceasta functie nu admite constante de normalizare");
  }
}
#
# f1 <- function(x){
#   return(x^2)
# }
#
# f2 <- function(x){
#   return(1 / x)
# }
# ConstantaDeNormalizareK(f1)
# #the integral is probably divergent
# ConstantaDeNormalizareK(f2)
# #"Aceasta functie nu adminte constante de normalizare"

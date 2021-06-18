library(pracma)

media<-function(f,fst=-Inf,fdr=Inf){
  result=tryCatch({
    return(integrate(function(x){
      produs<-x*f(x);
      return(produs);
    },fst,fdr)$value);
  }, error = function(e){
    print("Nu se poate calcula media");
    return(0);
  });
}

dispersia<-function(f,fst=-Inf,fdr=Inf){
  medie<-media(f,fst,fdr)
  if(medie==0){
    print("Nu se poate calcula dispersia fara medie");
    return(0);
  }
  result=tryCatch({
    return(integrate(function(x){
      produs<-((x-medie)^2)*f(x);
      return(produs);
    },fst,fdr)$value);
  }, error = function(e){
    print("Nu se poate calcula dispersia");
    return(0);
  });
}

densitate_marginalaX <- function(f,a,b,c =-Inf,d = Inf)
{
  a <- max(a,c) #se compara maximul intre limitele inferioare dintre intervalul variabilei opuse si cel conditional
  b <- min(b,d) #se compara minimul intre limitele superioare dintre intervalul variabilei opuse si cel conditional
  tryCatch(
    {
      if(a>b) 0 #se compara capetele intervalului pentru a nu utiliza un interval imposibil
      else function(x) {integrate((function(y) {f(x, y)}), a, b)$value} #folosim formula de calcul din teorema
    }, error = function(e){
      print("Functia de densitate comuna este incorecta!");
    }
  )
}
densitate_marginalaY <- function(f,a,b,c =-Inf,d = Inf)
{
  a <- max(a,c) #se compara maximul intre limitele inferioare dintre intervalul variabilei opuse si cel conditional
  b <- min(b,d) #se compara minimul intre limitele superioare dintre intervalul variabilei opuse si cel conditional
  tryCatch(
    {
      if(a>b) 0 #se compara capetele intervalului pentru a nu utiliza un interval imposibil
      else function(y) {integrate((function(x) {f(x, y)}), a, b)$value} #folosim formula de calcul din teorema
    }, error = function(e){
      print("Functia de densitate comuna este incorecta!");
    }
  )
}

covarianta_corelatia<-function(f, xst, xdr, yst, ydr){
  fx = densitate_marginalaX(f, xst, xdr)
  fy = densitate_marginalaY(f, yst, ydr)

  medieX = media(fx, xst, xdr)
  medieY = media(fx, yst, ydr)

  functie<-function(x,y){return(x*y*f(x,y))}

  cov = integral2(functie, xst, xdr, yst, ydr)$Q - (medieX*medieY)

  dispersieX = dispersia(fx, xst, xdr)
  dispersieY = dispersia(fy, yst, ydr)

  cor = cov / (sqrt(dispersieX)*sqrt(dispersieY))

  print(cov)
  print(cor)
}

# f<-function(x,y){
#   return(3/2*(x^2+y^2))
# }
#
# covarianta_corelatia(f, 0, 1, 0, 1)
# #[1] 0.125
# #[1] 1.5

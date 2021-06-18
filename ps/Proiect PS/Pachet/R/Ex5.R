media<-function(f){
  result=tryCatch({
    return(integrate(function(x){
      produs<-x*f(x);
      return(produs);
    },-Inf,Inf)$value);
  }, error = function(e){
    print("Nu se poate calcula media");
    return()
  });
}

dispersia<-function(f){
  medie<-media(f)
  if(medie==0){
    print("Nu se poate calcula dispersia fara medie");
    return()
  }
  result=tryCatch({
    return(integrate(function(x){
      produs<-((x-medie)^2)*f(x);
      return(produs);
    },-Inf,Inf)$value);
  }, error = function(e){
    print("Nu se poate calcula dispersia");
    return()
  });
}

momentCentrat<-function(f,ordin){
  medie<-media(f)
  if(medie==0){
    warning(c("Nu se poate calcula momentul centrat fara medie"));
    return()
  }
  result=tryCatch({
    return(integrate(function(x){
      produs<-((x-medie)^ordin)*f(x);
      return(produs);
    },-Inf,Inf)$value);
  }, error = function(e){
    print("Nu se poate calcula momentul centrat");
    return()
  });
}

momentInitial<-function(f,ordin){
  result=tryCatch({
    return(integrate(function(x){
      produs<-(x^ordin)*f(x);
      return(produs);
    },-Inf,Inf)$value);
  }, error = function(e){
    print("Nu se poate calcula momentul initial");
    return()
  });
}

patruMomente <- function(f)
{
  print('Primele 4 momente initiale sunt:')
  print(momentInitial(f, 1))
  print(momentInitial(f, 2))
  print(momentInitial(f, 3))
  print(momentInitial(f, 4))
  print('Primele 4 momente centrate sunt:')
  print(momentCentrat(f, 1))
  print(momentCentrat(f, 2))
  print(momentCentrat(f, 3))
  print(momentCentrat(f, 4))
}

# f1 <- function(x){
#   if(x > 0 && x < 20)
#     return(1/20)
#   else
#     return(0)
# }
# patruMomente(f1)
#[1] "Primele 4 momente initiale sunt:"
#[1] 5.625
#[1] 56.25
#[1] 632.8125
#[1] 7593.75
#[1] "Primele 4 momente centrate sunt:"
#[1] 1.40625
#[1] 16.69922
#[1] 84.04541
#[1] 780.5099

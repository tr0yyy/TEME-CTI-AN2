integrarePDF<-function(f, x){
  tryCatch({
    return(integrate(Vectorize(f), 0, x)$value);
  }, error = function(e){
    print(e);
    return(0);
  });
}

generareInversa<-function(f, y, stanga, dreapta){
  uniroot((function (x) f(x) - y), lower=stanga, upper=dreapta)[1]
}

generareNValori<-function(f, n, stanga, dreapta){
  valori <- runif(n, stanga, dreapta)
  export <- c();
  for(y in valori){
    export <- append(export, generareInversa(function(x) (integrarePDF(f, x)), y, stanga, dreapta)$root)
  }
  print(export);
}

# f1<-function(x){
#   if(x >= 0)
#     return(1-exp(-2*x))
#   else return(0)
# }
#
# generareNValori(f1,50,0.1,100)
#[1] 25.446174 53.115397 74.557649 68.807575 30.584462 49.337176 71.337045 72.074684 18.379085 53.966918 76.665689 94.289155 95.916681
#[14] 18.057581 74.451717 42.136329 62.783452 13.919849 95.225450 89.564206 74.636752 65.059950 11.614840 47.619160 89.173798 46.462880
#[27] 66.338070 81.690513 30.974663 18.989209 32.714365 59.707631 86.227731 46.973578 93.553083 41.559197 28.137667 35.568942 44.815815
#[40]  7.876199 81.646375 91.597387 71.536997 52.775758 53.720603 75.384789  3.531075 18.790562 77.463315 38.960205

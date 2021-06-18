# Vom calcula densitatea marginala folosind teorema acesteia
# In cazul functiei, vom avea 5 parametrii, unde primul parametru
# reprezinta functia de densitatea comuna a celor doua variabile,
# al 2-lea si al 3-lea parametru sunt capetele intervalului domeniului variabilei opuse
# iar parametrii 4 si 5 sunt optionali si vor fi folositi pentru calculul densitatii
# conditionate, unde acestia reprezinta capetele intervalului conditional
# Am facut doua functii, una pentru fiecare variabila aleatoare continua, pentru a calcula
# integrala in functie de pdf-ul variabilei alese

densitate_marginalaX <- function(f,a,b,c =-Inf,d = Inf) 
{
  a <- max(a,c) #se compara maximul intre limitele inferioare dintre intervalul variabilei opuse si cel conditional
  b <- min(b,d) #se compara minimul intre limitele superioare dintre intervalul variabilei opuse si cel conditional
  tryCatch(
    {
      if(a>b) 0 #se compara capetele intervalului pentru a nu utiliza un interval imposibil
      else function(x) {integrate((function(y) {f(x, y)}), a, b)$value} #folosim formula de calcul din teorema
    }, eroare = function(e){
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
    }, eroare = function(e){
      print("Functia de densitate comuna este incorecta!");
    }
  )
}
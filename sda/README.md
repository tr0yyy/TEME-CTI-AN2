## Structuri de Date si Algoritmi
### Profesor: Ducoffe Guillaume

geekforgeeks is your friend

---
### Algoritmi / Complexități

- STRUCTURI DE DATE:

  * VECTOR : Cautare O(n) daca nu este sortat ; O(logn) daca este sortat (cautare binara)
  * LISTA SIMPLU INLANTUITA: Inserare O(1) ; Stergere O(1) ; Cautare O(n)
  * LISTA DUBLU INLANTUITA: Inserare O(1) ; Stergere O(1) ; Cautare O(n)
  * STIVA : Push O(1) ; Pop O(1) ; Top O(1) ; Cautare O(n)
  * COADA : Insert O(1) ; Remove O(1) ; Size O(1)
  * ARBORE BINAR DE CAUTARE : Insert , delete, search AVG:O(log n), cel mai prost caz O(n)
  * HEAP / PRIORITY QUEUE (min/max) : Find min/max O(1) ; Insert O(logn) ; Delete min/max O(log n) ; Extract min/max O(log n)
  
- SORTARI:

  * [Bucket Sort](https://www.geeksforgeeks.org/bucket-sort-2/) - Pentru numere cu virgula cuprinse intr-un range (exemplu 0-1). Daca se foloseste pe range, are o complexitate average de circa O(n)
  * [Radix Sort](https://www.geeksforgeeks.org/radix-sort/) - Pentru numere cu acelasi numar de cifre. NU ESTE SORTARE PRIN COMPARARE. Complexitate O(nk)
  * [Quick Sort](https://www.geeksforgeeks.org/quick-sort/) - Complexitate O(nlogn). NU SE FOLOSESTE PE SIR APROAPE SORTAT DEOARECE DEVINE O(n^2)
  * [Merge Sort](https://www.geeksforgeeks.org/merge-sort/) - Complexitate O(nlogn). Pentru liste inlantuite este preferat acesta in loc de Quick Sort
  * [Heap Sort](https://www.geeksforgeeks.org/heap-sort/) - Complexitate O(nlogn). Se foloseste pentru vector aproape sortat.


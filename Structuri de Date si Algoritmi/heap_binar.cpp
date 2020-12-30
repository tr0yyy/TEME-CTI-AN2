typedef struct{
	vector<int> content;
	int c;
} heap_binar;

void init_hb(heap_binar *h, int n){
  h->content = vector<int>(n);
  h->c = 0;
}

bool empty(heap_binar *h){
  return (h->c == 0);
}

int min(heap_binar *h){
  return (h->content)[0];	
}

//routines
void swap(vector<int> *v, int i, int j){
	int tmp = v.at(i);
	v[i] = v.at(j);
	v[j] = tmp;
}
int tata(int i){
	return (i+1)/2 - 1;
}
int fiuStinga(int i){
	return 2*(i+1) - 1;
}
int fiuDreapta(int i){
	return 2(i+1);
}

//basic operations
void removeMin(heap *h){
	swap(&(h->content),0,h->c--);
	int i = 0;
	while( (fiuStinga(i) < h->c) /*elementul are copii*/ 
	         &&  ( ( (h->content)[i] > (h->content)[fiuStinga(i)]  )
			        ||  (   (fiuDreapta(i) < h-> c) && ( (h->content)[i] > (h->content)[fiuDreapta(i)]  )
	))){
		int j = ( (fiuDreapta(i) >= c) || ( (h->content)[fiuStinga(i)] <= (h->content)[fiuDreapta(i)] ) ) ? fiuStinga(i) : fiuDreapta(i);
		swap(&(h->content),i,j);
		i = j;
	}
}
void add(heap *h, int p){
	(h->content)[h->c] = p;
	int i = h->c++;
	while( (i > 0)  &&  ( (h->content)[i] < (h->content)[tata(i)] )  ){
		swap(&(h->content),i,tata(i));
		i = tata(i);
	}
}
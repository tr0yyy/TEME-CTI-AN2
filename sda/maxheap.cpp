typedef struct{
	vector<int> *content;
	int c = 0;
} max_heap;

bool empty(max_heap *h){
  return (h->c == 0);
}

int max(max_heap *h){
  return h->content->at(0);	
}

//routines
void swap(vector<int> *v, int i, int j){
	int tmp = v->at(i);
	v->at(i) = v->at(j);
	v->at(j) = tmp;
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
void removeMax(max_heap *h){
	swap(h->content,0,h->c--);
	int i = 0;
	while( (fiuStinga(i) < h->c) /*elementul are copii*/ 
	         &&  ( ( h->content->at(i) > h->content->at(fiuStinga(i))  )
			        ||  (   (fiuDreapta(i) < h-> c) && ( h->content->at(i) > h->content->at(fiuDreapta(i))  )
	))){
		int j = ( (fiuDreapta(i) >= c) || ( h->content->at(fiuStinga(i)) <= h->content->at(fiuDreapta(i)) ) ) ? fiuStinga(i) : fiuDreapta(i);
		swap(h->content,i,j);
		i = j;
	}
}
void add(max_heap *h, int p){
	h->content->at(h->c) = p;
	int i = h->c++;
	while( (i > 0)  &&  ( h->content->at(i) < h->content->at(tata(i)) )  ){
		swap(h->content,i,tata(i));
		i = tata(i);
	}
}

void heapSort(vector<int>& a){
	max_heap h; h.content = &a;
	for(int i = 0; i < a.size(); i++)
	 add(&h,a[i]);
	for(int i = a.size()-1; i >= 0; i--)
	 removeMax(&h);
}
typedef struct node {
	int value, degree;
	struct node *tata;
	struct node *sibling;//next sibling = node with same parent
	struct node *child;//first child
} node;

typedef list<node> heapBinomial;

node *mergeTree(node *a, node *b){
	if(a->value <= b -> value){
		a->degree++;
		b->tata = a;
		b->sibling = a->child;
		a->child = b;
		return a;
	}else return mergeTree(b,a);
}

void merge(heapBinomial* h1, heapBinomial *h2){
	if(h1->empty())
	 for( iterator<heapBinomial> it = h2->begin(); it != h2->end(); it++ )
	  h1->push_back(*it);
	else if(!h2->empty()){
		node a = h1->front(); 
		node b = h2->front(); 
		if(a -> degree < b-> degree){
			h1->pop_front();
			merge(h1,h1);
			h1->push_front(a);
		}else if(a-> degree > b -> degree){
			h2->pop_front();
			merge(h1,h2);
			h1->push_front(b);
		} else{
			h1->pop_front(); h2->pop_front();
			node c = *merge(a,b);
			heapBinomial tmp; tmp.push_back(c);
			merge(h1,&tmp);
			merge(h1,h2);
		}
	}
}

bool empty(heapBinomial *h){ return (h->empty()); }

int min(heapBinomial *h){
	int res = (h->front()).value;
	for( iterator<heapBinomial> it = h->begin()++; it != h->end(); it++ ){
		if(res > it->value)
		 res = it->value;
	}
	return res;
}

void removeMin(heapBinomial *h){
	int m = min(h);
	node *a, b;
	for( iterator<heapBinomial> it = h->begin(); it != h->end(); it++ ){
		if(it->value == m){
			a = it -> child;
			it.remove();
			break;
		}
	}
	heapBinomial tmp;
	while(a){
		b = *a;
		a = a->sibling;
		b.tata = b.sibling = null;
		tmp.push_front(b);
	}
	merge(h,&tmp);
}

void add(heapBinomial *h, int e){
	node n; n.value = e;
	heapBinomial tmp; tmp.push_back(n);
	merge(h,&tmp);
}
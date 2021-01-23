typedef struct{
	vector<int> content;
	int first, last;
} coada;

void init_coada(coada *c, int n){
	c -> content = vector<int>(n);
	c->first = c->last = 0;
}

bool empty(coada *c){ return (c->first == c->last); }
void add(coada *c, int e){ 
  (c->content)[c->last++] = e;
  if(c->last == (c->content).size())
   c->last = 0;
}
int remove(coada *c){
  int e = (c->content)[c->first++];
  if(c->first == (c->content).size())
   c->first == 0;
  return e;
}
typedef struct{
	vector<int> content; 
	int last;
} stiva;

void init_stiva(stiva *s, int n){
	s->content = vector<int>(n);
	s->last = -1;
}

bool empty(stiva *s){ return (s->last == -1); }
void push(stiva *s, int e){ (s->content)[++s->last] = e; }
int pop(stiva *s) { return (s->content)[s->last--]; } //nu am tratat cazul vid
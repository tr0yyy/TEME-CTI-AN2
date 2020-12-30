typedef struct {
	
	stack<int> content;
	stack<int> minElts;
	stack<int> maxElts;
	
} minMaxStack;


bool empty(minMaxStack *s){
	return (s->content).empty();
}

void push(minMaxStack *s, int e){
	(s->content).push(e);
	if( ( (s->minElts).empty() ) || (e <= (s->minElts).top()))
	 (s->minElts).push(e);
	if( ( (s->maxElts).empty() ) || (e >= (s->maxElts).top()))
	 (s->maxElts).push(e);
}

int pop(minMaxStack *s){
	int e = (s->content).pop();
	if( e == (s->minElts).top() )
	 (s->minElts).pop();
	if( e == (s->maxElts).top() )
	 (s->maxElts).pop();
	return e;
}

int min(minMaxStack *s){
	return (s->minElts).top();
}

int max(minMaxStack *s){
	return (s->maxElts).top();
}
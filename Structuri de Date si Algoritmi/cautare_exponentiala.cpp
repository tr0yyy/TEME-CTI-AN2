int binarySearch(const vector<int>& a, int e, int lb, int ub){
	if(ub < lb)
	 return -1;
	else{
	  int m = (lb+ub)/2;
	  if(a[m] == e)
	   return m;
	  else if(a[m] > e)
	   return binarySearch(a,e,lb,m-1);
	  else
	   return binarySearch(a,e,m+1,ub); 
	}
}

int expSearch(const vector<int>& a, int e){
	int res = 0;
	while(res < a.size() && a[res] < e)
	 res *= 2;
	int lb = res/2, ub = res;
	if(ub >= a.size())
	 ub = a.size()-1;
	return binarySearch(a,e,lb,ub);
}
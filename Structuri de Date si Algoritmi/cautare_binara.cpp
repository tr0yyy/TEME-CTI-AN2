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

int binarySearch(const vector<int>& a, int e){
	return binarySearch(a,e,0,a.size()-1);
}
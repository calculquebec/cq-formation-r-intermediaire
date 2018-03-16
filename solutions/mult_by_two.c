void mult_by_two(int* n,double* x)
{
  int i,length = n[0];

  for(i=0; i<length; ++i) {
    // In R the index starts at one, so we need to 
    // adjust for finding which elements are odd
    if ((1+i)%2 == 0) continue;
    x[i] = 2.0*x[i];
  }
}


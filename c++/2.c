#include <stdio.h>
int main()
{
  int a=5,b=8;
  float x=4.2,y=3.4,n=float(a+b)/2+(int)x%(int)y;
  printf("%f\n",n);
}

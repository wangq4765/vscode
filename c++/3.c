#include <stdio.h>
int main()
{
  int i, a[10], ind;
  int num1, num2;
  char eng[10][6] = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
  printf("please input a num:\n");
  scanf("%d", &num1);
  num2 = num1;
  ind = 0;
  while (num2)
  {
    a[ind] = num2 % 10; //拆分编号，并用一个数组来存储
    ind = ind + 1;
    num2 = num2 / 10;
  }
  for (i = ind - 1; i >= 0; i--)
    printf("-%s", eng[a[i]]);
  printf("\n");
}

#include <stdio.h>

struct etype {
  int x;
  int y;
} ;

int main() {
  // printf() displays the string inside quotation
  int a = 10;
  int *b = &a;
  printf ("Characters: %d %x %x %d \n",a, b, &b, *b);
  printf("Hello, World!\n");
  
  struct etype ptr0;
  struct etype * ptr1;

  ptr0.x = 5; ptr0.y = 6;
  ptr1 = malloc(sizeof(ptr1));
  ptr1->x = 10;
  ptr1->y = 11;

  printf("ptr0: %d,%d\n",ptr0.x, ptr0.y);
  printf("ptr0: %d,%d\n",ptr1->x, ptr1->y);


  return 0;
}


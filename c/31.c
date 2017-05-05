#include <string.h>
#include <stdio.h>

int main () {
  int coins[8] = {1, 2, 5, 10, 20, 50, 100, 200};


  int table[201][8];

  for (int i=0; i<=200; i++) {
    for (int j=0; j<8; j++) {
      table[i][j] = 1;
    }
  }

  for (int i=0; i<=200; i++) {
    for (int j=1; j<8; j++) {
      if (i > coins[j]) {
        table[i][j] =  table[i][j-1] + table[i - coins[j]][j];
      } else if (i == coins[j]) {
        table[i][j] = table[i][j-1] + 1;
      } else {
        table[i][j] = table[i][j-1];
      }
    }
  }



  printf("%d\n", table[200][7]);
  return 0;
}

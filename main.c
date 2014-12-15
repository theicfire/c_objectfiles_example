#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
// Note that I'm not including a header that specifies what blah() is! The linking just.. finds it. Ew!

int main()
{
    printf("main says blah is %d\n", blah());
    return 0;
}

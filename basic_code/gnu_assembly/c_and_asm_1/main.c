extern void printSum(int x, int y);

int main(void)
{
    printSum(10, 20);
    printSum(30, 50);
    printSum(300, 400);

    return 0;
}

//gcc -no-pie printSum.S main.c 
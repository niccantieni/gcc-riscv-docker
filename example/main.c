#define ERROR 1
#define INPUT 70

int check (int number) {

    if (number % 2) {
        return -ERROR;
    } else {
        return 42;
    }
}

int main () {

    if (check(INPUT) < 0) {
        return 1;
    } else {
        return 0;
    }
}

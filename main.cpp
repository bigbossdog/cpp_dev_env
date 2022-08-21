#include <iostream>
// basic playground space

using namespace std;

int main(int, char**) {
    std::cout << "Hello, world!\n" << endl;
    int z[30];
    int bad = z[31];
    std::cout << "Ignoring UB!\n" << std::endl;
    return 0;
}

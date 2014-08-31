#include <iostream>
#include <cstdlib>

using namespace std;

int main() {

    int n;
    cin >> n;

    int seed;
    cin >> seed;

    srand(seed);

    cout << n << " " << (rand() % n) + 1 << endl;
    for (int j = 0; j < 2; ++j) {
        for (int i = 0; i < n; ++i) {
            cout << rand()%11 << " ";    
        }
        cout << endl;
    }
}


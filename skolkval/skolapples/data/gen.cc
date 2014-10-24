#include <iostream>
#include <cstdio>
#include <cstdlib>

using namespace std;

int N, K, same;
int rnd;

int get_rand(){
	return rand()%1001;
}

int get_trees(){
	if(same){
		return rnd;
	}
	return get_rand();
}

int main(int argc, char** argv) {

	if(argc != 5){
		printf("Usage: ./gen seed N K same\n");
		return 1;
	}

	srand(atoi(argv[1]));
	N = atoi(argv[2]);
	K = atoi(argv[3]);
	same = atoi(argv[4]);

	rnd = get_rand();

	cout << N << " " << K << endl;

    for (int j = 0; j < 2; ++j) {
        for (int i = 0; i < N; ++i) {
			if(i) cout << " ";
			cout << get_trees();
        }
        cout << endl;
    }
}


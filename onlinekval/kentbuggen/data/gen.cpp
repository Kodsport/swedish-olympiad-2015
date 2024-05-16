#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <cstdlib>

using namespace std;

string random_string(){
	string s;
	for(int i = 0; i < 5 + rand()%16; ++i){
		s.push_back(rand()%26 + 'a');
	}
	return s;
}

int main(int argc, char** argv){
	if(argc < 4){
		printf("Usage: ./gen n k seed\n");
		exit(0);
	}
	int n = atoi(argv[1]);
	int k = atoi(argv[2]);
	int seed = atoi(argv[3]);
	srand(seed);
	vector<string> s;
	for(int i = 0; i < k; ++i){
		s.push_back(random_string());
	}
	for(int i = k; i < n; ++i){
		s.push_back(s[rand()%i]);
	}
	cout << n << endl;
	for(int i = 0; i < n; ++i){
		cout << s[i] << endl;
	}
}

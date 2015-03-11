#include <bits/stdc++.h>
using namespace std;

int N;
vector<bool> used;

void readMove() {
	int m; cin >> m;
	if (m == -1) exit(0);
	used[m-1] = 1;
}

void makeMove(int m) {
	cout << m+1 << endl;
	used[m] = 1;
	used[(m+1) % N] = 1;
	used[(m+N-1) % N] = 1;
	readMove();
}

int main() {
	int _;
	cin >> N >> _;
	assert(N != 1);
	used.resize(N);
	readMove();
	if (!used[0]) makeMove(0);
	else makeMove(N-1);
	for (int i = 0; i < N; ++i) {
		if (used[i]) continue;
		makeMove(i);
	}
	assert(false);
}

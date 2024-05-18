#include <iostream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <cassert>
using namespace std;

int main() {
	cin.sync_with_stdio(false);
	int N, M;
	cin >> N >> M;
	vector<vector<pair<double, int> > > games(N);
	for (int i = 0; i < M; ++i) {
		int a, b;
		cin >> a >> b;
		a = N-a; b = N-b;
		if (a > b) swap(a, b);
		games[a].emplace_back(-1, b);
	}
	assert(cin);

	vector<double> waste(N, 1);
	waste[N-1] = 0;
	for (int i = N-1; i --> 0;) {
		vector<pair<double, int> >& g = games[i];
		for (auto& pa : g)
			pa.first = waste[pa.second];
		sort(g.begin(), g.end());
		double w = 0;
		double remaining = 1;
		for (auto&& pa : g) {
			double spend = remaining / 2;
			remaining -= spend;
			w += pa.first * spend;
		}
		w += remaining;
		waste[i] = w;
	}

	double res = 0;
	for (int i = 0; i < N; ++i)
		res += 1 - waste[i];
	res *= 100;
	cout << setprecision(10) << fixed << res << endl;
}

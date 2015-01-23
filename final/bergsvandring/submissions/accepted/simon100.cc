#include <iostream>
#include <cassert>
#include <iomanip>
#include <vector>
#include <cmath>
using namespace std;

double solve(int N, const vector<int>& xs, const vector<int>& ys, double D) {
	vector<vector<double> > edcost(N, vector<double>(N, 1e100));
	for (int i = 0; i < N; ++i) {
		double minSlope = -1e100;
		for (int j = i+1; j < N; ++j) {
			double dx = xs[j] - xs[i];
			double dy = ys[j] - ys[i];
			double slope = dy/dx;
			if (slope < minSlope) continue;
			if (slope > minSlope) minSlope = slope;
			if (abs(slope) > D) continue;
			edcost[i][j] = (j == i+1 ? 0 : sqrt(dx*dx + dy*dy));
		}
	}
	vector<double> dist(N);
	dist[0] = 0;
	for (int i = 1; i < N; ++i) {
		double d = 1e100;
		for (int j = 0; j < i; ++j)
			d = min(d, dist[j] + edcost[j][i]);
		dist[i] = d;
	}
	double ret = dist[N-1];
	return (ret == 1e100 ? -1.0 : ret);
}

int main() {
	int N;
	double D;
	cin >> N >> D;
	vector<int> xs(N), ys(N);
	for (int i = 0; i < N; ++i)
		cin >> xs[i] >> ys[i];
	double ansLow = solve(N, xs, ys, min(D * (1-1e-4), D - 1e-4));
	double ansHigh = solve(N, xs, ys, max(D * (1+1e-4), D + 1e-4));
	assert(ansLow == ansHigh);
	if (ansLow == -1)
		cout << -1 << endl;
	else
		cout << setprecision(5) << fixed << ansLow << endl;
}

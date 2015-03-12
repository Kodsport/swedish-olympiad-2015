#include <bits/stdc++.h>
using namespace std;

#define rep(i,f,t) for (int i = f; i < t; ++i)
#define sz(x) (int)(x).size()
#define all(x) x.begin(), x.end()
#define trav(a, x) for (auto& a : x)
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

int N;
double M, R;
vector<double> ang;
vector<double> si, co;

void areas(int a, int b, vector<double>& A, vector<double>& B) {
	A.clear();
	B.clear();
	double CX = si[b] - si[a];
	double CY = co[a] - co[b];
	double C = co[b]*si[a] - co[a]*si[b];
	double half = (ang[a] + ang[b]) / 2;
	int li, hi;
	b = min(b, N);
	for (li = a+1; li < b && ang[li] <= half; ++li)
		A.push_back(CY*si[li] + CX*co[li] + C);
	for (hi = b-1; hi >= li; --hi)
		B.push_back(CY*si[hi] + CX*co[hi] + C);
}

double minAr(vector<double>& A, vector<double>& B) {
	double res = 1e11;
	if (B.empty()) return res;
	int bi = sz(B)-1;
	trav(a, A) {
		double t;
		while ((t = a + B[bi]) >= M) {
			res = min(res, t);
			if (!bi) return res;
			--bi;
		}
	}
	return res;
}

int main() {
	cin >> N >> M >> R;
	M /= R*R/2;
	ang.resize(N);
	rep(i,0,N)
		cin >> ang[i], ang[i] *= M_PI / 180;
	sort(all(ang));
	ang.erase(unique(all(ang)), ang.end());
	N = sz(ang);
	rep(i,0,N)
		ang.push_back(ang[i] + 2*M_PI);
	si.resize(N*2);
	co.resize(N*2);
	rep(i,0,N*2)
		si[i] = sin(ang[i]), co[i] = cos(ang[i]);
	vector<double> a, b, c, d;
	double res = 1e12;
	rep(i,0,N) {
		rep(j,i+1,N) {
			areas(i, j, a, b);
			areas(j, i+N, c, d);
			res = min(res, minAr(a, c));
			res = min(res, minAr(a, d));
			res = min(res, minAr(b, c));
			res = min(res, minAr(b, d));
		}
	}
	if (res < 1e10)
		cout << setprecision(15) << fixed << res*R*R/2 << endl;
	else
		cout << -1 << endl;
}

#include <algorithm>
#include <cmath>
#include <complex>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <limits>
#include <map>
#include <queue>
#include <set>
#include <stack>
#include <string>
#include <utility>
#include <vector>
using namespace std;
typedef long long LL;
typedef long double LD;
typedef vector<int> VI;
typedef vector<vector<int> > VII;
#define rep(i, a) for(int i = 0; i < (a); i++)
#define foru(i, s, e) for(int i = (s); i < (e); i++)
#define ford(i, s, e) for(int i = (s); i >= (e); i--)
#define cinNewLine cin.ignore(numeric_limits<streamsize>::max(), '\n');
const double EPS = 1e-9;
const int INF = 2147483647;
const LL LLINF = 9223372036854775807LL;
template <class T> T gcd(T a, T b) { if(b == 0) return a; return gcd(b, a%b); }
template <class T> T lcm(T a, T b) { return (a*b)/gcd(a, b); }

int main() {
    int n;
	cin >> n;
	vector<pair<double, double> > p(n);
	rep(i,n) cin >> p[i].first >> p[i].second;
	sort(p.begin(), p.end());
	vector<bool> include(n, true);
	double lastX = -100000, lastY = 0;
	rep(i, n) {
		if(p[i].first - lastX <= lastY - p[i].second) {
			include[i] = false;
		} else {
			lastX = p[i].first;
			lastY = p[i].second;
		}
	}
	lastX = 100000, lastY = 0;
	ford(i, n-1, 0) {
		if(lastX - p[i].first <= lastY - p[i].second) {
			include[i] = false;
		} else {
			lastX = p[i].first;
			lastY = p[i].second;
		}
	}
	vector<pair<double, double> > a;
	rep(i, n) if(include[i]) a.push_back(p[i]);
	int m = a.size();
	double ans = 0;
	ans += a[0].second*a[0].second/2.0 + a[m-1].second*a[m-1].second/2.0;
	rep(i, m-1) {
		double dx = a[i+1].first-a[i].first, dy = a[i+1].second-a[i].second;	
		double x = (dx-dy)/2.0;
		if(x > a[i].second) {
			ans += a[i].second*a[i].second/2.0;
			ans += a[i+1].second*a[i+1].second/2.0;
		} else {
			ans += (a[i].second-x)*dx;
			ans += (x*x)/2.0;
			ans += (dx-x)*(dx-x)/2.0;
		}
	}
	printf("%.9f\n", ans);
	return 0;
}


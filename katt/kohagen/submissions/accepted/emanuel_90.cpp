// Complexity: O(n^3 log n)
// Expected score: 90

#include <bits/stdc++.h>
using namespace std;
 
#define rep(i, a, b) for(int i = a; i < int(b); i++)
#define trav(it, v) for(auto it = v.begin(); it != v.end(); it++)
#define all(x) x.begin(), x.end()
#define sz(x) (int) (x).size()
 
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef vector<vector<int>> vvi; 
 
vector<double> a;
int n;
double m, r;

double getArea(int i, int j, int k) {
	double x1 = r*cos(a[i]);
	double y1 = r*sin(a[i]);
	double x2 = r*cos(a[j]);
	double y2 = r*sin(a[j]);
	double x3 = r*cos(a[k]);
	double y3 = r*sin(a[k]);
	return abs(x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2))/2.0;
}

int main() {
	scanf("%d %lf %lf", &n, &m, &r);
	a.resize(n);
	rep(i, 0, n) {
		scanf("%lf", &a[i]);
		a[i] = a[i] * M_PI / 180.0;
	}
	sort(all(a));
	double ans = 4*r*r;
	rep(i, 0, n) {
		rep(j, i+2, n) {
			set<double> s;
			rep(k, i+1, j) {
				s.insert(getArea(i, j, k));
			}
			int k = (j+1)%n;
			while(k != i) {
				double area = getArea(i, j, k);
				auto t = s.lower_bound(m - area);
				if(t != s.end()) {
					ans = min(ans, area + *t);
				}
				k = (k+1)%n;
			}
		}
	}
	if(ans < 4*r*r) printf("%.9lf\n", ans);
	else printf("-1\n");
}


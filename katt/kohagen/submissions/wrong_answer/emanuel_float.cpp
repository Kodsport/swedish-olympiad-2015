// Bad Precision
// Expected score: < 100

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
 
vector<float> a;
int n;
float m, r;

float getArea(int i, int j, int k) {
	float x1 = r*cos(a[i]);
	float y1 = r*sin(a[i]);
	float x2 = r*cos(a[j]);
	float y2 = r*sin(a[j]);
	float x3 = r*cos(a[k]);
	float y3 = r*sin(a[k]);
	return abs(x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2))/2.0;
}

int main() {
	scanf("%d %f %f", &n, &m, &r);
	a.resize(n);
	rep(i, 0, n) {
		scanf("%f", &a[i]);
		a[i] = a[i] * M_PI / 180.0;
	}
	sort(all(a));
	float ans = 4*r*r;
	rep(i, 0, n) {
		rep(j, i+2, n) {
			set<float> s;
			rep(k, i+1, j) {
				s.insert(getArea(i, j, k));
			}
			int k = (j+1)%n;
			while(k != i) {
				float area = getArea(i, j, k);
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


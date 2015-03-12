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
 
vector<double> a, si, co;
int n;
double m, r;

double getArea(int i, int j, int k) {
	double x1 = r*co[i];
	double y1 = r*si[i];
	double x2 = r*co[j];
	double y2 = r*si[j];
	double x3 = r*co[k];
	double y3 = r*si[k];
	return abs(x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2));
}

int main() {
	scanf("%d %lf %lf", &n, &m, &r);
	m *= 2.0;
	a.resize(n);
	co.resize(n);
	si.resize(n);
	rep(i, 0, n) {
		scanf("%lf", &a[i]);
		a[i] = a[i] * M_PI / 180.0;
	}
	sort(all(a));
	rep(i, 0, n) {
		co[i] = cos(a[i]);
		si[i] = sin(a[i]);
	}
	double ans = 8*r*r;
	rep(i, 0, n) {
		rep(j, i+2, n) {
			vector<double> v1, v2;
			rep(k, i+1, j) {
				v1.push_back(getArea(i, j, k));
			}
			int k = j+1;
			if(k >= n) k -= n;
			while(k != i) {
				v2.push_back(getArea(i, j, k));
				k++;
				if(k >= n) k -= n;
			}

			sort(all(v1));
			sort(all(v2));

			// Sweep
			k = 0;
			int l = v2.size()-1;
			while(k < v1.size() && l >= 0) {
				double area = v1[k] + v2[l];
				if(area < m) {
					k++;
				} else {
					ans = min(ans, area);
					l--;
				}
			}
		}
	}
	if(ans < 8*r*r) printf("%.9lf\n", ans/2.0);
	else printf("-1\n");
}


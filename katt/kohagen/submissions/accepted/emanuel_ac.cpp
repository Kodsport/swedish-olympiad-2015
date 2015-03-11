// Complexity: O(n^3)
// Expected score: 100

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
		a[i] = a[i] * (double)180.0 / M_PI;
	}
	sort(all(a));
	double ans = 4*r*r;
	rep(i, 0, n) {
		rep(j, i+2, n) {
			double ma = 0;
			int maIdx = -1;
			rep(k, i+1, j) {
				double area = getArea(i, j, k);
				if(area > ma) {
					ma = area;
					maIdx = k;
				}
			}
			assert(maIdx != -1);

			//First sweep
			int k = maIdx;
			int l = (j+1) % n;
			while(l != i && k != j) {
				double area = getArea(i, j, k) + getArea(i, j, l);
				if(area < m) {
					l = (l+1) % n;
				} else {
					ans = min(ans, area);
					k++;
				}
			}

			//Second sweep
			k = maIdx;
			l = (j+1) % n;
			while(l != i && k != i) {
				double area = getArea(i, j, k) + getArea(i, j, l);
				if(area < m) {
					l = (l+1) % n;
				} else {
					ans = min(ans, area);
					k--;
				}
			}

			//Third sweep
			k = maIdx;
			l = i-1;
			if(l < 0) l += n;
			while(l != j && k != j) {
				double area = getArea(i, j, k) + getArea(i, j, l);
				if(area < m) {
					l--;
					if(l < 0) l += n;
				} else {
					ans = min(ans, area);
					k++;
				}
			}

			//Fourth sweep
			k = maIdx;
			l = i-1;
			if(l < 0) l += n;
			while(l != j && k != i) {
				double area = getArea(i, j, k) + getArea(i, j, l);
				if(area < m) {
					l--;
					if(l < 0) l += n;
				} else {
					ans = min(ans, area);
					k--;
				}
			}
		}
	}
	if(ans < 4*r*r) printf("%.9lf\n", ans);
	else printf("-1\n");
}


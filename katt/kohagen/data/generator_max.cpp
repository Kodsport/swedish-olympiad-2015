// Usage: echo 'n r seed' | ./generator.out
// For shorter runtime combine large n with large r

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

double solve() {
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
	return ans;
}

double getMaxArea() {
	double ans = -1;
	rep(i, 0, n) {
		rep(j, i+2, n) {
			double a1 = 0, a2 = 0;
			rep(k, i+1, j) {
				a1 = max(a1, getArea(i, j, k));
			}
			int k = (j+1)%n;
			while(k != i) {
				a2 = max(a2, getArea(i, j, k));
				k = (k+1)%n;
			}
			ans = max(ans, a1 + a2);
		}
	}
	return ans;
}

int main() {
	int seed;
	scanf("%d %lf %d", &n, &r, &seed);
	a.resize(n);
	srand(seed);
	double maxArea = -1, ans = -2;
	while(maxArea != ans) {
		rep(i, 0, n) {
			a[i] = ((double)rand() / (RAND_MAX)) * 360.00;
			if(a[i] >= 360.00) a[i] -= 360.00;
		}
		sort(all(a));
		maxArea = getMaxArea();
		m = int(maxArea);
		ans = solve();
	}
	random_shuffle(all(a));
	printf("%d %d %d\n", n, (int)m, (int)r);
	rep(i, 0, n) {
		printf("%lf", a[i]);
		if(i == n-1) printf("\n");
		else printf(" ");
	}
}


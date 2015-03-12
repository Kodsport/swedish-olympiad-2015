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

int main() {
	ignore = scanf("%d %lf %lf", &n, &m, &r);
	m *= 2;
	a.resize(n);
	co.resize(n);
	si.resize(n);
	rep(i, 0, n) {
		ignore = scanf("%lf", &a[i]);
		a[i] = a[i] * M_PI / 180;
	}
	sort(all(a));
	rep(i, 0, n) {
		co[i] = cos(a[i]);
		si[i] = sin(a[i]);
	}
	double ans = 8*r*r;
	double C, CX, CY;
	int N = n;
	// if (N > 100) N /= 16;
	rep(i, 0, N) {
		rep(j, i+2, n) {
			vector<double> v1, v2;

			CX = si[j] - si[i];
			CY = co[i] - co[j];
			C = co[j]*si[i] - co[i]*si[j];
			C *= r*r; CX *= r*r; CY *= r*r;
			rep(k, i+1, j) {
				v1.push_back(CY*si[k] + CX*co[k] + C);
			}

			CX = si[i] - si[j];
			CY = co[j] - co[i];
			C = co[i]*si[j] - co[j]*si[i];
			C *= r*r; CX *= r*r; CY *= r*r;
			rep(k, j+1, n) {
				v2.push_back(CY*si[k] + CX*co[k] + C);
			}

			sort(all(v1));
			sort(all(v2));

			// Sweep
			int k = 0;
			int l = sz(v2)-1;
			while(k < sz(v1) && l >= 0) {
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
	if(ans < 8*r*r) printf("%.15lf\n", ans/2);
	else printf("-1\n");
}

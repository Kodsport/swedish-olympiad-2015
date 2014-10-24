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
	set<string> once, twice;
	rep(i, n) {
		string s;
		cin >> s;
		if(!once.insert(s).second) twice.insert(s);
	}
	cout << twice.size() << endl;
	return 0;
}


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

int main() {
	LL n;
	cin >> n;
	LL ans = (n+1)*2;
	LL i = 1;
	while(true) {
		LL j = n/i;
		if(i*j < n) j++;
		if(j < i) break;
		ans = min(ans, (i+1) * (j+1));
		i++;
	}
	cout << ans << endl;
	return 0;
}


// O(N^2).

#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

typedef long long ll;

int main() {
	int N, K;
	cin >> N >> K;
	K *= 2;
	vector<ll> times(N);
	for (int i = 0; i < N; ++i)
		cin >> times[i];
	sort(times.begin(), times.end());
	const ll inf = 1000000000000000LL;
	vector<ll> sols(N, inf);
	ll res = inf;

	{
		// Choose where to send the first bus.
		ll count = 0, sum = 0;
		for (int j = 0; j < N; ++j) {
			sols[j] = times[j] * count - sum;
			count++;
			sum += times[j];
		}
	}

	for (int i = 0; i < N; ++i) {
		// Jump from every starting place to every other one,
		// with non-paused jumps in between.
		ll cost = sols[i];
		ll ibegin = times[i], iend = ibegin + K;
		ll lastcount = 0, lastsum = 0;
		ll icount = 0, isum = 0;
		bool seenone = false;
		for (int j = i+1; j < N; ++j) {
			ll now = times[j];

			if (now >= iend) {
				// send at time iend
				cost += iend * icount - isum;

				ibegin = iend;
				iend = ibegin + K;
				lastcount = icount;
				lastsum = isum;
				seenone = true;
				icount = isum = 0;
			}

			if (now >= iend) {
				// Send empty buses. We want to make the inequality
				// |now < iend + n*K| hold, so set
				// |n = floor((now - iend) / K) + 1|.
				ll n = (now - iend) / K + 1;
				ibegin += n * K;
				iend += n * K;
				lastcount = lastsum = 0;
			}

			if (seenone) {
				// Send at time now, i.e. at point sols[j]. This can only
				// happen if the first bus has returned.
				ll c = cost + (now * icount - isum);
				c += (now - ibegin) * lastcount;
				sols[j] = min(sols[j], c);
			}

			if (now == ibegin) {
				lastcount++;
				lastsum += now;
			}
			else {
				icount++;
				isum += now;
			}
		}

		// send at time iend
		cost += iend * icount - isum;
		res = min(res, cost);
	}
	cout << res << endl;
	return 0;
}

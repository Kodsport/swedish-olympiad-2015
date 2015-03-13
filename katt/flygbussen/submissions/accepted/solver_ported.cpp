// O(NK), ported from Solver.java which is slow
#include <bits/stdc++.h>
using namespace std;

#define rep(i,f,t) for (int i = f; i < t; ++i)
#define sz(x) (int)(x).size()
typedef long long ll;

static int n, rtt;
static vector<ll> Time, cnt;
static vector<vector<ll> > cost, dp;
static vector<vector<int> > jump;

static ll solve(int team, int offset) {
	if (team == n) return 0;
	if (dp[team][offset] != -1) return dp[team][offset];
	int next = team + jump[team][offset];
	int nextOffset = next >= n ? 0 : max(0, (int)(Time[team] + offset + rtt - Time[next]));
	ll res = cost[team][offset] + solve(next, nextOffset);
	if (next < n && Time[next] - Time[team] < 2*rtt) {
		res = min(res, solve(team, (int)(Time[next] - Time[team])));
	}
	return dp[team][offset] = res;
}

int main() {
	int N, K;
	cin >> N >> K;
	rtt = 2*K;
	map<ll, int> timeCount;
	rep(i,0,N) {
		ll t;
		cin >> t;
		++timeCount[t];
	}
	n = sz(timeCount);
	Time.resize(n);
	cnt.resize(n);
	int index = 0;
	for (auto pa : timeCount) {
		Time[index] = pa.first;
		cnt[index] = pa.second;
		index++;
	}
	jump.assign(n, vector<int>(2*rtt));
	cost.assign(n, vector<ll>(2*rtt));
	rep(i,0,n) {
		ll passengerCnt = cnt[i];
		ll accCost = 0;
		int jumpCnt = 1;
		int next = i+1;
		cost[i][0] = 0;
		jump[i][0] = 1;
		rep(j,1,2*rtt) {
			accCost += passengerCnt;
			if (next < n && Time[i] + j == Time[next]) {
				passengerCnt += cnt[next];
				jumpCnt++;
				next++;
			}
			cost[i][j] = accCost;
			jump[i][j] = jumpCnt;
		}
	}
	dp.assign(n, vector<ll>(2*rtt, -1));
	cout << solve(0, 0) << endl;
}

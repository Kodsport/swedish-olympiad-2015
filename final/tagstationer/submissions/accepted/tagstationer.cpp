#include <iostream>
#include <vector>
#include <algorithm>
#include <cassert>
using namespace std;

struct Station {
	int on, off, index;
};
bool operator<(const Station& a, const Station& b) {
	return a.off < b.off;
}

int solve(vector<Station>& st) {
	bool many = false;
	long long cur = 0;
	int sz = (int)st.size();
	for (int i = 0; i < sz; ++i) {
		if (st[i].off > cur)
			return 0;
		many = many || (i + 1 < sz && st[i+1].off <= cur);
		cur += st[i].on - st[i].off;
	}
	return many ? 2 : 1;
}

int main() {
	int N;
	cin >> N;
	vector<Station> start, end;
	long long tot = 0;
	long long people = 0;
	for (int i = 0; i < N; ++i) {
		Station s;
		s.index = i;
		cin >> s.on >> s.off;
		tot += s.on - s.off;
		people += s.on;
		if (s.off > s.on) {
			swap(s.on, s.off);
			end.push_back(s);
		} else {
			start.push_back(s);
		}
	}
	assert(cin);
	assert(tot == 0);
	assert(people <= 1e9);
	assert(!start.empty());
	assert(!end.empty());
	sort(start.begin(), start.end());
	sort(end.begin(), end.end());
	int sols = solve(start) * solve(end);
	if (!sols) {
		cout << "NEJ" << endl;
	}
	else {
		vector<int> order;
		for (Station s : start)
			order.push_back(s.index);
		reverse(end.begin(), end.end());
		for (Station s : end)
			order.push_back(s.index);
		Station &a = start.back(), &b = end.front();
		swap(a, b);
		swap(a.on, a.off);
		swap(b.on, b.off);
		sols += solve(start) * solve(end);
		if (sols == 1) {
			cout << "UNIK" << endl;
		} else {
			cout << "JA" << endl;
		}
		for (int x : order)
			cout << x + 1 << ' ';
		cout << endl;
	}
}

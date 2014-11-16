#include <iostream>
#include <algorithm>
#include <vector>

typedef long long int LL;

using namespace std;

bool inside(pair<LL,LL> a, pair<LL,LL> b) {
    return b.second <= a.second && b.first - a.first <= a.second - b.second;
}

pair<double,double> get_middle(pair<LL,LL> a, pair<LL,LL> b) {
    double x = ((double) a.first + a.second + b.first - b.second) / 2;
    double y = b.second + x - b.first;
    return make_pair(x, y);
}

bool cmp(pair<LL,LL> a, pair<LL,LL> b) {
    return  a.first - a.second < b.first - b.second ||
            a.first - a.second == b.first - b.second && a.second > b.second;
}

int main() {
    int n;
    cin >> n;
    vector< pair<LL,LL> > p(n, make_pair(0,0));
    for (int i = 0; i < n; i++) {
        cin >> p[i].first >> p[i].second;
    }
    sort(p.begin(), p.end(), cmp);
    double res = 0;
    int li = 0;
    for (int ri = 1; ri < n; ri++) {
        if (!inside(p[li], p[ri])) {
            pair<double,double> mid = get_middle(p[li], p[ri]);
            res += p[li].second * p[li].second;
            res -= mid.second * mid.second;
            li = ri;
        }
    }
    res += p[li].second * p[li].second;
    cout.precision(15);
    cout << res << endl;
}

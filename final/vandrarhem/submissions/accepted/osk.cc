#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int N, M;
    cin >> N >> M;
    vector<pair<int,int>> v;
    for (int i = 0; i < M; ++i) {
        int ci, bi;
        cin >> ci >> bi;
        v.emplace_back(ci, bi);
    }
    sort(v.begin(), v.end());
    int res = 0;
    for (const auto p : v) {
        const int buy_here = N >= p.second ? p.second : N;
        N -= buy_here;
        res += p.first * buy_here;
    }
    cout << res << endl;
}

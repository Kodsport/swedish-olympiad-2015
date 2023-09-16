#include <iostream>
#include <cmath>
#include <map>
#include <unordered_map>
#include <set>
#include <queue>
#include <vector>
#include <string>
#include <algorithm>
#include <iomanip>

#define all(x)  (x).begin(), (x).end()
#define rall(x)  (x).rbegin(), (x).rend()

typedef long long ll;

ll linf = 1e15+1;

using namespace std;

inline void scoobydoobydoo(){
    ios::sync_with_stdio(false);
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);
}

map<pair<int, int>, int> M;
vector<int> regering;
int majoritet = 0;

int dp(int index, int daler){
    if (M.find({index, daler}) != M.end()){
        return M[{index, daler}];
    }
    if (daler > majoritet){
        return 1;
    }
    if (index == regering.size())return 0;
    return M[{index, daler}] = dp(index+1, daler+regering[index]) + dp(index+1, daler);
}


int main(){
    scoobydoobydoo();
    int n; cin >> n;
    for (int i = 0; i < n; i++){
        int t; cin >> t;
        regering.push_back(t);
        majoritet += t;
    }
    majoritet /= 2;
    sort(rall(regering));
    cout << dp(0, 0) << endl;

    return 0;
}
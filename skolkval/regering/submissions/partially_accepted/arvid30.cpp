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

vector<vector<int>> allPossibilities;

void brute_force(int index, vector<int> soFar, vector<int>& regering, int n){
    if (index == n-1){
        allPossibilities.push_back(soFar);
        soFar.push_back(regering[index]);
        allPossibilities.push_back(soFar);
        return;
    }
    brute_force(index+1, soFar, regering, n);
    soFar.push_back(regering[index]);
    brute_force(index+1, soFar, regering, n);
    return;
}

bool checkIfValid(vector<int>& v, int s){
    int majority = s/2;
    sort(rall(v));
    int sum = 0;
    for (int i = 0; i < v.size(); i++){
        if (sum > majority)return false;
        sum += v[i];
    }
    if (sum > majority)return true;
    else return false;
}

int main(){
    scoobydoobydoo();
    int n; cin >> n;
    int s = 0, ans = 0;
    vector<int> regering(n);
    for (int i = 0; i < n; i++){
        cin >> regering[i];
        s += regering[i];
    }
    brute_force(0, {}, regering, n);
    for (vector<int> q : allPossibilities){
        if (checkIfValid(q, s))ans++;
    }

    cout << ans << endl;

    return 0;
}
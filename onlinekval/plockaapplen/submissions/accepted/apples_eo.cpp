#include <iostream>
#include <algorithm>

using namespace std;

const int MAX_N = 1000;
const int MAX_M = 2000;

int n, m;
int a[2][MAX_N];
int dp[2][MAX_N][MAX_M+1];

int solve(int r, int c, int left) {
    if (left == 0) return 0;
    if (c == n) return 0;
    if (dp[r][c][left] != -1) return dp[r][c][left];
    int res = a[r][c] + solve(r, c+1, left-1);
    int r2 = (r+1)%2;
    if (left > 1) {
        res = max(res, a[r][c] + a[r2][c] + solve(r2, c+1, left-2));
    }
    return dp[r][c][left] = res;
}

int main() {
    cin >> n >> m;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < n; j++) {
            cin >> a[i][j];
            for (int k = 0; k <= m; k++) {
                dp[i][j][k] = -1;
            }
        }
    }
    cout << solve(1, 0, m) << endl;
}


#include <iostream>
#include <algorithm>
#include <cstring>

// O(N*Y*X) solution

const int MIN_X = -200, MAX_X = 200;
const int X_DIFF = MAX_X - MIN_X + 1;
const int MAX_Y = 100;

using namespace std;

int main() {
    int n;
    cin >> n;
    bool grid[MAX_Y + 1][X_DIFF];
    memset(&grid, 0, (MAX_Y+1)*X_DIFF);

    for (int i = 0; i < n; i++) {
        int x, y;
        cin >> x >> y;
        x -= MIN_X;
        int lx = x, rx = x;
        while (y >= 0) {
            for (int j = lx; j <= rx; j++) {
                grid[y][j] = true;
            }
            lx = max(0, lx - 1);
            rx = min(X_DIFF - 1, rx + 1);
            y--;
        }
    }
    double res = 0;
    for (int y = MAX_Y - 1; y >= 0; y--) {
        for (int x = 0; x < X_DIFF - 1; x++) {
            if (grid[y+1][x] && grid[y+1][x+1]) {
                if (y+1 == MAX_Y || !(grid[y+2][x] || grid[y+2][x+1])) {
                    res += 0.75;
                } else {
                    res += 1;
                }
            } else if (grid[y+1][x] || grid[y+1][x+1]) {
                res += 0.5;
            }
        }
    }
    cout.precision(7);
    cout << res << endl;
}

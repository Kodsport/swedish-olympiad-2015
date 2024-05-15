#include <iostream>
#include <algorithm>
#include <cstring>

// O(N + Y*X) solution

const int MIN_X = -2000, MAX_X = 2000;
const int X_DIFF = MAX_X - MIN_X + 1;
const int MAX_Y = 1000;

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
        grid[y][x] = true;
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
                grid[y][x] = grid[y][x+1] = true;
            } else if (grid[y+1][x] || grid[y+1][x+1]) {
                res += 0.5;
                grid[y][x] = grid[y][x+1] = true;
            }
        }
    }
    cout.precision(9);
    cout << res << endl;
}

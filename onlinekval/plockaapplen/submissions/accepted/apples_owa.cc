// Solution to "apples" by Oskar Werkelin Ahlin
// Time complexity: O(fuck)
// Memory complexity: Vulcanoes

#include <iostream>
#include <vector>
#include <set>

using namespace std;

int apples[2][5000];
int n, k;

typedef pair<int,int> coord_t;
typedef set<coord_t> cache_t;

int best(const int pos, const int row, const int steps, const cache_t vis) {
    if (steps == 0 || pos < 0 || pos >= n || row < 0 || row > 1) return 0; 
    const coord_t current(pos, row);
    if (vis.find(current) != vis.end()) {
        return 0;
    }
    cache_t new_cache = vis;
    new_cache.insert(current);
    int ans = 0;
    for (int i = -1; i <= 1; ++i) {
        for (int j = -1; j <= 1; ++j) {
            if (!!i ^ !!j != 0) {
                ans = max(ans, apples[row][pos] + best(pos + i, row + j, steps-1, new_cache));
            }
        }
    }
    return ans;
}

int main() {
    cin >> n >> k;
    for (int i = 0; i < 2; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> apples[i][j];
        }
    }
    cout << best(0, 1, k, cache_t()) << endl; 
}

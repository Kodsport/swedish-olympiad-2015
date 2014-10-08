#include <iostream>
#include <string>
#include <cstring>
#include <vector>
#include <deque>

using namespace std;

const int dr[] = {-2, -2, -1, -1, 1, 1, 2, 2};
const int dc[] = {-1, 1, -2, 2, -2, 2, -1, 1};

int N, M;

void dfs(int r, int c, vector< vector<bool> > &grid, vector< vector<bool> > &vis) {
    if (vis[r][c]) return;
    vis[r][c] = true;
    for (int k = 0; k < 8; k++) {
        int nr = r + dr[k], nc = c + dc[k];
        if (nr >= 0 && nr < N && nc >= 0 && nc < M && grid[nr][nc]) {
            dfs(nr, nc, grid, vis);
        }
    }
}

int main() {
    cin >> N >> M;
    vector< vector<bool> > grid(N, vector<bool>(M, false));
    vector< vector<bool> > vis(N, vector<bool>(M, false));
    int hestPos[2][2];
    int hi = 0;
    for (int i = 0; i < N; i++) {
        string s;
        cin >> s;
        for (int j = 0; j < M; j++) {
            char c = s[j];
            if (c == '#') {
                grid[i][j] = false;
            } else {
                grid[i][j] = true;
                if (c == 'H') {
                    hestPos[hi][0] = i;
                    hestPos[hi][1] = j;
                    hi++;
                }
            }
        }
    }
    dfs(hestPos[0][0], hestPos[0][1], grid, vis);
    cout << (vis[hestPos[1][0]][hestPos[1][1]] ? "JA" : "NEJ") << endl;
    return 0;
}

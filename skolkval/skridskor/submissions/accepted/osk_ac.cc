
#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

typedef vector<vector<bool> > grid_t;

struct State {
    int r, c, d;
    explicit State(int r, int c, int d) : r(r), c(c), d(d) {}
};

int solve(const grid_t &grid) {
    vector<vector<vector<int> > > dist(grid.size(), vector<vector<int> >(grid[0].size(), vector<int>(4, -1)));

    int dr[4] = {0, 1, 0, -1};
    int dc[4] = {1, 0, -1, 0};

    if (grid[0][0]) return -1;

    queue<State> q;

    q.push(State(0,0,0));
    dist[0][0][0] = 0;

    while (!q.empty()) {
        const State cur = q.front();
        q.pop();

        int r = cur.r;
        int c = cur.c;
        int d = cur.d;

//        cout << "now at " << r << " " << c << " " << d <<  endl;

        for (;;) {
            int nr = r + dr[cur.d];
            int nc = c + dc[cur.d];

 //           cout << nr << " " << nc << endl;

            if (nc >= (int)grid[0].size()) {
                return dist[cur.r][cur.c][cur.d]; // Done.
            }
            if (nr >= (int)grid.size() || nr < 0 || nc < 0) break; // Invalid.
            if (grid[nr][nc]) {
                if (dist[r][c][(d+3)%4] == -1) {
                    State left(r, c, (d+3)%4);
                    dist[r][c][(d+3)%4] = dist[cur.r][cur.c][cur.d] + 1;
                    q.push(left);
                }
                if (dist[r][c][(d+1)%4] == -1) {
                    State right(r, c, (d+1)%4);
                    dist[r][c][(d+1)%4] = dist[cur.r][cur.c][cur.d] + 1;
                    q.push(right);
                }
                break;
            }

            r = nr;
            c = nc;
        }
    }

    return -1;
}

int main() {
    int r, c;
    cin >> r >> c;
    vector<vector<bool> > grid;
    for (int i = 0; i < r; ++i) {
        string cur;
        cin >> cur;
        vector<bool> currow;
        for (int j = 0; j < cur.size(); ++j) {
            currow.push_back(cur[j] == '#');
        }
        grid.push_back(currow);
    }

    cout << solve(grid) << endl;
}

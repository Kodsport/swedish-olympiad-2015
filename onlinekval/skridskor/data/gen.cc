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

//        cout << "now at " << r << " " << c << endl;

        for (;;) {
            int nr = r + dr[cur.d];
            int nc = c + dc[cur.d];

            if (nc >= (int)grid[0].size()) return dist[cur.r][cur.c][cur.d]; // Done.
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

bool has_solution(const grid_t &grid) {
    return solve(grid) != -1;
}

int main(int argc, char** argv) {
	if(argc < 5){
		printf("Usage: ./gen rows cols blocks seed\n");
		exit(0);
	}
    int rows = atoi(argv[1]);

    int cols = atoi(argv[2]);

    int blocks = atoi(argv[3]);

    int seed = atoi(argv[4]);

    srand(seed);

    grid_t grid(rows, vector<bool>(cols, false));

    vector<pair<int,int> > coords;
    for (int j = 0; j < rows; ++j) {
        for (int k = 0; k < cols; ++k) {
            coords.push_back(make_pair(j,k));
        }
    }
    random_shuffle(coords.begin(), coords.end());

    typedef vector<pair<int,int> >::iterator it_t;
    int placed = 0;
    for (it_t it = coords.begin(); placed < blocks && it != coords.end(); ++it, ++placed) {
        if (!grid[it->first][it->second]) {
            grid[it->first][it->second] = true;
            if (!has_solution(grid)) {
                grid[it->first][it->second] = false;
                --placed;
            }
        }
    }

    cout << rows << " " << cols << endl;
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            if (grid[i][j]) cout << "#";
            else cout << ".";
        }
        cout << endl;
    }
}

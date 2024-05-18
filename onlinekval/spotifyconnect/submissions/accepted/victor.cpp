#include <bits/stdc++.h>

using namespace std;

#define ii pair<int, int>
#define iii pair<int, ii>
#define vi vector<int>
#define vii vector<ii>
#define ll long long
#define INF 1000000000

int main()
{
    ios::sync_with_stdio(0);
    cin.tie(NULL);
    int n, time, prev = 0, played = 0;
    string device, op;
    string command;
    bool play = false;
    cin >> n;
    priority_queue<pair<int, string>> pq;
    while (n--)
    {
        cin >> time >> device >> op;
        if (device == "mobile")
            time += 100;
        pq.emplace(-time, op);
    }

    while (!pq.empty())
    {
        time = -pq.top().first, command = pq.top().second;
        pq.pop();
        if (play)
            played += time - prev;
        if (command == "play")
            play = true;
        else
            play = false;
        prev = time;
    }

    printf("%d\n", played);
    return 0;
}
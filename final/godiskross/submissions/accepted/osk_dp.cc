// Solution by Oskar Werkelin Ahlin
//
// An attempt to write a test-driven programming contest solution, which
// turns out to work out totally excellent for these kinds of problems!

#include <algorithm>
#include <cassert>
#include <iostream>
#include <map>
#include <string>

using namespace std;

typedef tuple<int, int, string> crush_result;
typedef pair<int, string> crush_once_result;
typedef tuple<string, int, int> state_t;

pair<int, string> crush_once(const string &board) {
    vector<bool> erase(board.size(), false);
    int score = 0;
    for (int i = 0; i < board.size(); ++i) {
        int j;
        for (j = i+1; j < board.size() && board[i] == board[j]; ++j);
        if (j - i >= 3) {
            for (int k = i; k < j; ++k) {
                erase[k] = true; 
            }
            score += (j-i) * 2 - 5;
            i = j-1;
        }
    }
    string result;
    for (int i = 0; i < erase.size(); ++i) {
        if (!erase[i]) {
            result.push_back(board[i]);
        }
    }
    return make_pair(score, result);
}

crush_result crush(const string &board, const string &original, const int offset) {
    int cur_offset = offset;
    int crushed = 0;
    int score = 0;
    string old_result = board;
    string result = board;
    for (;;) {
        auto result_pair = crush_once(old_result);
        auto this_score = result_pair.first;
        score += this_score;
        result = result_pair.second;
        if (result.size() < original.size()) {
            while (result.size() < original.size()) {
                result.push_back(original[(cur_offset++) % original.size()]);
                ++crushed;
            }
        } else {
            break;
        }
        old_result = result;
    }
    return make_tuple(crushed, score, result);
}

void test_crush_once() {
    const auto crush_result_1 = crush_once_result(0, "BAABAB");
    assert(crush_once("BAABAB") == crush_result_1);
    const auto crush_result_2 = crush_once_result(5, "");
    assert(crush_once("AAAAA") == crush_result_2);
    const auto crush_result_3 = crush_once_result(1, "BBBB");
    assert(crush_once("BBAAABB") == crush_result_3);
    const auto crush_result_4 = crush_once_result(2, "BB");
    assert(crush_once("AAABBAAA") == crush_result_4);
    const auto crush_result_5 = crush_once_result(0, "BB");
    assert(crush_once("BB") == crush_result_5);
    const auto crush_result_6 = crush_once_result(2, "");
    assert(crush_once("BBBAAA") == crush_result_6);
}

void test_crush() {
    const auto crush_result_1 = make_tuple(0, 0, "BAABAB");
    assert(crush("BAABAB", "BAABAB", 0) == crush_result_1);
    const auto crush_result_2 = make_tuple(7, 4, "AABABB");
    assert(crush("BAAABB", "BAABAB", 0) == crush_result_2);
    const auto crush_result_3 = make_tuple(6, 2, "AABABB");
    assert(crush("BBBAAA", "BAABAB", 7) == crush_result_3);
    const auto crush_result_4 = make_tuple(6, 2, "BAABAB");
    assert(crush("BBBAAA", "BAABAB", 0) == crush_result_4);
}

int solve(
    const string &current,
    const string &original,
    const int offset,
    const int steps,
    map<state_t, int> &memo) {
    state_t current_state = make_tuple(current, offset, steps);
    if (memo.count(current_state)) return memo[current_state];
    if (steps == 0) return 0;
    int ret = 0;
    for (int i = 0; i < current.size() - 1; ++i) {
        auto copy = current;
        swap(copy[i], copy[i+1]);
        const auto &result = crush(copy, original, offset);
        const auto crushed = std::get<0>(result);
        const auto score = std::get<1>(result);
        const auto &board = std::get<2>(result);
        if (crushed == 0) continue; // Nothing crushed, invalid move.
        ret = max(ret, 
            score + solve(board, original, (offset + crushed) % original.size(), steps - 1, memo));
    }
    return memo[current_state] = ret;
}

int main() {
    test_crush_once();
    test_crush();

    int N;
    cin >> N;

    string input;
    cin >> input;

    map<state_t, int> memo;
    cout << solve(input, input, 0, N, memo) << endl;
}

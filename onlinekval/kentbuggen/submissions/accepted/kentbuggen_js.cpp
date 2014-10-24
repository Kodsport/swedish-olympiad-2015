#include <map>
#include <iostream>
#include <string>
#include <functional>

using namespace std;

struct PolyHash {
	unsigned operator()(const string& s){
		unsigned ans = 0;
		for(int i = 0; i < s.size(); ++i){
			ans = ans * 3145739u + s[i];
		}
		return ans;
	}
};

PolyHash h;

int main(){
	int n;
	cin >> n;
	map<unsigned, int> cnt;
	for(int i = 0; i < n; ++i){
		string s;
		cin >> s;
		cnt[h(s)]++;
	}
	int ans = 0;
	for(auto it = cnt.begin(); it != cnt.end(); ++it){
		ans += it->second > 1;
	}
	cout << ans << endl;
}

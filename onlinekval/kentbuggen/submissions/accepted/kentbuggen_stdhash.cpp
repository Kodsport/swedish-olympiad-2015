#include <map>
#include <iostream>
#include <string>
#include <functional>

using namespace std;

hash<string> h;

int main(){
	int n;
	cin >> n;
	map<int, int> cnt;
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

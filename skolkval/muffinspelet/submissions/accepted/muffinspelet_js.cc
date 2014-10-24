#include <iostream>
#include <vector>

using namespace std;

int main(){
	int N;
	cin >> N;
	bool turn = false;
	vector<int> ans(2);

	while(N){
		ans[turn^=1] += (N+1)/2;
		N /= 2;
	}
	cout << ans[0] << " " << ans[1] << endl;
}

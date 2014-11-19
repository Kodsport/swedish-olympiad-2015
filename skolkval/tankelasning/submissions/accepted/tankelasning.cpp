#include <iostream>
#include <cassert>
using namespace std;

int main() {
	int N;
	cin >> N;
	int a = 1, b = 0, c = 1;
	bool fail = false;
	for (int i = 0; i < N; ++i) {
		char op;
		int num;
		cin >> op >> num;
		if (!cin) { // "x"
			cin.clear();
			char ch; cin >> ch;
			assert(ch == 'x');
			if (fail)
				continue;
			if (op == '*') {
				if (a != 0) {
					fail = true;
				} else {
					a = b;
					b = 0;
				}
			} else {
				if (op == '+')
					a += c;
				else if (op == '-')
					a -= c;
				else
					assert(false);
			}
		} else {
			if (op == '*' && num == 0) {
				fail = false;
				a = b = 0;
			} else if (!fail) {
				if (op == '*')
					a *= num, b *= num;
				else if (op == '/')
					c *= num;
				else if (op == '+')
					b += num * c;
				else if (op == '-')
					b -= num * c;
				else
					assert(false);
			}
		}
	}
	if (!fail && a == 0 && b % c == 0) {
		// int d = __gcd(b, c); b /= d; c /= d;
		cout << (b / c) << endl;
	} else {
		cout << "Nej" << endl;
	}
}

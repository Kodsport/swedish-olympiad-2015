#include "validator.h"
using namespace std;

const int MAX_N = 1000;
const int MAX_COORD = 1e6;
const double MAX_D = 1e5;

void run() {
	int n = Int(2, Arg("maxn", MAX_N));
	Space();
	double d = Float(0.001, MAX_D, 3);
	Endl();

	int lastx = -1;
	for (int i = 0; i < n; i++) {
		int x = Int(lastx+1, MAX_COORD);
		lastx = x;
		Space();
		Int(0, MAX_COORD);
		Endl();
	}
}

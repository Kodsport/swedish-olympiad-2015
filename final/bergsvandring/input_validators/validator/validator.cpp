#include <bits/stdc++.h>
#include "validator.h"


using namespace std;


void run() {
	int n = Int(1, Arg("maxn"));
	Space();
	double d = Float(0, 1e5, 6);
	assert(d>0);
	Endl();
	double lastx = -1;
	for (int i = 0; i < n; i++)
	{
		double x = Float(lastx, 1e6, 6);
		assert(x>lastx);
		lastx = x;
		Space();
		double y = Float(0, 1e6, 6);
		Endl();
	}

	Eof();
}

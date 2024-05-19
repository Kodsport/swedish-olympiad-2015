#include <bits/stdc++.h>
#include "validator.h"


using namespace std;


void run() {
	Arg("valid", "no");
	// I can't bother to check this..
	int n = Int(1, Arg("maxN"));
	Endl();
	for (int i = 0; i < n; i++)
	{
		Int(1, n);
		Endl();
	}

	int q = Int(1, Arg("maxQ"));
	Endl();
	
	for (int i = 0; i < q; i++)
	{
		int a = Int(1, n);
		Space();
		int b = Int(1,n);
		Endl();
		assert(a!=b);
	}

	Eof();
}

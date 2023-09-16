#include "validator.h"

void run() {
    int n = Int(2, Arg("max_n"));
    Endl();
    int x = Arg("max_v");
    auto v = SpacedInts(n, 1, x);

    int sum = 0;

    for (auto& e : v)sum += e;

    assert(sum <= 1000);

	Eof();
}
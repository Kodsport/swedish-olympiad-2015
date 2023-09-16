#include "validator.h"

void run() {
    int n = Int(2, Arg("max_n"));
    Endl();
    auto v = SpacedInts(n, 1, 1000);

    int sum = 0;

    for (auto& e : v)sum += e;

    assert(sum <= 1000);

	Eof();
}
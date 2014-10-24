/*
 * Solution to problem 'apples' by Johan Sannemo.
 * Time complexity: O(1)
 * Expected score: 50
 *
 *
 * Copyright (c) 2014, Johan Sannemo
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * 
 */

#include <algorithm>
#include <cstdio>

using namespace std;

int main(){
	int n, k;
	scanf("%d%d", &n, &k);
	int num;
	scanf("%d", &num);
	printf("%d\n", num * k);
}

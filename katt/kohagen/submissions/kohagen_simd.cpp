// O(N^4)-lösning med SIMD, ger 100 poäng.
#ifndef __SSE__
#pragma GCC target ("mmx,sse,sse2")
#define __SSE__
#define __SSE2__
#define __MMX__
#endif
#include <bits/stdc++.h>
#include "xmmintrin.h"
#include "emmintrin.h"
using namespace std;

static const double inf = 4.1;
static vector<double*> area;
static double best_ar, min_area;
static short best_ar_f;

short tof(double d) { return short(floor(d * 4096)); }

static void testl(int i, int j, int k, int l) {
	double a = area[i][j] + area[j][k] + area[k][l] - area[i][l];
	if (min_area <= a && a <= best_ar)
		best_ar = a, best_ar_f = tof(a) + 1;
}

int main() {
	cin.sync_with_stdio(false);
	int N;
	double real_min_area, RADIUS;
	cin >> N >> real_min_area >> RADIUS;
	vector<double> ang(N);
	for(int i = 0; i < N; i++)
		cin >> ang[i], ang[i] *= M_PI / 180;
	double mult = 2.0 / RADIUS / RADIUS;
	min_area = real_min_area * mult;

	sort(ang.rbegin(), ang.rend());

	area.resize(N);
	vector<short*> farea(N);
	for(int i = 0; i < N; i++) {
		area[i] = new double[N];
		farea[i] = new short[N + 20]();
		while ((long)farea[i] % 16 != 0) ++farea[i];
		for(int j = 0; j < i; ++j) {
			area[i][j] = sin(ang[j] - ang[i]);
			farea[i][j] = tof(area[i][j]);
		}
	}

	short min_ar_f = tof(min(min_area, inf)) - 2;

	best_ar = inf;
	best_ar_f = tof(inf) + 1;
	for (int i = N; i --> 0;)
		for (int j = i; j --> 0;)
			for (int k = j; k --> 0;) {
				short base = farea[i][j] + farea[j][k];
				__m128i min_ar_s = _mm_set1_epi16(min_ar_f - base);
				__m128i best_ar_s = _mm_set1_epi16(best_ar_f - base);
				__m128i *fark = (__m128i*)farea[k], *fari = (__m128i*)farea[i];

				for (int l = 0; 8*l < k; ++l) {
					__m128i farkl_s = fark[l];
					__m128i faril_s = fari[l];
					__m128i val_s = _mm_sub_epi16(farkl_s, faril_s);
					int oob_mask = _mm_movemask_epi8(_mm_or_si128(
					            _mm_cmpgt_epi16(min_ar_s, val_s),
					            _mm_cmpgt_epi16(val_s, best_ar_s)));
					if (oob_mask != 0xffff) {
						int to2 = min(8*(l+1), k);
						for (int t = 8*l; t < to2; ++t) testl(i,j,k,t);
					}
				}
			}
	if (best_ar == inf) cout << -1 << endl;
	else cout << setprecision(13) << fixed << (best_ar / mult) << endl;
}

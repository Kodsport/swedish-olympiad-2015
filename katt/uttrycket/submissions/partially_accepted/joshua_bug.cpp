#undef _GLIBCXX_DEBUG                // disable run-time bound checking, etc
#pragma GCC optimize("Ofast,inline") // Ofast = O3,fast-math,allow-store-data-races,no-protect-parens
#pragma GCC optimize ("unroll-loops")

#pragma GCC target("bmi,bmi2,lzcnt,popcnt")                      // bit manipulation
#pragma GCC target("movbe")                                      // byte swap
#pragma GCC target("aes,pclmul,rdrnd")                           // encryption
#pragma GCC target("avx,avx2,f16c,fma,sse3,ssse3,sse4.1,sse4.2") // SIMD

#include <bits/stdc++.h>
//#include <bits/extc++.h>

using namespace std;

#define enablell 1

#define ll long long
#if enablell
#define int ll
#define inf LLONG_MAX
#define float double
#else
#define inf int(2e9)
#endif
#define vi vector<int>
#define vvi vector<vi>
#define vvvi vector<vvi>
#define vvvvi vector<vvvi>
#define vb vector<bool>
#define vvb vector<vb>
#define vvvb vector<vvb>
#define p2 pair<int, int>
#define vp2 vector<p2>
#define vvp2 vector<vp2>
#define vvvp2 vector<vvp2>
#define p3 tuple<int,int,int>
#define vp3 vector<p3>
#define vvp3 vector<vp3>
#define vvvp3 vector<vvp3>
#define p4 tuple<int,int,int,int>
#define vp4 vector<p4>

#define read(a) cin >> a
#define read2(a,b) cin >> a >> b
#define read3(a,b,c) cin >> a >> b >> c
#define write(a) cout << (a) << "\n"
#define quit cout << endl; _Exit(0);
#define dread(type, a) type a; cin >> a
#define dread2(type, a, b) dread(type, a); dread(type, b)
#define dread3(type, a, b, c) dread2(type, a, b); dread(type, c)
#define dread4(type, a, b, c, d) dread3(type, a, b, c); dread(type, d)
#define dread5(type, a, b, c, d, e) dread4(type, a, b, c, d); dread(type, e)
#ifdef _DEBUG
#define noop cout << "";
#define deb __debugbreak();
#define debassert(expr) if (!(expr)) deb;
#define debif(expr) if(expr) deb;
#else
#define noop ;
#define deb ;
#define debassert(expr) ;
#define debif(expr) ;
#endif

#define rep(i, high) for (int i = 0; i < high; i++)
#define repp(i, low, high) for (int i = low; i < high; i++)
#define repe(i, container) for (auto& i : container)
#define per(i, high) for (int i = high-1; i >= 0; i--)
#define perr(i, low, high) for (int i = high-1; i >= low; i--)

#define readvector(type, name, size) vector<type> name(size); rep(i,size) {dread(type,temp); name[i]=temp;}
#define all(a) begin(a),end(a)
#define setcontains(set, x) (set.find(x) != set.end())
#define stringcontains(str, x) (str.find(x) != string::npos)
#define within(a, b, c, d) (a >= 0 && a < b && c >= 0 && c < d)
#define sz(container) ((int)container.size())
#define mp(a,b) (make_pair(a,b))
#define first(a) (*begin(a))
#define indexpair(p, i) ((i==0)?p.first:p.second)
#define chmax(a,b) ((a)=max((a),b))
#define chmin(a,b) ((a)=min((a),b))

#define ceildiv(x,y) ((x + y - 1) / y)
#define fract(a) (a-floor(a))

auto Start = chrono::high_resolution_clock::now();
#define elapsedmillis() (chrono::duration_cast<chrono::milliseconds>(chrono::high_resolution_clock::now() - Start).count())
#define rununtil(time) if (elapsedmillis() >= time) break;

inline void fast() { ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL); }
template <typename T, typename U> inline void operator+=(std::pair<T, U>& l, const std::pair<T, U>& r) { l = { l.first + r.first,l.second + r.second }; }
template <typename T> inline int sgn(T val) { return (T(0) < val) - (val < T(0)); }
template <typename Out> inline void split(const string& s, char delim, Out result) { istringstream iss(s); string item; while (getline(iss, item, delim)) { *result++ = item; } }
inline vector<string> split(const string& s, char delim) { vector<string> elems; split(s, delim, back_inserter(elems)); return elems; }

inline int applyoperation(int a, int b, int op)
{
    switch (op)
    {
    case '*':
        return a * b;
    case '+':
        return a + b;
    case '-':
        return a - b;
    default:
        deb;
    }
}

p2 solve(vvp2& dp, vvb& dpd, vi& nums, vi& ops, int a, int b)
{
    if (a == b) return { nums[a],nums[a] };

    if (!dpd[a][b])
    {
        dpd[a][b] = true;
        
        vi values;
        p2 r = solve(dp, dpd, nums, ops, a + 1, b);
        p2 l = solve(dp, dpd, nums, ops, a, b-1);
        values.emplace_back(applyoperation(nums[a], r.first, ops[a]));
        values.emplace_back(applyoperation(nums[a], r.second, ops[a]));
        values.emplace_back(applyoperation(l.first, nums[b], ops[b-1]));
        values.emplace_back(applyoperation(l.second, nums[b], ops[b-1]));
        chmax(dp[a][b].first, *max_element(all(values)));
        chmin(dp[a][b].second, *min_element(all(values)));

        repp(i, a+1, b)
        {
            
            p2 left = solve(dp, dpd, nums, ops, a, i-1);
            p2 right = solve(dp, dpd, nums, ops, i+1, b);
            rep(j, 2)
            {
                rep(k, 2)
                {
                    values.emplace_back(applyoperation(applyoperation(indexpair(left, j), nums[i], ops[i-1]), indexpair(right,k),ops[i]));
                    values.emplace_back(applyoperation(indexpair(left,j), applyoperation(nums[i], indexpair(right, k), ops[i]), ops[i-1]));
                }
            }
            chmax(dp[a][b].first, *max_element(all(values)));
            chmin(dp[a][b].second, *min_element(all(values)));
            values = vi();
        }
       
    }


    return dp[a][b];
}

int32_t main()
{
    fast();

#if 0
    ifstream cin("C:\\Users\\Matis\\source\\repos\\Comp prog\\x64\\Debug\\in.txt");
#endif

    dread(string, expression);
    //string expression = "2*3+4*5";

    vi nums;
    vi ops;

    string num = "";
    rep(i, sz(expression))
    {
        if (expression[i] == '+'|| expression[i]=='*'|| expression[i]=='-')
        {
            if (num.size()) nums.emplace_back(stoi(num));
            num = "";
            ops.emplace_back(expression[i]);
        }
        else
        {
            num += string(1, expression[i]);
        }
    }
    if (num.size()) nums.emplace_back(stoi(num));

    vvb dpd(nums.size(), vb(nums.size()));
    vvp2 dp(nums.size(), vp2(nums.size(), p2(-inf,inf)));

    cout << solve(dp,dpd,nums,ops,0,nums.size()-1).first;


    quit;
}

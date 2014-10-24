#include <iostream>
#include <vector>
#include <algorithm>
 
using namespace std;
 
 
int n;
 
 
int go(int y,int x, int plockat, int k, vector<vector<int>> arr)
{
    k--;
    if (k<0)
        return plockat;
    
    
    if (x < 0 ||  x >= n)
        return 0;
    
    if(y<0 || y> 1)
        return 0;
    
    
    
    plockat += arr[y][x];
    arr[y][x] = 0;
    
    int best = 0;
    
    if(y == 0)
    {
        best = go(0,x+1, plockat, k, arr);
        best = max(best, go(0,x-1, plockat, k, arr));
        best = max(best, go(1,x, plockat, k, arr));
        
    }else
    {
        best = go(1,x+1, plockat, k, arr);
        best = max(best, go(1,x-1, plockat, k, arr));
        best = max(best, go(0,x, plockat, k, arr));
    }
 
    return best;
}
 
 
int main()
{
    
    int k;
    
    cin >> n >> k;
    
    
    vector<vector<int>> arr(2,vector<int>(n));
    
    
    
    for (int i = 0; i<n; i++) {
        int t;
        cin >> t;
        
        arr[0][i] = t;
 
    }
    
    for (int i = 0; i<n; i++) {
        int t;
        cin >> t;
        
        arr[1][i] = t;
 
    }
    
    
    cout<<go(1,0, 0, k, arr);
    
}

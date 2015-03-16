// David Wärns lösning
#include <iostream>
using namespace std;
int main(){
    int n,x,l;
    cin >> n >> x >> x;
    cout << (x==1?n:1) << endl;
    for(cin >> l; l!=-1; cin >> l){
        cout << l+(l>x?-1:1) << endl;
    }
}

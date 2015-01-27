#include <stdio.h>
#include <string.h>

//This is a general solution to the 2D version of the game modified to read 1D input.

int SCORE(int n) { return 2*n-5; }

char s[20][100][100], org[100][101];
int pos[20][100], flag[100][100];
int ma,R,C,N,tot,mnm;
char t[101];

int match(int nr, int r, int c) {
  int i,k;
  k=1;
  for(i=c-1;i>=0;i--) if (s[nr][r][c]==s[nr][r][i]) k++; else break;
  for(i=c+1;i<C;i++) if (s[nr][r][c]==s[nr][r][i]) k++; else break;
  if(k>=3) return 1;
  k=1;
  for(i=r-1;i>=0;i--) if (s[nr][r][c]==s[nr][i][c]) k++; else break;
  for(i=r+1;i<R;i++) if (s[nr][r][c]==s[nr][i][c]) k++; else break;
  if(k>=3) return 1;
  return 0;
}

void MLX(int nr, int score) {
  int r,c,i,n, found,nm;
  char tmp;
  tot++;
  if(nr>0) { //Copy current state
    for(c=0;c<C;c++) {
      for(r=0;r<R;r++) s[nr][r][c]=s[nr-1][r][c];
      pos[nr][c]=pos[nr-1][c];
    }
  }
  //Crush
  while(1) {
    for(r=0;r<R;r++) for(c=0;c<C;c++) flag[r][c]=0;
    found=0;
    for(r=0;r<R;r++) {
      n=1;
      for(c=1;c<=C;c++) {
	if(c<C && s[nr][r][c]==s[nr][r][c-1]) n++;
	else {
	  if(n>=3) {
	    for(i=c-1;i>=c-n;i--) flag[r][i]=1;
	    score+=SCORE(n); 
	    found=1;
	  }
	  n=1;
	}
      }
    }
    for(c=0;c<C;c++) {
      n=1;
      for(r=1;r<=R;r++) {
	if(r<R && s[nr][r][c]==s[nr][r-1][c]) n++;
	else {
	  if(n>=3) {
	    for(i=r-1;i>=r-n;i--) flag[i][c]=1;
	    score+=SCORE(n);  
	    found=1;
	  }
	  n=1;
	}
      }
    }
    if(!found) break;
    for(c=0;c<C;c++) {
      i=0;
      for(r=R-1;r>=0;r--) if(!flag[r][c]) t[i++]=s[nr][r][c];
      while(i<R) {
	t[i++]=org[R-1-pos[nr][c]][c];
	pos[nr][c]=(pos[nr][c]+1)%R;
      }
      for(i=0;i<R;i++) s[nr][i][c]=t[R-1-i];
    } 
  }
  if(score>ma) ma=score;
  //for(i=0;i<nr;i++) printf("  ");  printf("%d\n", score);   //Graphical description of recursive tree with points  
  if(nr==N) return;
  nm=0;
  for(r=0;r<R;r++) for(c=0;c<C-1;c++) if(s[nr][r][c]!=s[nr][r][c+1]) {
      tmp=s[nr][r][c];
      s[nr][r][c]=s[nr][r][c+1];
      s[nr][r][c+1]=tmp;
      if(match(nr,r,c)||match(nr,r,c+1)) { nm++; MLX(nr+1,score); }
      tmp=s[nr][r][c];
      s[nr][r][c]=s[nr][r][c+1];
      s[nr][r][c+1]=tmp;
      }
  for(r=0;r<R-1;r++) for(c=0;c<C;c++) if(s[nr][r][c]!=s[nr][r+1][c]) {
      tmp=s[nr][r][c];
      s[nr][r][c]=s[nr][r+1][c];
      s[nr][r+1][c]=tmp;
      if(match(nr,r,c)||match(nr,r+1,c)) { nm++; MLX(nr+1,score); }
      tmp=s[nr][r][c];
      s[nr][r][c]=s[nr][r+1][c];
      s[nr][r+1][c]=tmp;
      }
  if(nm>mnm) mnm=nm;
}


int main() {
  int r,c;
  char buf[101];

  //Interface reading input in 1D format
  scanf("%d %s", &N, buf);
  R=strlen(buf);
  C=1;
  for(r=0;r<R;r++) org[r][0]=buf[R-1-r];

  //General program
  for(r=0;r<R;r++) for(c=0;c<C;c++) s[0][r][c]=org[r][c];
  ma=0;
  mnm=0;
  tot=0;
  for(c=0;c<C;c++) pos[0][c]=0;
  MLX(0,0);
  printf("%d\n", ma);
  return 0;
}

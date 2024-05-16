import java.util.*;
import java.io.*;

public class Backtrack {
  public static void main(String [] args) throws IOException {
    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
    PrintWriter out = new PrintWriter(System.out);

    String url = in.readLine();
    int N = Integer.parseInt(in.readLine());
    int[] left = new int[26];
    for (int i = 0; i < N; i++) {
      String sub = in.readLine();
      for (int j = 0; j < sub.length(); j++) {
        left[sub.charAt(j) - 'a'] = sub.length() - 1;
      }
    }
    out.println(rec(0, url.toCharArray(), left) - 1);

    in.close();
    out.close();
  }

  public static int rec(int pos, char[] url, int[] left) {
    if (pos == url.length) return 1;
    int res = rec(pos+1, url, left);
    if (url[pos] != '.') {
      int a = url[pos] - 'a';
      if (left[a] > 0) {
        left[a]--;
        res += (left[a]+1)*rec(pos+1, url, left);
        left[a]++;
      }
    }
    return res;
  }

  static class Edge {
    int to;
    Edge next;
    public Edge(int to, Edge next) {
      this.to = to;
      this.next = next;
    }
  }
}

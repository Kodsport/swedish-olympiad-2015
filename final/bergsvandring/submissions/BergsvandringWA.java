import java.util.*;
import java.io.*;

public class BergsvandringWA {
  public static void main(String[] args) throws IOException {
    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
    PrintWriter out = new PrintWriter(System.out);

    StringTokenizer st = new StringTokenizer(in.readLine());
    int n = Integer.parseInt(st.nextToken());
    double d = Double.parseDouble(st.nextToken());
    double [] x = new double[n], y = new double[n];
    for (int i = 0; i < n; i++) {
      st = new StringTokenizer(in.readLine());
      x[i] = Double.parseDouble(st.nextToken());
      y[i] = Double.parseDouble(st.nextToken());
    }
    double[] dp = new double[n];
    Arrays.fill(dp, Double.POSITIVE_INFINITY);
    dp[0] = 0;
    for (int i = 0; i < n; i++) {
      for (int j = i+1; j < n; j++) {
        double dx = x[j] - x[i], dy = y[j] - y[i];
        double angle = dy / dx;
        if (Math.abs(angle) <= d) {
          dp[j] = Math.min(dp[j], dp[i] + (j == i+1 ? 0 : Math.sqrt(dx*dx+dy*dy)));
        }
      }
    }
    out.println(dp[n-1] == Double.POSITIVE_INFINITY ? "-1" : dp[n-1]);

    in.close();
    out.close();
  }
}

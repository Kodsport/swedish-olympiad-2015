// https://po.kattis.com/submissions/13427/
// Jimmys solution som for 40 men bord fo 0

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Pokemon {
  public static class Kattio extends PrintWriter {
      public Kattio(InputStream i) {
          super(new BufferedOutputStream(System.out));
          r = new BufferedReader(new InputStreamReader(i));
      }

      public Kattio(InputStream i, OutputStream o) {
          super(new BufferedOutputStream(o));
          r = new BufferedReader(new InputStreamReader(i));
      }

      public boolean hasMoreTokens() {
          return peekToken() != null;
      }

      public int getInt() {
          return Integer.parseInt(nextToken());
      }

      public double getDouble() {
          return Double.parseDouble(nextToken());
      }

      public long getLong() {
          return Long.parseLong(nextToken());
      }

      public String getWord() {
          return nextToken();
      }


      private BufferedReader r;
      private String line;
      private StringTokenizer st;
      private String token;

      private String peekToken() {
          if (token == null)
              try {
                  while (st == null || !st.hasMoreTokens()) {
                      line = r.readLine();
                      if (line == null) return null;
                      st = new StringTokenizer(line);
                  }
                  token = st.nextToken();
              } catch (IOException e) {
              }
          return token;
      }

      private String nextToken() {
          String ans = peekToken();
          token = null;
          return ans;
      }
  }

    public static class Match {
        public int a, b;

        public Match(int a, int b) {
            this.a = a;
            this.b = b;
        }
    }


    public static void main(String args[]) {
        Kattio io = new Kattio(System.in, System.out);
        int n = io.getInt(), m = io.getInt();
        ArrayList<Match> matches = new ArrayList<Match>();
        ArrayList<ArrayList<Integer>> loseEdges = new ArrayList<ArrayList<Integer>>();
        for (int i = 0; i <= n; i++) {
            loseEdges.add(new ArrayList<Integer>());
        }

        double[] money = new double[n + 1];
        for (int i = 1; i <= n; i++) {
            money[i] = 100;
        }

        for (int i = 0; i < m; i++) {
            Match match = new Match(io.getInt(), io.getInt());
            matches.add(match);
            loseEdges.get(match.b).add(match.a);
        }

        final double eff[] = new double[n+1];
        eff[1] = 1.0;

        for (int i = 2; i <= n; i++) {
            double sum = 0.0;
            for (int j : loseEdges.get(i)) {
                sum += eff[j] / 2.0;
            }
            eff[i] = sum;
//            io.println(i + ": " + eff[i]);
        }

        for (int i = n; i >= 2; i--) {
            ArrayList<Integer> edges = loseEdges.get(i);
            Collections.sort(edges, new Comparator<Integer>() {
                @Override
                public int compare(Integer o1, Integer o2) {
                    return Double.compare(eff[o2], eff[o1]);
                }
            });
            for (int j : edges) {
                money[j] += money[i] / 2.0;
                money[i] /= 2.0;
            }
        }

        io.println(money[1]);

        io.close();
    }


}

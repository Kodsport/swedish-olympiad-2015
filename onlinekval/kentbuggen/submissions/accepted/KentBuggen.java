import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class KentBuggen {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int lines = in.nextInt();
        int nrMult = 0;
        Set<String> artists = new HashSet<String>();
        Set<String> artistsMult = new HashSet<String>();

        String tmpArt = "";
        for (int i = 0; i < lines; i++) {
            tmpArt = in.next().toLowerCase().trim();
            if (artists.contains(tmpArt) && !artistsMult.contains(tmpArt)) {
                nrMult++;
                artistsMult.add(tmpArt);
            } else {
                artists.add(tmpArt);
            }
        }
        System.out.println(nrMult);
        in.close();
    }

}

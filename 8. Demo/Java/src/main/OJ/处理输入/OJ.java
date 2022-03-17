package 处理输入;

import java.util.Arrays;
import java.util.Scanner;

public class OJ {
    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        String line1 = cin.nextLine();
        String[] line2 = cin.nextLine().split(" ");
        System.out.println(line1);
        System.out.println(Arrays.toString(line2));

        
    }
}

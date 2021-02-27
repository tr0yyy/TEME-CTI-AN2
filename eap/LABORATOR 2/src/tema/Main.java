package tema;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ///reversestringii
        String sir = scanner.next();
        int k = scanner.nextInt();
        ReverseStringII rs = new ReverseStringII();
        System.out.println(rs.reverseString(sir, k));
        ///palindrom
        int numar = scanner.nextInt();
        Palindrom x = new Palindrom();
        System.out.println(x.IsPalindrom(numar));*/
        ///reverseinteger
        int intreg = scanner.nextInt();
        ReverseInteger y = new ReverseInteger();
        System.out.println(y.reverse(intreg));
    }
}
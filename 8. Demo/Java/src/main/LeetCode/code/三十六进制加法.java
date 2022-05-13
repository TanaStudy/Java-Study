package code;

// 32进制类型字符串相加。用'0'-'9'表示0-9，'a'-'z'表示10-35, 计算两个字符串类型相加结果。
public class 三十六进制加法 {
    //https://leetcode.cn/circle/discuss/I8NZUx/
    public static char get36Char(int n) {
        if(n <= 9) return (char) (n + '0');
        else return (char) (n - 10 + 'a');
    }
    public static int get36Int(char ch) {
        if('0' <= ch && ch <='9') return ch - '0';
        else return ch - 'a' + 10;
    }
    public static String add36Strings(String num1, String num2) {
        int carry = 0;
        int i = num1.length() - 1, j = num2.length() - 1;
        StringBuilder res = new StringBuilder();
        while (i >= 0 || j >= 0 || carry != 0) {
            int x = i >= 0 ? get36Int(num1.charAt(i)) : 0;
            int y = j >= 0 ? get36Int(num2.charAt(j)) : 0;
            int temp = x + y + carry;
            res.append(get36Char(temp % 36));
            carry = temp / 36;
            i--;
            j--;
        }
        return res.reverse().toString();
    }
    // 62进制类型字符串相加。用'0'-'9'表示0-9，'a'-'z'表示10-35, 'A'-'Z'表示36-61，计算两个字符串类型相加结果。
    public static char get64Char(int n) {
        if(n <= 9) return (char) (n + '0');
        else if(n <= 35) return (char) (n - 10 + 'a');
        else return (char) (n - 36 + 'A');
    }
    public static int get64Int(char ch) {
        if('0' <= ch && ch <='9') return ch - '0';
        else if('a' <= ch && ch <= 'z') return ch - 'a' + 10;
        else return ch - 'A' + 36;
    }
    public static String add64Strings(String num1, String num2) {
        int carry = 0;
        int i = num1.length() - 1, j = num2.length() - 1;
        StringBuilder res = new StringBuilder();
        while (i >= 0 || j >= 0 || carry != 0) {
            int x = i >= 0 ? get64Int(num1.charAt(i)) : 0;
            int y = j >= 0 ? get64Int(num2.charAt(j)) : 0;
            int temp = x + y + carry;
            res.append(get64Char(temp % 64));
            carry = temp / 64;
            i--;
            j--;
        }
        return res.reverse().toString();
    }

    public static void main(String[] args) {
        String num1 = "A";
        String num2 = "a";
        // System.out.println(add36Strings(num1,num2));
        System.out.println(add64Strings(num1,num2));
    }

}

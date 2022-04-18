package leetcode.editor.cn;

//给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。 
//
// 注意：不能使用任何内置的 BigInteger 库或直接将输入转换为整数。 
//
// 
//
// 示例 1: 
//
// 
//输入: num1 = "2", num2 = "3"
//输出: "6" 
//
// 示例 2: 
//
// 
//输入: num1 = "123", num2 = "456"
//输出: "56088" 
//
// 
//
// 提示： 
//
// 
// 1 <= num1.length, num2.length <= 200 
// num1 和 num2 只能由数字组成。 
// num1 和 num2 都不包含任何前导零，除了数字0本身。 
// 
// Related Topics 数学 字符串 模拟 👍 904 👎 0

public class Q43字符串相乘{
	public static void main(String[] args) {
		Solution solution = new Q43字符串相乘().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法一、先不进位，保留答案，最后再相加，acwing题解
// https://www.acwing.com/activity/content/code/content/368823/
class Solution {
    public String multiply(String num1, String num2) {
		int n = num1.length(), m = num2.length();
		int[] a = new int[n];
		int[] b = new int[m];

		for(int i = n - 1; i >= 0; i--){
			a[n - i - 1] = num1.charAt(i) - '0';
		}
		for(int i = m - 1; i >= 0; i--){
			b[m - i - 1] = num2.charAt(i) - '0';
		}
		// 第i * j位存在 i + j位上
		int[] c = new int[n + m];
		for(int i = 0; i < n; i++){
			for(int j = 0; j < m; j++){
				c[i + j] += a[i] * b[j];
			}
		}
		int carry = 0;
		for(int i = 0; i < n + m - 1 || carry != 0; i ++){
			int t = c[i] + carry;
			c[i] = t % 10;
			carry = t / 10;
		}
		// 去除前缀0
		int k = n + m - 1;
		while (k > 0 && c[k] == 0){
			k--;
		}
		StringBuilder res = new StringBuilder();
		while (k >= 0){
			res.append(c[k--]);
		}
		return res.toString();
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

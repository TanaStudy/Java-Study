package leetcode.editor.cn;

//给你两个二进制字符串，返回它们的和（用二进制表示）。 
//
// 输入为 非空 字符串且只包含数字 1 和 0。 
//
// 
//
// 示例 1: 
//
// 输入: a = "11", b = "1"
//输出: "100" 
//
// 示例 2: 
//
// 输入: a = "1010", b = "1011"
//输出: "10101" 
//
// 
//
// 提示： 
//
// 
// 每个字符串仅由字符 '0' 或 '1' 组成。 
// 1 <= a.length, b.length <= 10^4 
// 字符串如果不是 "0" ，就都不含前导零。 
// 
// Related Topics 位运算 数学 字符串 模拟 👍 807 👎 0

public class Q67二进制求和{
	public static void main(String[] args) {
		Solution solution = new Q67二进制求和().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/add-binary/solution/hua-jie-suan-fa-67-er-jin-zhi-qiu-he-by-guanpengch/
// 两个字符串较短的用 0 补齐，然后从末尾进行遍历计算。
class Solution {
    public String addBinary(String a, String b) {
		StringBuffer ans = new StringBuffer();
		int ca = 0;
		for(int i = a.length() - 1, j = b.length() - 1; i >= 0 || j >= 0; i--, j--){
			int sum = ca;
			sum += i >= 0 ? a.charAt(i) - '0' : 0;
			sum += j >= 0 ? b.charAt(j) - '0' : 0;
			ans.append(sum % 2);
			ca = sum / 2;
		}
		ans.append(ca == 1 ? ca : "");
		return ans.reverse().toString();
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

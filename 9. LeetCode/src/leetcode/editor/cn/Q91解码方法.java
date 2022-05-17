package leetcode.editor.cn;

//一条包含字母 A-Z 的消息通过以下映射进行了 编码 ： 
//
// 
//'A' -> "1"
//'B' -> "2"
//...
//'Z' -> "26" 
//
// 要 解码 已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为： 
//
// 
// "AAJF" ，将消息分组为 (1 1 10 6) 
// "KJF" ，将消息分组为 (11 10 6) 
// 
//
// 注意，消息不能分组为 (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。 
//
// 给你一个只含数字的 非空 字符串 s ，请计算并返回 解码 方法的 总数 。 
//
// 题目数据保证答案肯定是一个 32 位 的整数。 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "12"
//输出：2
//解释：它可以解码为 "AB"（1 2）或者 "L"（12）。
// 
//
// 示例 2： 
//
// 
//输入：s = "226"
//输出：3
//解释：它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
// 
//
// 示例 3： 
//
// 
//输入：s = "0"
//输出：0
//解释：没有字符映射到以 0 开头的数字。
//含有 0 的有效映射是 'J' -> "10" 和 'T'-> "20" 。
//由于没有字符，因此没有有效的方法对此进行解码，因为所有数字都需要映射。
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 100 
// s 只包含数字，并且可能包含前导零。 
// 
// Related Topics 字符串 动态规划 👍 1174 👎 0

public class Q91解码方法{
	public static void main(String[] args) {
		Solution solution = new Q91解码方法().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 动态规划,转移方差如下
// f[i]=f[i−1],1⩽a≤9
// f[i]=f[i−2],10⩽b⩽26
// f[i]=f[i−1]+f[i−2],1⩽a≤9,10⩽b⩽26
// https://leetcode.cn/problems/decode-ways/solution/gong-shui-san-xie-gen-ju-shu-ju-fan-wei-ug3dd/
class Solution {
    public int numDecodings(String s) {
		int n = s.length();
		s = " " + s;
		char[] cs = s.toCharArray();
		int[] f = new int[n + 1];
		f[0] = 1;
		for(int i = 1; i <= n; i++){
			int a = cs[i] - '0';
			int b = (cs[i - 1] - '0') * 10 + (cs[i] - '0');

			if(1 <= a && a <= 9){
				f[i] = f[i - 1];
			}
			if(10 <= b && b <= 26){
				f[i] += f[i - 2];
			}
		}
		return f[n];
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。 
//
// 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。 
//
// 
// 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。 
// 
//
// 两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。 
//
// 
//
// 示例 1： 
//
// 
//输入：text1 = "abcde", text2 = "ace" 
//输出：3  
//解释：最长公共子序列是 "ace" ，它的长度为 3 。
// 
//
// 示例 2： 
//
// 
//输入：text1 = "abc", text2 = "abc"
//输出：3
//解释：最长公共子序列是 "abc" ，它的长度为 3 。
// 
//
// 示例 3： 
//
// 
//输入：text1 = "abc", text2 = "def"
//输出：0
//解释：两个字符串没有公共子序列，返回 0 。
// 
//
// 
//
// 提示： 
//
// 
// 1 <= text1.length, text2.length <= 1000 
// text1 和 text2 仅由小写英文字符组成。 
// 
// Related Topics 字符串 动态规划 👍 917 👎 0

public class Q1143最长公共子序列{
	public static void main(String[] args) {
		Solution solution = new Q1143最长公共子序列().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 二维动态规划
// https://leetcode-cn.com/problems/longest-common-subsequence/solution/zui-chang-gong-gong-zi-xu-lie-tu-jie-dpz-6mvz/
class Solution {
    public int longestCommonSubsequence(String text1, String text2) {
		int n = text1.length(), m = text2.length();
		int[][] f = new int[n + 1][m + 1];
		for(int i = 1; i <= n; i++){
			for(int j = 1; j <= m; j++){
				if(text1.charAt(i - 1) == text2.charAt(j - 1)){
					f[i][j] = f[i - 1][j - 1] + 1;
				}else {
					f[i][j] = Math.max(f[i - 1][j], f[i][j - 1]);
				}
			}
		}
		return f[n][m];
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

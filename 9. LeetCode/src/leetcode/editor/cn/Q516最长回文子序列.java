package leetcode.editor.cn;

//给你一个字符串 s ，找出其中最长的回文子序列，并返回该序列的长度。 
//
// 子序列定义为：不改变剩余字符顺序的情况下，删除某些字符或者不删除任何字符形成的一个序列。 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "bbbab"
//输出：4
//解释：一个可能的最长回文子序列为 "bbbb" 。
// 
//
// 示例 2： 
//
// 
//输入：s = "cbbd"
//输出：2
//解释：一个可能的最长回文子序列为 "bb" 。
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 1000 
// s 仅由小写英文字母组成 
// 
// Related Topics 字符串 动态规划 👍 748 👎 0

public class Q516最长回文子序列{
	public static void main(String[] args) {
		Solution solution = new Q516最长回文子序列().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 动态规划
// f[i][j] 表示 s 的第 i 个字符到第 j 个字符组成的子串中，最长的回文序列长度是多少
// 如果 s 的第 i 个字符和第 j 个字符相同的话 f[i][j] = f[i + 1][j - 1] + 2
// 如果 s 的第 i 个字符和第 j 个字符不同的话 f[i][j] = max(f[i + 1][j], f[i][j - 1])

// https://leetcode-cn.com/problems/longest-palindromic-subsequence/solution/dong-tai-gui-hua-si-yao-su-by-a380922457-3/
class Solution {
    public int longestPalindromeSubseq(String s) {
		int n = s.length();
		int[][] dp = new int[n][n];

		for(int i = n - 1; i >= 0; i--){
			dp[i][i] = 1;
			for(int j = i + 1; j < n; j++){
				if(s.charAt(i) == s.charAt(j)){
					dp[i][j] = dp[i + 1][j - 1] + 2;
				}else {
					dp[i][j] = Math.max(dp[i + 1][j], dp[i][j - 1]);
				}
			}
		}
		return dp[0][n - 1];
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

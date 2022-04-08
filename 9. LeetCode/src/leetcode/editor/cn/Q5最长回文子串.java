package leetcode.editor.cn;

//给你一个字符串 s，找到 s 中最长的回文子串。 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "babad"
//输出："bab"
//解释："aba" 同样是符合题意的答案。
// 
//
// 示例 2： 
//
// 
//输入：s = "cbbd"
//输出："bb"
// 
//
// 示例 3： 
//
// 
//输入：s = "a"
//输出："a"
// 
//
// 示例 4： 
//
// 
//输入：s = "ac"
//输出："a"
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 1000 
// s 仅由数字和英文字母（大写和/或小写）组成 
// 
// Related Topics 字符串 动态规划 👍 4378 👎 0

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Q5最长回文子串{
	public static void main(String[] args) {
		Solution solution = new Q5最长回文子串().new Solution();
		String s = "abcccbd";
		System.out.println(solution.longestPalindrome(s));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、动态规划
// https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zui-chang-hui-wen-zi-chuan-by-leetcode-solution/
class Solution {
    public String longestPalindrome(String s) {
		int len = s.length();
		if(len < 2){
			return s;
		}

		int maxLen = 1;
		int begin = 0;

		boolean[][] dp = new boolean[len][len];

		for(int i = 0; i < len; i++){
			dp[i][i] = true;
		}

		char[] charArray = s.toCharArray();

		for(int L = 2; L <= len; L++){
			for(int i = 0; i < len; i++){
				int j = L + i - 1;
				if(j >= len){
					break;
				}

				if(charArray[i] != charArray[j]){
					dp[i][j] = false;
				}else {
					if(j - i < 3){
						dp[i][j] = true;
					}else {
						dp[i][j] = dp[i + 1][j - 1];
					}
				}

				if(dp[i][j] && j - i + 1 > maxLen){
					maxLen = j - i + 1;
					begin = i;
				}
			}
		}
		return s.substring(begin, begin + maxLen);
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、中心扩展
// https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zhong-xin-kuo-san-fa-he-dong-tai-gui-hua-by-reedfa/
class Solution1 {
	public String longestPalindrome(String s) {
		int strLen = s.length();
		int maxLeft = 0, maxRight = 0, maxLen = 0;
		for(int i = 0;i < strLen;i++){
			int left = i - 1;
			int right = i + 1;
			int len;
			while(left >= 0 && s.charAt(left) == s.charAt(i)){
				left--;
			}
			while (right < strLen && s.charAt(right) == s.charAt(i)){
				right++;
			}
			while (left >= 0 && right < strLen && s.charAt(right) == s.charAt(left)){
				left--;
				right++;
			}
			len = right-left-1;
			if(len > maxLen){
				maxLeft = left + 1;
				maxRight = right - 1;
				maxLen = len;
			}
		}
		return s.substring(maxLeft,maxRight+1);
	}
}

}

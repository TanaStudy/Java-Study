package leetcode.editor.cn;

//给定一个包含大写字母和小写字母的字符串 s ，返回 通过这些字母构造成的 最长的回文串 。 
//
// 在构造过程中，请注意 区分大小写 。比如 "Aa" 不能当做一个回文字符串。 
//
// 
//
// 示例 1: 
//
// 
//输入:s = "abccccdd"
//输出:7
//解释:
//我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。
// 
//
// 示例 2: 
//
// 
//输入:s = "a"
//输入:1
// 
//
// 示例 3: 
//
// 
//输入:s = "bb"
//输入: 2
// 
//
// 
//
// 提示: 
//
// 
// 1 <= s.length <= 2000 
// s 只能由小写和/或大写英文字母组成 
// 
// Related Topics 贪心 哈希表 字符串 👍 391 👎 0

public class Q409最长回文串{
	public static void main(String[] args) {
		Solution solution = new Q409最长回文串().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/longest-palindrome/solution/zui-chang-hui-wen-chuan-by-leetcode-solution/
class Solution {
    public int longestPalindrome(String s) {
		int[] count = new int[128];
		int length = s.length();
		for(int i = 0; i < length; i++){
			char c = s.charAt(i);
			count[c]++;
		}

		int ans = 0;
		for(int v : count){
			ans = ans + v / 2 * 2;
			if(v % 2 == 1 && ans % 2 == 0){
				ans++;
			}
		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。 
//
// 说明：本题中，我们将空字符串定义为有效的回文串。 
//
// 
//
// 示例 1: 
//
// 
//输入: "A man, a plan, a canal: Panama"
//输出: true
//解释："amanaplanacanalpanama" 是回文串
// 
//
// 示例 2: 
//
// 
//输入: "race a car"
//输出: false
//解释："raceacar" 不是回文串
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 2 * 10⁵ 
// 字符串 s 由 ASCII 字符组成 
// 
// Related Topics 双指针 字符串 👍 453 👎 0

public class Q125验证回文串{
	public static void main(String[] args) {
		Solution solution = new Q125验证回文串().new Solution();
		String s = "OP";
		System.out.println(solution.isPalindrome(s));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/valid-palindrome/solution/yan-zheng-hui-wen-chuan-by-leetcode-solution/
class Solution {
    public boolean isPalindrome(String s) {
    	s = s.toLowerCase().trim();
    	StringBuilder sb = new StringBuilder();
    	for(int i = 0; i < s.length(); i++){
    		if(Character.isLetterOrDigit(s.charAt(i))){
    			sb.append(s.charAt(i));
			}
		}
		int left = 0, right = sb.length() - 1;
		while (left < right){
			if(sb.charAt(left) != sb.charAt(right)){
				return false;
			}
			left++;
			right--;
		}
		return true;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

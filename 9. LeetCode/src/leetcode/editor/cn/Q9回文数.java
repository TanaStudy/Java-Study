package leetcode.editor.cn;

//给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。 
//
// 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。 
//
// 
//
// 示例 1： 
//
// 
//输入：x = 121
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：x = -121
//输出：false
//解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
// 
//
// 示例 3： 
//
// 
//输入：x = 10
//输出：false
//解释：从右向左读, 为 01 。因此它不是一个回文数。
// 
//
// 示例 4： 
//
// 
//输入：x = -101
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// -2³¹ <= x <= 2³¹ - 1 
// 
//
// 
//
// 进阶：你能不将整数转为字符串来解决这个问题吗？ 
// Related Topics 数学 👍 1692 👎 0

public class Q9回文数{
	public static void main(String[] args) {
		Solution solution = new Q9回文数().new Solution();
		int x = 1231;
		System.out.println(solution.isPalindrome(x));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
	// 方法二、双指针
    public boolean isPalindrome(int x) {
    	if(x < 0){
    		return false;
		}
    	String s = String.valueOf(x);
    	int left = 0,right = s.length()-1;
    	while (left < right){
    		if(s.charAt(left) != s.charAt(right)){
    			return false;
			}
    		left++;
    		right--;
		}
    	return true;
	}

}
//leetcode submit region end(Prohibit modification and deletion)


class Solution1 {
	// 方法一、反转整数
	public boolean isPalindrome(int x) {
		if(x < 0){
			return false;
		}
		int copy = x;
		int rev = reverse(copy);
		return rev == x;

	}
	public int reverse(int x) {
		int res = 0;
		while (x != 0){
			int remainder = x % 10;
			x = x / 10;
			res = 10 * res +  remainder;
		}
		return res;
	}
}
}

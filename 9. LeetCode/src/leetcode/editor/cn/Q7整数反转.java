package leetcode.editor.cn;

//给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。 
//
// 如果反转后整数超过 32 位的有符号整数的范围 [−2³¹, 231 − 1] ，就返回 0。 
//假设环境不允许存储 64 位整数（有符号或无符号）。
//
// 
//
// 示例 1： 
//
// 
//输入：x = 123
//输出：321
// 
//
// 示例 2： 
//
// 
//输入：x = -123
//输出：-321
// 
//
// 示例 3： 
//
// 
//输入：x = 120
//输出：21
// 
//
// 示例 4： 
//
// 
//输入：x = 0
//输出：0
// 
//
// 
//
// 提示： 
//
// 
// -2³¹ <= x <= 2³¹ - 1 
// 
// Related Topics 数学 👍 3242 👎 0

public class Q7整数反转{
	public static void main(String[] args) {
		Solution solution = new Q7整数反转().new Solution();
		int x = 129;
		System.out.println(solution.reverse(x));
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Integer.MIN_VALUE);
		System.out.println(Math.pow(2,31) - 1);
		System.out.println(- Math.pow(2,31));

	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/reverse-integer/solution/zheng-shu-fan-zhuan-by-leetcode-solution-bccn/
class Solution {
    public int reverse(int x) {
    	int res = 0;
    	while (x != 0){
			if(res > (Math.pow(2,31) - 1) / 10 || res < - Math.pow(2,31) / 10){
				return 0;
			}
			int remainder = x % 10;
    		x = x / 10;
    		res = 10 * res +  remainder;
		}
    	return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

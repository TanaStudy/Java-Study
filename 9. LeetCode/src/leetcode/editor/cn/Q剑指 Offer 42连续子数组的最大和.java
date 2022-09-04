package leetcode.editor.cn;

//输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。 
//
// 要求时间复杂度为O(n)。 
//
// 
//
// 示例1: 
//
// 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
//输出: 6
//解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。 
//
// 
//
// 提示： 
//
// 
// 1 <= arr.length <= 10^5 
// -100 <= arr[i] <= 100 
// 
//
// 注意：本题与主站 53 题相同：https://leetcode-cn.com/problems/maximum-subarray/ 
//
// 
// Related Topics 数组 分治 动态规划 👍 506 👎 0

class Q剑指Offer42连续子数组的最大和{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer42连续子数组的最大和().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 动态规划，不改变原数组
// https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/solution/mian-shi-ti-42-lian-xu-zi-shu-zu-de-zui-da-he-do-2/
class Solution {
    public int maxSubArray(int[] nums) {
		int n = nums.length;
		int dp = nums[0];
		int max = dp;

		for(int i = 1; i < n; i++){
			dp = Math.max(dp + nums[i], nums[i]);
			max = Math.max(max, dp);
		}
		return max;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

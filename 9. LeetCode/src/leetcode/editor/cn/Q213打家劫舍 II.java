package leetcode.editor.cn;

//你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都 围成一圈 ，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的
//房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警 。 
//
// 给定一个代表每个房屋存放金额的非负整数数组，计算你 在不触动警报装置的情况下 ，今晚能够偷窃到的最高金额。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [2,3,2]
//输出：3
//解释：你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。
// 
//
// 示例 2： 
//
// 
//输入：nums = [1,2,3,1]
//输出：4
//解释：你可以先偷窃 1 号房屋（金额 = 1），然后偷窃 3 号房屋（金额 = 3）。
//     偷窃到的最高金额 = 1 + 3 = 4 。 
//
// 示例 3： 
//
// 
//输入：nums = [1,2,3]
//输出：3
//
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 100 
// 0 <= nums[i] <= 1000 
//
// Related Topics 数组 动态规划 👍 898 👎 0

class Q213打家劫舍II{
	public static void main(String[] args) {
		Solution solution = new Q213打家劫舍II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/house-robber-ii/solution/da-jia-jie-she-ii-by-leetcode-solution-bwja/
// 拆成两个打家劫舍1来做，一个不含第一个元素，一个不含最后一个元素，求最大值
class Solution {
    public int rob(int[] nums) {
    	int len = nums.length;
    	if(len == 1){
    		return nums[0];
		}
    	if(len == 2){
    		return Math.max(nums[0], nums[1]);
		}
    	int[] dp1 = new int[len - 1];
    	int[] dp2 = new int[len - 1];
    	for(int i = 0; i < len - 1; i++){
    		dp1[i] = nums[i + 1];
    		dp2[i] = nums[i];
		}
    	return Math.max(rob1(dp1), rob1(dp2));
    }
    public int rob1(int[] nums){
    	int[] dp = new int[nums.length];
    	dp[0] = nums[0];
    	dp[1] = Math.max(nums[0], nums[1]);
    	for(int i = 2; i < nums.length; i++){
    		dp[i] = Math.max(dp[i - 2] + nums[i], dp[i - 1]);
		}
    	return dp[nums.length - 1];
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

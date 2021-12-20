package leetcode.editor.cn;

//给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。 
//
// 子数组 是数组中的一个连续部分。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
//输出：6
//解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
// 
//
// 示例 2： 
//
// 
//输入：nums = [1]
//输出：1
// 
//
// 示例 3： 
//
// 
//输入：nums = [5,4,-1,7,8]
//输出：23
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 10⁵ 
// -10⁴ <= nums[i] <= 10⁴ 
// 
//
// 
//
// 进阶：如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的 分治法 求解。 
// Related Topics 数组 分治 动态规划 👍 4065 👎 0

import java.util.Arrays;

public class Q53最大子数组和{
	public static void main(String[] args) {
		Solution solution = new Q53最大子数组和().new Solution();
		int[] nums = new int[]{-2,1,-3,4,-1,2,1,-5,4};
		System.out.println(solution.maxSubArray(nums));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、只记录dp[i-1]
// https://leetcode-cn.com/problems/maximum-subarray/solution/dong-tai-gui-hua-fen-zhi-fa-python-dai-ma-java-dai/
class Solution {
    public int maxSubArray(int[] nums) {
    	int ans = nums[0],pre = 0;
    	for(int num :nums){
    		pre = Math.max(pre+num,num);
    		ans = Math.max(ans,pre);
		}
    	return ans;

    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、直接写dp数组
class Solution1 {
	public int maxSubArray(int[] nums) {
		int len = nums.length;
		int[] dp = new int[len];
		dp[0] = nums[0];
		for(int i = 1; i < len;i++){
			dp[i] = Math.max(nums[i],dp[i-1]+nums[i]);
		}
		int ans = dp[0];
		for(int i = 1; i < len;i++){
			ans = Math.max(ans,dp[i]);
		}
		return ans;
	}
}

}

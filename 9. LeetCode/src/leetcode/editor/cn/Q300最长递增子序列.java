package leetcode.editor.cn;

//给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。 
//
// 子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序
//列。 
// 
//
// 示例 1： 
//
// 
//输入：nums = [10,9,2,5,3,7,101,18]
//输出：4
//解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
// 
//
// 示例 2： 
//
// 
//输入：nums = [0,1,0,3,2,3]
//输出：4
// 
//
// 示例 3： 
//
// 
//输入：nums = [7,7,7,7,7,7,7]
//输出：1
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 2500 
// -10⁴ <= nums[i] <= 10⁴ 
// 
//
// 
//
// 进阶： 
//
// 
// 你可以设计时间复杂度为 O(n²) 的解决方案吗？ 
// 你能将算法的时间复杂度降低到 O(n log(n)) 吗? 
// 
// Related Topics 数组 二分查找 动态规划 👍 2103 👎 0

import java.util.Arrays;

public class Q300最长递增子序列{
	public static void main(String[] args) {
		Solution solution = new Q300最长递增子序列().new Solution();
		int[] nums = new int[]{10,9,2,5,3,4};
		System.out.println(solution.lengthOfLIS(nums));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、贪心算法 + 二分
// https://leetcode-cn.com/problems/longest-increasing-subsequence/solution/dong-tai-gui-hua-er-fen-cha-zhao-tan-xin-suan-fa-p/
class Solution {
    public int lengthOfLIS(int[] nums) {
		int len = nums.length;
		int[] tail = new int[len];

		tail[0] = nums[0];
		int end = 0;
		for(int i = 1; i < len; i++){
			if(nums[i] > tail[end]){
				end++;
				tail[end] = nums[i];
			}else {
				// 找到第 1 个大于等于 nums[i] 的元素
				int left = 0;
				int right = end;
				while (left < right){
					int mid = left + (right - left) / 2;
					if(tail[mid] < nums[i]){
						left = mid + 1;
					}else {
						right = mid;
					}
				}
				tail[left] = nums[i];
			}
		}
		end++;
		return end;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、动态规划
// https://leetcode-cn.com/problems/longest-increasing-subsequence/solution/zui-chang-shang-sheng-zi-xu-lie-dong-tai-gui-hua-2/
// dp[i] = Math.max(dp[i], dp[j] + 1)
class Solution1 {
	public int lengthOfLIS(int[] nums) {
		int len = nums.length;
		int[] dp = new int[len];
		int res = 0;
		Arrays.fill(dp, 1);
		for(int i = 0; i < len; i++){
			for(int j = 0; j < i; j++){
				if(nums[j] < nums[i]){
					dp[i] = Math.max(dp[i], dp[j] + 1);
				}
			}
		}
		for(int cur : dp){
			res = Math.max(res, cur);
		}
		return res;

	}
}

}

package leetcode.editor.cn;

//给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。 
//
// 
//
// 示例 1： 
//
// 
//
// 
//输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
//输出：6
//解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 
// 
//
// 示例 2： 
//
// 
//输入：height = [4,2,0,3,2,5]
//输出：9
// 
//
// 
//
// 提示： 
//
// 
// n == height.length 
// 1 <= n <= 2 * 10⁴ 
// 0 <= height[i] <= 10⁵ 
// 
// Related Topics 栈 数组 双指针 动态规划 单调栈 👍 2946 👎 0

import java.util.Arrays;

public class Q42接雨水{
	public static void main(String[] args) {
		Solution solution = new Q42接雨水().new Solution();
		int[] height = new int[]{4,2,0,3,2,5};
		System.out.println(solution.trap(height));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法三、双指针
// https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode-solution-tuvc/
class Solution {
    public int trap(int[] height) {
		int left = 0, right = height.length - 1;
		int ans = 0;
		int leftMax = 0, rightMax = 0;
		while (left < right){
			leftMax = Math.max(leftMax, height[left]);
			rightMax = Math.max(rightMax, height[right]);
			if(leftMax < rightMax){
				ans = ans + leftMax - height[left];
				left++;
			}else {
				ans = ans + rightMax - height[right];
				right--;
			}
		}
		return ans;

    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一：暴力解法
// https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode/
// 计算从当前位置开始两边最大高度的较小值减去当前高度值
class Solution1 {
	public int trap(int[] height) {
		int len = height.length;
		int ans = 0;
		for(int i = 1; i < len - 1; i++){
			int maxLeft = 0, maxRight = 0;
			for(int j = i; j >= 0; j--){
				maxLeft = Math.max(maxLeft, height[j]);
			}
			for(int j = i; j < len; j++){
				maxRight = Math.max(maxRight, height[j]);
			}
			ans = ans + Math.min(maxLeft, maxRight) - height[i];
		}
		return ans;
	}
}
// 方法二、用数组储存往右和往左的最大值
// https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode/
class Solution2 {
	public int trap(int[] height) {
		int len = height.length;
		int res = 0;
		int[] maxLeft = new int[len];
		int[] maxRight = new int[len];
		maxLeft[0] = height[0];
		maxRight[len - 1] = height[len - 1];
		for(int i = 1; i < len; i++){
			maxLeft[i] = Math.max(height[i], maxLeft[i - 1]);
		}
		for(int i = len - 2; i >= 0; i--){
			maxRight[i] = Math.max(height[i], maxRight[i + 1]);
		}
		for(int i = 1; i < len - 1; i++){
			res = res + Math.min(maxLeft[i], maxRight[i]) - height[i];
		}
		return res;
	}
}

}

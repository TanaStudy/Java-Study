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

import sun.plugin.javascript.navig.Link;

import java.util.Arrays;
import java.util.Deque;
import java.util.Stack;

public class Q42接雨水{
	public static void main(String[] args) {
		Solution solution = new Q42接雨水().new Solution();
		int[] height = new int[]{4,2,0,3,2,5};
		System.out.println(solution.trap(height));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法四、双指针
// https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode-solution-tuvc/
class Solution {
    public int trap(int[] height) {
		int ans = 0;
		int left = 0, right = height.length - 1;
		int leftMax = 0, rightMax = 0;

		while (left < right){
			leftMax = Math.max(leftMax, height[left]);
			rightMax = Math.max(rightMax, height[right]);

			if(height[left] < height[right]){
				ans += leftMax - height[left];
				left++;
			}else {
				ans += rightMax - height[right];
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

// 方法二、动态规划
// https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode-solution-tuvc/
class Solution2 {
	public int trap(int[] height) {
		int n = height.length;
		if(n == 0){
			return 0;
		}
		int[] leftMax = new int[n];
		leftMax[0] = height[0];

		for(int i = 1; i < n; i++){
			leftMax[i] = Math.max(leftMax[i - 1], height[i]);
		}
		int[] rightMax = new int[n];
		rightMax[n - 1] = height[n - 1];
		for(int i = n  - 2; i >= 0; i--){
			rightMax[i] = Math.max(rightMax[i + 1], height[i]);
		}
		int ans = 0;
		for(int i = 0; i < n; i++){
			ans += Math.min(leftMax[i], rightMax[i]) - height[i];
		}
		return ans;
	}
}
// 方法三、单调栈
// https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode-solution-tuvc/
class Solution3 {
	public int trap(int[] height) {
		int ans = 0;
		Stack<Integer> stack = new Stack<>();
		int n = height.length;
		for(int i = 0; i < n; i++){
			while (!stack.isEmpty() && height[i] > height[stack.peek()]){
				int top = stack.pop();
				if(stack.isEmpty()){
					break;
				}
				int left = stack.peek();
				int curWidth = i - left - 1;
				int curHeight = Math.min(height[left], height[i]) - height[top];
				ans += curWidth * curHeight;
			}
			stack.push(i);
		}
		return ans;
	}
}


}

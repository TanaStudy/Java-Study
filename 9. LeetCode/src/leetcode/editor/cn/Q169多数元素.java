package leetcode.editor.cn;

//给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。 
//
// 你可以假设数组是非空的，并且给定的数组总是存在多数元素。 
//
// 
//
// 示例 1： 
//
// 
//输入：[3,2,3]
//输出：3 
//
// 示例 2： 
//
// 
//输入：[2,2,1,1,1,2,2]
//输出：2
// 
//
// 
//
// 进阶： 
//
// 
// 尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。 
// 
// Related Topics 数组 哈希表 分治 计数 排序 👍 1243 👎 0

import java.util.Arrays;

public class Q169多数元素{
	public static void main(String[] args) {
		Solution solution = new Q169多数元素().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、投票法
// https://leetcode-cn.com/problems/majority-element/solution/duo-shu-yuan-su-by-leetcode-solution/
class Solution {
    public int majorityElement(int[] nums) {
		int count = 0;
		int candidate = nums[0];

		for(int num : nums){
			// 如果count等于0，换候选人
			if(count == 0){
				candidate = num;
			}
			// 如果num等于候选人，count+1；不等于则count-1
			if(num == candidate){
				count++;
			}else {
				count--;
			}
		}
		// 返回候选人
		return candidate;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、排序返回下标为 n / 2 的数
class Solution1 {
	public int majorityElement(int[] nums) {
		Arrays.sort(nums);
		return nums[nums.length/2];
	}
}
}

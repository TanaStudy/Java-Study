package leetcode.editor.cn;

//找出数组中重复的数字。 
//
// 
//在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请
//找出数组中任意一个重复的数字。 
//
// 示例 1： 
//
// 输入：
//[2, 3, 1, 0, 2, 5, 3]
//输出：2 或 3 
// 
//
// 
//
// 限制： 
//
// 2 <= n <= 100000 
// Related Topics 数组 哈希表 排序 👍 640 👎 0

import java.util.Arrays;
import java.util.HashSet;

class Q剑指Offer03数组中重复的数字{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer03数组中重复的数字().new Solution();
		int[] nums = new int[]{2, 3, 1, 0, 2, 5, 3};
		System.out.println(solution.findRepeatNumber(nums));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、判断nums[nums[i]]=nums[i]
// https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/solution/mian-shi-ti-03-shu-zu-zhong-zhong-fu-de-shu-zi-yua/
class Solution {
    public int findRepeatNumber(int[] nums) {
    	int i = 0;
		while (i < nums.length){
			if(nums[i] == i){
				i++;
				continue;
			}
			if(nums[i] == nums[nums[i]]){
				return nums[i];
			}
			int temp = nums[nums[i]];
			nums[nums[i]] = nums[i];
			nums[i] = temp;
		}
		return -1;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、HashSet
class Solution1 {
	public int findRepeatNumber(int[] nums) {
		HashSet<Integer> set = new HashSet<>();
		for(int num : nums){
			if(set.contains(num)){
				return num;
			}
			set.add(num);
		}
		return -1;
	}
}

}

package leetcode.editor.cn;

//给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。 
//请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [1,2,0]
//输出：3
// 
//
// 示例 2： 
//
// 
//输入：nums = [3,4,-1,1]
//输出：2
// 
//
// 示例 3： 
//
// 
//输入：nums = [7,8,9,11,12]
//输出：1
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 5 * 10⁵ 
// -2³¹ <= nums[i] <= 2³¹ - 1 
// 
// Related Topics 数组 哈希表 👍 1377 👎 0

import java.util.HashSet;

public class Q41缺失的第一个正数{
	public static void main(String[] args) {
		Solution solution = new Q41缺失的第一个正数().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、原地交换
// https://leetcode-cn.com/problems/first-missing-positive/solution/tong-pai-xu-python-dai-ma-by-liweiwei1419/
class Solution {
    public int firstMissingPositive(int[] nums) {
		int len = nums.length;
		for(int i = 0; i < len; i++){
			while(nums[i] > 0 && nums[i] <= len && nums[nums[i] - 1] != nums[i]){
				swap(nums, nums[i] - 1, i);
			}
		}
		for(int i = 0; i < len; i++){
			if (nums[i] != i + 1) {
				return i + 1;
			}
		}
		return len + 1;
    }
    public void swap(int[] nums, int i, int j){
    	int temp = nums[i];
    	nums[i] = nums[j];
    	nums[j] = temp;
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、hashset
// https://leetcode-cn.com/problems/first-missing-positive/solution/tong-pai-xu-python-dai-ma-by-liweiwei1419/
class Solution1 {
	public int firstMissingPositive(int[] nums) {
		HashSet<Integer> set = new HashSet<>();
		for(int num : nums){
			set.add(num);
		}
		for(int i = 1; i < nums.length + 1; i++){
			if(!set.contains(i)){
				return i;
			}
		}
		return nums.length + 1;
	}
}

}

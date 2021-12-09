package leetcode.editor.cn;

//给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。 
//
// 如果数组中不存在目标值 target，返回 [-1, -1]。 
//
// 进阶： 
//
// 
// 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？ 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [5,7,7,8,8,10], target = 8
//输出：[3,4] 
//
// 示例 2： 
//
// 
//输入：nums = [5,7,7,8,8,10], target = 6
//输出：[-1,-1] 
//
// 示例 3： 
//
// 
//输入：nums = [], target = 0
//输出：[-1,-1] 
//
// 
//
// 提示： 
//
// 
// 0 <= nums.length <= 10⁵ 
// -10⁹ <= nums[i] <= 10⁹ 
// nums 是一个非递减数组 
// -10⁹ <= target <= 10⁹ 
// 
// Related Topics 数组 二分查找 👍 1328 👎 0

import java.util.Arrays;

public class Q34在排序数组中查找元素的第一个和最后一个位置{
	public static void main(String[] args) {
		Solution solution = new Q34在排序数组中查找元素的第一个和最后一个位置().new Solution();
		int[] nums = new int[]{5,7,7,8,8,10};
		System.out.println(Arrays.toString(solution.searchRange(nums, 8)));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int[] searchRange(int[] nums, int target) {
		int l = search(nums,target);
		int r = search(nums,target+1);
		if(l == nums.length || nums[l] != target){
			return new int[]{-1, -1};
		}
		return new int[]{l, r-1};
    }
    public int search(int[] nums, int target){
    	int l = 0, r = nums.length;
    	while (l < r){
    		int mid = l + (r - l) / 2;
    		if(nums[mid] >= target){
    			r = mid;
			}else {
    			l = mid + 1;
			}
		}
    	return l;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

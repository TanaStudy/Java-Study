package leetcode.editor.cn;

//给你一个数组，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。 
//
// 
//
// 示例 1: 
//
// 
//输入: nums = [1,2,3,4,5,6,7], k = 3
//输出: [5,6,7,1,2,3,4]
//解释:
//向右轮转 1 步: [7,1,2,3,4,5,6]
//向右轮转 2 步: [6,7,1,2,3,4,5]
//向右轮转 3 步: [5,6,7,1,2,3,4]
// 
//
// 示例 2: 
//
// 
//输入：nums = [-1,-100,3,99], k = 2
//输出：[3,99,-1,-100]
//解释: 
//向右轮转 1 步: [99,-1,-100,3]
//向右轮转 2 步: [3,99,-1,-100] 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 10⁵ 
// -2³¹ <= nums[i] <= 2³¹ - 1 
// 0 <= k <= 10⁵ 
// 
//
// 
//
// 进阶： 
//
// 
// 尽可能想出更多的解决方案，至少有 三种 不同的方法可以解决这个问题。 
// 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？ 
// 
//
// 
// 
//
// 
// 
// Related Topics 数组 数学 双指针 👍 1246 👎 0

import java.util.Arrays;

public class Q189轮转数组{
	public static void main(String[] args) {
		Solution solution = new Q189轮转数组().new Solution();
		int[] nums = new int[]{1,2,3,4,5,6,7};
		solution.rotate(nums,3);
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、反转数组
// https://leetcode-cn.com/problems/rotate-array/solution/shu-zu-fan-zhuan-xuan-zhuan-shu-zu-by-de-5937/
// 先反转整个数组，然后根据k分成两部分，再分别反转
class Solution {
    public void rotate(int[] nums, int k) {
		int len = nums.length;
		k = k % len;
		reverse(nums,0,len-1);
		reverse(nums,0,k-1);
		reverse(nums,k,len-1);

    }
    public void reverse(int[] nums, int left, int right){
    	while (left < right){
    		int temp = nums[left];
			nums[left] = nums[right];
			nums[right] = temp;
			left++;
			right--;
		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、使用额外的数组
// https://leetcode-cn.com/problems/rotate-array/solution/xuan-zhuan-shu-zu-by-leetcode-solution-nipk/
class Solution1 {
	public void rotate(int[] nums, int k) {
		int len = nums.length;
		int[] res = new int[len];
//		k = k % len;
//		for(int i = 0, j = len- k; i < k; i++, j++){
//			res[i] = nums[j];
//		}
//		for(int i = k, j = 0; i < len; i++, j++){
//			res[i] = nums[j];
//		}
		for(int i = 0; i < len; i++){
			res[(i+k)%len] = res[i];
		}
		System.arraycopy(res, 0, nums, 0, len);

	}
}

}

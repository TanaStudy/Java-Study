package leetcode.editor.cn;

//输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数在数组的前半部分，所有偶数在数组的后半部分。 
//
// 
//
// 示例： 
//
// 
//输入：nums = [1,2,3,4]
//输出：[1,3,2,4] 
//注：[3,1,2,4] 也是正确的答案之一。 
//
// 
//
// 提示： 
//
//
// 0 <= nums.length <= 50000 
// 0 <= nums[i] <= 10000 
// 
// Related Topics 数组 双指针 排序 👍 185 👎 0

class Q剑指Offer21调整数组顺序使奇数位于偶数前面{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer21调整数组顺序使奇数位于偶数前面().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、双指针从两端开始，交换的次数更少，时间更少
// https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/solution/mian-shi-ti-21-diao-zheng-shu-zu-shun-xu-shi-qi-4/
class Solution {
    public int[] exchange(int[] nums) {
		int l = 0, r = nums.length - 1;
		while (l < r){
			while (l < r && nums[l] % 2 != 0){
				l++;
			}
			while (l < r && nums[r] % 2 == 0){
				r--;
			}
			int temp = nums[l];
			nums[l] = nums[r];
			nums[r] = temp;
		}
		return nums;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、快慢指针
class Solution1 {
	public int[] exchange(int[] nums) {
		int slow = 0, fast = 0;
		while (fast < nums.length){
			if(nums[fast] % 2 != 0){
				int temp = nums[fast];
				nums[fast] = nums[slow];
				nums[slow] = temp;
				slow++;
			}
			fast++;
		}
		return nums;
	}
}

}

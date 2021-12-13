package leetcode.editor.cn;

//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。 
//
// 示例: 
//
// 输入: [0,1,0,3,12]
//输出: [1,3,12,0,0] 
//
// 说明: 
//
// 
// 必须在原数组上操作，不能拷贝额外的数组。
// 尽量减少操作次数。 
// 
// Related Topics 数组 双指针 👍 1333 👎 0

public class Q283移动零{
	public static void main(String[] args) {
		Solution solution = new Q283移动零().new Solution();

		
	}
//leetcode submit region begin(Prohibit modification and deletion)

// 方法二、一次遍历
class Solution {
    public void moveZeroes(int[] nums) {
		int j = 0;
		for(int i = 0;i < nums.length;i++){
			if(nums[i] != 0){
				int temp = nums[i];
				nums[i] = nums[j];
				nums[j] = temp;
				j++;
			}
		}
    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、两次遍历
class Solution1 {
	public void moveZeroes(int[] nums) {
		int left = 0, right = 0;
		for(;right < nums.length;right++){
			if(nums[right] != 0){
				nums[left] = nums[right];
				left++;
			}
		}
		for(;left < nums.length;left++){
			nums[left] = 0;
		}
	}
}

}

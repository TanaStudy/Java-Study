package leetcode.editor.cn;

//给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。 
//
// 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。 
//
// 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [2,0,2,1,1,0]
//输出：[0,0,1,1,2,2]
// 
//
// 示例 2： 
//
// 
//输入：nums = [2,0,1]
//输出：[0,1,2]
// 
//
// 示例 3： 
//
// 
//输入：nums = [0]
//输出：[0]
// 
//
// 示例 4： 
//
// 
//输入：nums = [1]
//输出：[1]
// 
//
// 
//
// 提示： 
//
// 
// n == nums.length 
// 1 <= n <= 300 
// nums[i] 为 0、1 或 2 
// 
//
// 
//
// 进阶： 
//
// 
// 你可以不使用代码库中的排序函数来解决这道题吗？ 
// 你能想出一个仅使用常数空间的一趟扫描算法吗？ 
// 
// Related Topics 数组 双指针 排序 👍 1116 👎 0

import java.util.Arrays;
public class Q75颜色分类{
	public static void main(String[] args) {
		Solution solution = new Q75颜色分类().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/sort-colors/solution/kuai-su-pai-xu-partition-guo-cheng-she-ji-xun-huan/
// all in [0, zero) = 0
// all in [zero, i) = 1
// all in [two, len - 1] = 2
class Solution {
    public void sortColors(int[] nums) {
		int zero = 0;
		int i = 0;
		int two = nums.length;

		while (i < two){
			if(nums[i] == 0){
				swap(nums, i, zero);
				i++;
				zero++;
			}else if(nums[i] == 1){
				i++;
			}else if(nums[i] == 2){
				two--;
				swap(nums, i, two);
			}
		}
    }
    public void swap(int[] nums, int i, int j){
    	int temp = nums[i];
    	nums[i] = nums[j];
    	nums[j] = temp;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

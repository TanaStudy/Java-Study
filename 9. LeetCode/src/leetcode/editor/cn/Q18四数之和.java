package leetcode.editor.cn;

//给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[
//b], nums[c], nums[d]] （若两个四元组元素一一对应，则认为两个四元组重复）： 
//
// 
// 0 <= a, b, c, d < n 
// a、b、c 和 d 互不相同 
// nums[a] + nums[b] + nums[c] + nums[d] == target 
// 
//
// 你可以按 任意顺序 返回答案 。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [1,0,-1,0,-2,2], target = 0
//输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
// 
//
// 示例 2： 
//
// 
//输入：nums = [2,2,2,2,2], target = 8
//输出：[[2,2,2,2]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 200 
// -10⁹ <= nums[i] <= 10⁹ 
// -10⁹ <= target <= 10⁹ 
// 
// Related Topics 数组 双指针 排序 👍 1089 👎 0

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Q18四数之和{
	public static void main(String[] args) {
		Solution solution = new Q18四数之和().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/4sum/solution/shuang-zhi-zhen-jie-fa-can-zhao-san-shu-zhi-he-ge-/
// 三数之和外面加一层，最外面一层a，内层b，双指针c和d
class Solution {
    public List<List<Integer>> fourSum(int[] nums, int target) {
		List<List<Integer>> ans = new ArrayList<>();
		int n = nums.length;
		if(nums == null || n < 4){
			return ans;
		}
		Arrays.sort(nums);
		for(int a = 0; a <= n - 4; a++){
			if(a > 0 && nums[a] == nums[a - 1]){
				continue;
			}
			for(int b = a + 1; b <= n - 3; b++){
				if(b > a + 1 && nums[b] == nums[b - 1]){
					continue;
				}
				int c = b + 1;
				int d = n - 1;
				while (c < d){
					int sum = nums[a] + nums[b] + nums[c] + nums[d];
					if(sum == target){
						List<Integer> temp = new ArrayList<>();
						temp.add(nums[a]);
						temp.add(nums[b]);
						temp.add(nums[c]);
						temp.add(nums[d]);
						ans.add(temp);
						while (c < d && nums[c] == nums[c + 1]){
							c++;
						}
						while (c < d && nums[d] == nums[d - 1]){
							d--;
						}
						c++;
						d--;
					}else if(sum > target){
						d--;
					}else if(sum < target){
						c++;
					}
				}
			}
		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

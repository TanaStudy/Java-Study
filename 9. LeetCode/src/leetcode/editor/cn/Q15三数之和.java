package leetcode.editor.cn;

//给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重
//复的三元组。 
//
// 注意：答案中不可以包含重复的三元组。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [-1,0,1,2,-1,-4]
//输出：[[-1,-1,2],[-1,0,1]]
// 
//
// 示例 2： 
//
// 
//输入：nums = []
//输出：[]
// 
//
// 示例 3： 
//
// 
//输入：nums = [0]
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// 0 <= nums.length <= 3000 
// -10⁵ <= nums[i] <= 10⁵ 
// 
// Related Topics 数组 双指针 排序 👍 4081 👎 0

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Q15三数之和{
	public static void main(String[] args) {
		Solution solution = new Q15三数之和().new Solution();
		int[] nums = new int[]{1,-1,-1,0};
		System.out.println(solution.threeSum(nums));
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/3sum/solution/pai-xu-shuang-zhi-zhen-zhu-xing-jie-shi-python3-by/
// https://leetcode-cn.com/problems/3sum/solution/hua-jie-suan-fa-15-san-shu-zhi-he-by-guanpengchn/
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
    	List<List<Integer>> ans = new ArrayList<>();
		int n = nums.length;
		if(nums == null || n < 3){
			return ans;
		}
		Arrays.sort(nums);
		for(int i = 0; i < n; i++){
			// 若 nums[i]>0nums[i]>0：因为已经排序好，所以后面不可能有三个数加和等于 00，直接返回结果。
			if(nums[i] > 0){
				break;
			}
			// 对于重复元素：跳过，避免出现重复解
			if(i > 0 && nums[i] == nums[i - 1]){
				continue;
			}
			// 令左指针 L=i+1L=i+1，右指针 R=n-1R=n−1，当 L<RL<R 时，执行循环
			int L = i + 1;
			int R = n - 1;
			while (L < R){
				int sum = nums[i] + nums[L] + nums[R];
				// 当 nums[i]+nums[L]+nums[R]==0nums[i]+nums[L]+nums[R]==0，执行循环，判断左界和右界是否和下一位置重复，去除重复解。
				// 并同时将 L,RL,R 移到下一位置，寻找新的解
				if(sum == 0){
					List<Integer> temp = new ArrayList<>();
					temp.add(nums[i]);
					temp.add(nums[L]);
					temp.add(nums[R]);
					ans.add(temp);
					while (L<R && nums[L] == nums[L + 1]){
						L++;
					}
					while (L<R && nums[R] == nums[R - 1]){
						R--;
					}
					L++;
					R--;
				}else if (sum > 0){
					R--; // 若和大于 0，说明 nums[R]太大，R 左移
				}else if (sum < 0){
					L++; // 若和小于 0，说明 nums[L]太小，L 右移
				}
			}
		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

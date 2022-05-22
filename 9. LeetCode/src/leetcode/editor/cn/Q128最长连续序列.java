package leetcode.editor.cn;

//给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。 
//
// 请你设计并实现时间复杂度为 O(n) 的算法解决此问题。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [100,4,200,1,3,2]
//输出：4
//解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。 
//
// 示例 2： 
//
// 
//输入：nums = [0,3,7,2,5,8,4,6,0,1]
//输出：9
// 
//
// 
//
// 提示： 
//
// 
// 0 <= nums.length <= 10⁵ 
// -10⁹ <= nums[i] <= 10⁹ 
// 
// Related Topics 并查集 数组 哈希表 👍 1261 👎 0

import java.util.HashSet;
import java.util.Set;

public class Q128最长连续序列{
	public static void main(String[] args) {
		Solution solution = new Q128最长连续序列().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 哈希表，考虑枚举数组中的每个数，考虑以其为起点的最长连续序列
// https://leetcode.cn/problems/longest-consecutive-sequence/solution/zui-chang-lian-xu-xu-lie-by-leetcode-solution/
class Solution {
    public int longestConsecutive(int[] nums) {
		Set<Integer> set = new HashSet<>();
		for(int num : nums){
			set.add(num);
		}
		int res = 0;
		for(int num : set){
			if(!set.contains(num - 1)){
				int cur = num;
				int curStreak = 1;
				while (set.contains(cur + 1)){
					cur += 1;
					curStreak += 1;
				}
				res = Math.max(res, curStreak);
			}
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

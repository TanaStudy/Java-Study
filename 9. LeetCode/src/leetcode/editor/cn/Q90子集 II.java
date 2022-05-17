package leetcode.editor.cn;

//给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。 
//
// 解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。 
//
// 
// 
// 
//
// 示例 1： 
//
// 
//输入：nums = [1,2,2]
//输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
// 
//
// 示例 2： 
//
// 
//输入：nums = [0]
//输出：[[],[0]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 10 
// -10 <= nums[i] <= 10 
// 
// 
// 
// Related Topics 位运算 数组 回溯 👍 825 👎 0

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class Q90子集II{
	public static void main(String[] arg) {
		Solution solution = new Q90子集II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 回溯
// https://leetcode.cn/problems/subsets-ii/solution/90-zi-ji-iiche-di-li-jie-zi-ji-wen-ti-ru-djmf/
class Solution {
	List<List<Integer>> result = new ArrayList<>();
	LinkedList<Integer> path = new LinkedList<>();
	boolean[] used;
    public List<List<Integer>> subsetsWithDup(int[] nums) {
		if(nums.length == 0){
			result.add(path);
			return result;
		}
		Arrays.sort(nums);
		used = new boolean[nums.length];
		back(nums, 0);
		return result;

    }
    public void back(int[] nums, int startIndex){
    	result.add(new ArrayList<>(path));
    	if(startIndex >= nums.length){
    		return;
		}
    	for(int i = startIndex; i < nums.length; i++){
    		if(i > 0 && nums[i] == nums[i - 1] && !used[i - 1]){
    			continue;
			}
    		path.add(nums[i]);
    		used[i] = true;
    		back(nums, i + 1);
    		path.removeLast();
    		used[i] = false;
		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

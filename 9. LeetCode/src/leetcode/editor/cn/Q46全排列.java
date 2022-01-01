package leetcode.editor.cn;

//给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [1,2,3]
//输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
// 
//
// 示例 2： 
//
// 
//输入：nums = [0,1]
//输出：[[0,1],[1,0]]
// 
//
// 示例 3： 
//
// 
//输入：nums = [1]
//输出：[[1]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 6 
// -10 <= nums[i] <= 10 
// nums 中的所有整数 互不相同 
// 
// Related Topics 数组 回溯 👍 1685 👎 0

import java.util.*;

public class Q46全排列{
	public static void main(String[] args) {
		Solution solution = new Q46全排列().new Solution();
		int[] nums = {1, 2, 3};
		System.out.println(solution.permute(nums));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/permutations/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liweiw/
class Solution {
	List<List<Integer>> res = new ArrayList<>();
    public List<List<Integer>> permute(int[] nums) {
		int len = nums.length;
		if(len == 0){
			return res;
		}
		boolean[] used = new boolean[len];
		dfs(nums, 0, new ArrayList<>(len), used);
		return res;

    }
    public void dfs(int[] nums, int depth, List<Integer> cur, boolean[] used){
    	if(depth == nums.length){
    		res.add(new ArrayList<>(cur));
		}
    	for(int i = 0; i < nums.length; i++){
    		if(!used[i]){
    			cur.add(nums[i]);
    			used[i] = true;

    			dfs(nums,depth + 1, cur, used);
    			used[i] = false;
    			cur.remove(cur.size() - 1);
			}
		}
	}


}
//leetcode submit region end(Prohibit modification and deletion)

}

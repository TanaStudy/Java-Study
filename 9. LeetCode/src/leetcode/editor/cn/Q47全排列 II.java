package leetcode.editor.cn;

//给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [1,1,2]
//输出：
//[[1,1,2],
// [1,2,1],
// [2,1,1]]
// 
//
// 示例 2： 
//
// 
//输入：nums = [1,2,3]
//输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 8 
// -10 <= nums[i] <= 10 
// 
// Related Topics 数组 回溯 👍 1026 👎 0

import java.util.*;

class Q47全排列II{
	public static void main(String[] args) {
		Solution solution = new Q47全排列II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 先排序，然后用used数组标记是否用过，回溯
// https://leetcode-cn.com/problems/permutations-ii/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liwe-2/
class Solution {
    public List<List<Integer>> permuteUnique(int[] nums) {
		int len = nums.length;
		List<List<Integer>> res = new ArrayList<>();
		if(len == 0){
			return res;
		}
		// 排序（升序或者降序都可以），排序是剪枝的前提
		Arrays.sort(nums);

		boolean[] used = new boolean[len];
		// 使用 Deque 是 Java 官方 Stack 类的建议
		Deque<Integer> path = new ArrayDeque<>(len);
		dfs(nums, len, 0, used, path, res);
		return res;

    }
    public void dfs(int[] nums, int len, int depth, boolean[] used, Deque<Integer> path, List<List<Integer>> res){
    	if(depth == len){
    		res.add(new ArrayList<>(path));
    		return;
		}
    	for(int i = 0; i < len; i++){
    		if(used[i]){
    			continue;
			}
    		if(i > 0 && nums[i] == nums[i - 1] && !used[i - 1]){
    			continue;
			}
    		path.addLast(nums[i]);
    		used[i] = true;
    		dfs(nums, len, depth + 1, used, path, res);
    		used[i] = false;
    		path.removeLast();
		}

	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

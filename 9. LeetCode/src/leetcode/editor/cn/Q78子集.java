package leetcode.editor.cn;

//给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。 
//
// 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [1,2,3]
//输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
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
// nums 中的所有元素 互不相同 
// 
// Related Topics 位运算 数组 回溯 👍 1426 👎 0

import java.util.ArrayList;
import java.util.List;

public class Q78子集{
	public static void main(String[] args) {

		Solution solution = new Q78子集().new Solution();
		int[] nums = new int[]{1,2,3};
		System.out.println(solution.subsets(nums));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/subsets/solution/c-zong-jie-liao-hui-su-wen-ti-lei-xing-dai-ni-gao-/
class Solution {
	List<List<Integer>> res = new ArrayList<>();
    public List<List<Integer>> subsets(int[] nums) {
		back(nums, new ArrayList<>(), 0);
		return res;
    }
    public void back(int[] nums, List<Integer> path, int index){
    	res.add(new ArrayList<>(path));
		System.out.println("add后：" + res);
    	for(int i = index; i < nums.length; i++){
			System.out.println("i: " + i);
    		path.add(nums[i]);
    		back(nums, path, i + 1);
    		path.remove(path.size() - 1);
			System.out.println("remove后的path：" + path);

		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

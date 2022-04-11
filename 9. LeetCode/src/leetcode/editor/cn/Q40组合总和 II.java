package leetcode.editor.cn;

//给定一个候选人编号的集合 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。 
//
// candidates 中的每个数字在每个组合中只能使用 一次 。 
//
// 注意：解集不能包含重复的组合。 
//
// 
//
// 示例 1: 
//
// 
//输入: candidates = [10,1,2,7,6,1,5], target = 8,
//输出:
//[
//[1,1,6],
//[1,2,5],
//[1,7],
//[2,6]
//] 
//
// 示例 2: 
//
// 
//输入: candidates = [2,5,2,1,2], target = 5,
//输出:
//[
//[1,2,2],
//[5]
//] 
//
// 
//
// 提示: 
//
// 
// 1 <= candidates.length <= 100 
// 1 <= candidates[i] <= 50 
// 1 <= target <= 30 
// 
// Related Topics 数组 回溯 👍 914 👎 0

import java.util.*;

class Q40组合总和II {
	public static void main(String[] args) {
		Solution solution = new Q40组合总和II().new Solution();

	}

	//leetcode submit region begin(Prohibit modification and deletion)
// 回溯
// https://leetcode-cn.com/problems/combination-sum-ii/solution/hui-su-suan-fa-jian-zhi-python-dai-ma-java-dai-m-3/
class Solution {
public List<List<Integer>> combinationSum2(int[] candidates, int target) {
	int len = candidates.length;
	List<List<Integer>> res = new ArrayList<>();
	if (len == 0) {
		return res;
	}

	// 关键步骤
	Arrays.sort(candidates);

	Deque<Integer> path = new ArrayDeque<>(len);
	dfs(candidates, len, 0, target, path, res);
	return res;

}
private void dfs(int[] candidates, int len, int begin, int target, Deque<Integer> path, List<List<Integer>> res) {
	if (target == 0) {
		res.add(new ArrayList<>(path));
		return;
	}
	for (int i = begin; i < len; i++) {
		// 大剪枝：减去 candidates[i] 小于 0，减去后面的 candidates[i + 1]、candidates[i + 2] 肯定也小于 0，因此用 break
		if (target - candidates[i] < 0) {
			break;
		}

		// 小剪枝：同一层相同数值的结点，从第 2 个开始，候选数更少，结果一定发生重复，因此跳过，用 continue
		if (i > begin && candidates[i] == candidates[i - 1]) {
			continue;
		}

		path.addLast(candidates[i]);
		// 调试语句 ①
		// System.out.println("递归之前 => " + path + "，剩余 = " + (target - candidates[i]));

		// 因为元素不可以重复使用，这里递归传递下去的是 i + 1 而不是 i
		dfs(candidates, len, i + 1, target - candidates[i], path, res);

		path.removeLast();
		// 调试语句 ②
		// System.out.println("递归之后 => " + path + "，剩余 = " + (target - candidates[i]));
	}
}



	}
//leetcode submit region end(Prohibit modification and deletion)
}



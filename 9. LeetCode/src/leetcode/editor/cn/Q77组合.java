package leetcode.editor.cn;

//给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。 
//
// 你可以按 任何顺序 返回答案。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 4, k = 2
//输出：
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//] 
//
// 示例 2： 
//
// 
//输入：n = 1, k = 1
//输出：[[1]] 
//
// 
//
// 提示： 
//
// 
// 1 <= n <= 20 
// 1 <= k <= n 
// 
// Related Topics 回溯 👍 952 👎 0

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

public class Q77组合{
	public static void main(String[] args) {
		Solution solution = new Q77组合().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 回溯
// https://leetcode-cn.com/problems/combinations/solution/hui-su-suan-fa-jian-zhi-python-dai-ma-java-dai-ma-/
class Solution {
    public List<List<Integer>> combine(int n, int k) {
		List<List<Integer>> res = new ArrayList<>();
		if(k <= 0 || n < k){
			return res;
		}
		Deque<Integer> path = new ArrayDeque<>();
		// 从 1 开始是题目的设定
		dfs(n, k, 1, path, res);
		return res;
    }
    public void dfs(int n, int k, int begin, Deque<Integer> path, List<List<Integer>> res){
		// 递归终止条件是：path 的长度等于 k
    	if(path.size() == k){
    		res.add(new ArrayList<>(path));
    		return;
		}
		// 遍历可能的搜索起点
    	for(int i = begin; i <= n; i++){
			// 向路径变量里添加一个数
    		path.addLast(i);
			// 下一轮搜索，设置的搜索起点要加 1，因为组合数理不允许出现重复的元素
    		dfs(n, k, i + 1, path, res);
			// 重点理解这里：深度优先遍历有回头的过程，因此递归之前做了什么，递归之后需要做相同操作的逆向操作
			path.removeLast();
		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

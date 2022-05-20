package leetcode.editor.cn;

//给你一个整数 n ，求恰由 n 个节点组成且节点值从 1 到 n 互不相同的 二叉搜索树 有多少种？返回满足题意的二叉搜索树的种数。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 3
//输出：5
// 
//
// 示例 2： 
//
// 
//输入：n = 1
//输出：1
// 
//
// 
//
// 提示： 
//
// 
// 1 <= n <= 19 
// 
// Related Topics 树 二叉搜索树 数学 动态规划 二叉树 👍 1758 👎 0

import java.util.HashMap;
import java.util.Map;

public class Q96不同的二叉搜索树{
	public static void main(String[] args) {
		Solution solution = new Q96不同的二叉搜索树().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、方法一的优化，方法一有重复计算
// 用一个HashMap存储n和子树数量的映射，如果已经计算过了当前n的子树数量，直接取出用即可
// https://leetcode.cn/problems/unique-binary-search-trees/solution/a-qiu-javadi-gui-jie-fa-by-emeraki-qi2d/
class Solution {
	Map<Integer, Integer> map = new HashMap<>();
    public int numTrees(int n) {
		if(n == 0 || n == 1){
			return 1;
		}

		if(map.containsKey(n)){
			return map.get(n);
		}
		int count = 0;
		for(int i = 1; i <= n; i++){
			// 当用i这个节点当做根节点时
			// 左边有多少种子树
			int leftNum = numTrees(i-1);

			// 右边有多少种子树
			int rightNum = numTrees(n-i);
			//乘起来就是当前节点的子树个数
			count += leftNum * rightNum;
		}
		map.put(n, count);
		return count;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、递归 结果 = 左子树个数 * 右子树个数
// https://leetcode.cn/problems/unique-binary-search-trees/solution/a-qiu-javadi-gui-jie-fa-by-emeraki-qi2d/
class Solution1 {
	public int numTrees(int n) {
		if(n == 0 || n == 1){
			return 1;
		}

		int count = 0;
		for(int i = 1; i <= n; i++){
			// 当用i这个节点当做根节点时
			// 左边有多少种子树
			int leftNum = numTrees(i-1);

			// 右边有多少种子树
			int rightNum = numTrees(n-i);
			//乘起来就是当前节点的子树个数
			count += leftNum * rightNum;
		}
		return count;
	}
}

}

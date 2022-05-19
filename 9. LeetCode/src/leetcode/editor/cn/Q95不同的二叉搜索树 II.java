package leetcode.editor.cn;

//给你一个整数 n ，请你生成并返回所有由 n 个节点组成且节点值从 1 到 n 互不相同的不同 二叉搜索树 。可以按 任意顺序 返回答案。 
//
// 
//
// 
// 
// 示例 1： 
//
// 
//输入：n = 3
//输出：[[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
// 
//
// 示例 2： 
//
// 
//输入：n = 1
//输出：[[1]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= n <= 8 
// 
// 
// 
// Related Topics 树 二叉搜索树 动态规划 回溯 二叉树 👍 1214 👎 0

import sun.reflect.generics.tree.Tree;

import java.util.LinkedList;
import java.util.List;

class Q95不同的二叉搜索树II{
	public static void main(String[] args) {
		Solution solution = new Q95不同的二叉搜索树II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
// 回溯
// https://leetcode.cn/problems/unique-binary-search-trees-ii/solution/bu-tong-de-er-cha-sou-suo-shu-ii-by-leetcode-solut/
class Solution {
    public List<TreeNode> generateTrees(int n) {
		if(n == 0){
			return new LinkedList<>();
		}
		return generateTrees(1, n);
    }
    public List<TreeNode> generateTrees(int start, int end){
    	List<TreeNode> allTrees = new LinkedList<>();
    	if(start > end){
    		allTrees.add(null);
    		return allTrees;
		}

    	// 枚举可行根节点
		for(int i = start; i <= end; i++){
			// 获得所有可行的左子树集合
			List<TreeNode> leftTrees = generateTrees(start, i - 1);

			// 获得所有可行的右子树集合
			List<TreeNode> rightTrees = generateTrees(i + 1, end);

			for(TreeNode left : leftTrees){
				for(TreeNode right: rightTrees){
					TreeNode curTree = new TreeNode(i);
					curTree.left = left;
					curTree.right = right;
					allTrees.add(curTree);
				}
			}
		}
		return allTrees;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

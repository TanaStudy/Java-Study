package leetcode.editor.cn;

//给你二叉树的根节点 root ，返回它节点值的 前序 遍历。 
//
// 
//
// 示例 1： 
//
// 
//输入：root = [1,null,2,3]
//输出：[1,2,3]
// 
//
// 示例 2： 
//
// 
//输入：root = []
//输出：[]
// 
//
// 示例 3： 
//
// 
//输入：root = [1]
//输出：[1]
// 
//
// 示例 4： 
//
// 
//输入：root = [1,2]
//输出：[1,2]
// 
//
// 示例 5： 
//
// 
//输入：root = [1,null,2]
//输出：[1,2]
// 
//
// 
//
// 提示： 
//
// 
// 树中节点数目在范围 [0, 100] 内 
// -100 <= Node.val <= 100 
// 
//
// 
//
// 进阶：递归算法很简单，你可以通过迭代算法完成吗？ 
// Related Topics 栈 树 深度优先搜索 二叉树 👍 709 👎 0

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class Q144二叉树的前序遍历{
	public static void main(String[] args) {
		Solution solution = new Q144二叉树的前序遍历().new Solution();
		
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
// 方法二、迭代
// https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/er-cha-shu-de-qian-xu-bian-li-by-leetcode-solution/
class Solution {
    public List<Integer> preorderTraversal(TreeNode root) {
		List<Integer> res = new ArrayList<>();
		Stack<TreeNode> stack = new Stack<>();

		while (root != null || !stack.isEmpty()){
			while (root != null){
				res.add(root.val);
				stack.add(root);
				root = root.left;
			}
			root = stack.pop();
			root = root.right;
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、递归
class Solution1 {
	List<Integer> ans = new ArrayList<>();
	public List<Integer> preorderTraversal(TreeNode root) {
		preOrder(root);
		return ans;
	}
	public void preOrder(TreeNode root){
		if(root == null){
			return;
		}
		ans.add(root.val);
		preOrder(root.left);
		preOrder(root.right);
	}
}

}

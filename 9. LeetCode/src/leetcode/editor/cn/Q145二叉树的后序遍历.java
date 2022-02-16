package leetcode.editor.cn;

//给你一棵二叉树的根节点 root ，返回其节点值的 后序遍历 。 
//
// 
//
// 示例 1： 
//
// 
//输入：root = [1,null,2,3]
//输出：[3,2,1]
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
// 
//
// 提示： 
//
// 
// 树中节点的数目在范围 [0, 100] 内 
// -100 <= Node.val <= 100 
// 
//
// 
//
// 进阶：递归算法很简单，你可以通过迭代算法完成吗？ 
// Related Topics 栈 树 深度优先搜索 二叉树 👍 743 👎 0

import java.util.*;

public class Q145二叉树的后序遍历{
	public static void main(String[] args) {
		Solution solution = new Q145二叉树的后序遍历().new Solution();
		
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
// 方法三、标准递归
// https://leetcode-cn.com/problems/binary-tree-postorder-traversal/solution/er-cha-shu-de-hou-xu-bian-li-by-leetcode-solution/
class Solution {
    public List<Integer> postorderTraversal(TreeNode root) {
		List<Integer> res = new ArrayList<>();
		Stack<TreeNode> stack = new Stack<>();
		TreeNode prev = null;
		while (root != null || ! stack.isEmpty()){
			while (root != null){
				stack.add(root);
				root = root.left;
			}
			root = stack.pop();
			if(root.right == null || prev == root.right){
				res.add(root.val);
				prev = root;
				root = null;
			}else {
				stack.add(root);
				root = root.right;
			}
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、递归
class Solution1 {
	List<Integer> ans = new ArrayList<>();
	public List<Integer> postorderTraversal(TreeNode root) {
		postOrder(root);
		return ans;
	}
	public void postOrder(TreeNode root){
		if(root == null){
			return;
		}
		postOrder(root.left);
		postOrder(root.right);
		ans.add(root.val);

	}
}

// 方法二、递归
// 后序是左右中，按照中右左的顺序，然后再逆序
class Solution2 {
	public List<Integer> postorderTraversal(TreeNode root) {
		List<Integer> res = new ArrayList<>();
		Stack<TreeNode> stack = new Stack<>();

		while (root != null || !stack.isEmpty()){
			while (root != null){
				res.add(root.val);
				stack.add(root);
				root = root.right;
			}
			root = stack.pop();
			root = root.left;
		}
		Collections.reverse(res);
		return res;
	}
}

}

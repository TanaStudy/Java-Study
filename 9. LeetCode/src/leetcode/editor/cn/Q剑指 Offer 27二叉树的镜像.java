package leetcode.editor.cn;

//请完成一个函数，输入一个二叉树，该函数输出它的镜像。 
//
// 例如输入： 
//
// 4 
// / \ 
// 2 7 
// / \ / \ 
//1 3 6 9 
//镜像输出： 
//
// 4 
// / \ 
// 7 2 
// / \ / \ 
//9 6 3 1 
//
// 
//
// 示例 1： 
//
// 输入：root = [4,2,7,1,3,6,9]
//输出：[4,7,2,9,6,3,1]
// 
//
// 
//
// 限制： 
//
// 0 <= 节点个数 <= 1000 
//
// 注意：本题与主站 226 题相同：https://leetcode-cn.com/problems/invert-binary-tree/ 
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 293 👎 0

import java.util.Stack;

class Q剑指Offer27二叉树的镜像{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer27二叉树的镜像().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
// 解法二、辅助栈
// https://leetcode.cn/problems/er-cha-shu-de-jing-xiang-lcof/solution/mian-shi-ti-27-er-cha-shu-de-jing-xiang-di-gui-fu-/
class Solution {
    public TreeNode mirrorTree(TreeNode root) {
		if (root == null) {
			return root;
		}
		Stack<TreeNode> stack = new Stack<>();
		stack.add(root);
		while (!stack.isEmpty()) {
			TreeNode cur = stack.pop();
			if (cur.left != null) {
				stack.add(cur.left);
			}
			if (cur.right != null) {
				stack.add(cur.right);
			}
			TreeNode temp = cur.left;
			cur.left = cur.right;
			cur.right = temp;
		}
		return root;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 解法一、递归，暂存左子树，分别递归左子树和右子树
// https://leetcode.cn/problems/er-cha-shu-de-jing-xiang-lcof/solution/mian-shi-ti-27-er-cha-shu-de-jing-xiang-di-gui-fu-/
class Solution1 {
	public TreeNode mirrorTree(TreeNode root) {
		if (root == null) {
			return root;
		}
		TreeNode temp = root.left;
		root.left = mirrorTree(root.right);
		root.right = mirrorTree(temp);
		return root;
	}
}

}

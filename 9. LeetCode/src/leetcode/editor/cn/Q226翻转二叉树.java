package leetcode.editor.cn;

//翻转一棵二叉树。 
//
// 示例： 
//
// 输入： 
//
//      4
//   /   \
//  2     7
// / \   / \
//1   3 6   9 
//
// 输出： 
//
//      4
//   /   \
//  7     2
// / \   / \
//9   6 3   1 
//
// 备注: 
//这个问题是受到 Max Howell 的 原问题 启发的 ： 
//
// 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。 
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 1113 👎 0

import java.util.LinkedList;
import java.util.Queue;

public class Q226翻转二叉树{
	public static void main(String[] args) {
		Solution solution = new Q226翻转二叉树().new Solution();
		
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
// 方法一、迭代
// https://leetcode-cn.com/problems/invert-binary-tree/solution/dong-hua-yan-shi-liang-chong-shi-xian-226-fan-zhua/
class Solution {
    public TreeNode invertTree(TreeNode root) {
    	if(root == null){
    		return null;
		}
		Queue<TreeNode> queue = new LinkedList<>();
		queue.add(root);
		while (!queue.isEmpty()){
			TreeNode cur = queue.poll();
			TreeNode temp = cur.right;
			cur.right = cur.left;
			cur.left = temp;

			if(cur.left != null){
				queue.add(cur.left);
			}
			if(cur.right != null){
				queue.add(cur.right);
			}
		}
		return root;
    }

}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、递归
// https://leetcode-cn.com/problems/invert-binary-tree/solution/dong-hua-yan-shi-liang-chong-shi-xian-226-fan-zhua/
class Solution1 {
	public TreeNode invertTree(TreeNode root) {
		if(root == null){
			return null;
		}
		TreeNode temp = root.right;
		root.right = root.left;
		root.left = temp;
		invertTree(root.right);
		invertTree(root.left);
		return root;
	}

}

}

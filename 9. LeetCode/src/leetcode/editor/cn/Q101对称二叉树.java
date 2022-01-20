package leetcode.editor.cn;

//给定一个二叉树，检查它是否是镜像对称的。 
//
// 
//
// 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。 
//
//     1
//   / \
//  2   2
// / \ / \
//3  4 4  3
// 
//
// 
//
// 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的: 
//
//     1
//   / \
//  2   2
//   \   \
//   3    3
// 
//
// 
//
// 进阶： 
//
// 你可以运用递归和迭代两种方法解决这个问题吗？ 
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 1669 👎 0

import java.util.LinkedList;
import java.util.Queue;

public class Q101对称二叉树{
	public static void main(String[] args) {
		Solution solution = new Q101对称二叉树().new Solution();
		
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
// https://leetcode-cn.com/problems/symmetric-tree/solution/dong-hua-yan-shi-101-dui-cheng-er-cha-shu-by-user7/
class Solution {
    public boolean isSymmetric(TreeNode root) {
		Queue<TreeNode> queue = new LinkedList<>();
		queue.add(root.left);
		queue.add(root.right);
		while (!queue.isEmpty()){
			TreeNode left = queue.poll();
			TreeNode right = queue.poll();
			if(left == null && right == null){
				continue;
			}
			if(left == null || right == null){
				return false;
			}
			if(left.val != right.val){
				return false;
			}
			queue.add(left.left);
			queue.add(right.right);
			queue.add(left.right);
			queue.add(right.left);
		}
		return true;
    }

}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、递归
// https://leetcode-cn.com/problems/symmetric-tree/solution/dong-hua-yan-shi-101-dui-cheng-er-cha-shu-by-user7/
class Solution1 {
	public boolean isSymmetric(TreeNode root) {
		return isSymm(root,root);
	}
	public boolean isSymm(TreeNode root1, TreeNode root2){
		//递归的终止条件是两个节点都为空
		//或者两个节点中有一个为空
		//或者两个节点的值不相等
		if(root1 == null && root2 == null){
			return true;
		}
		if(root1 == null || root2 == null){
			return false;
		}
		if(root1.val != root2.val){
			return false;
		}
		return isSymm(root1.left,root2.right) && isSymm(root1.right,root2.left);
	}
}

}

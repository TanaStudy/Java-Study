package leetcode.editor.cn;

//给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。 
//
// 
//
// 示例： 
//二叉树：[3,9,20,null,null,15,7], 
//
// 
//    3
//   / \
//  9  20
//    /  \
//   15   7
// 
//
// 返回其层序遍历结果： 
//
// 
//[
//  [3],
//  [9,20],
//  [15,7]
//]
// 
// Related Topics 树 广度优先搜索 二叉树 👍 1126 👎 0

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class Q102二叉树的层序遍历{
	public static void main(String[] args) {
		Solution solution = new Q102二叉树的层序遍历().new Solution();
		TreeNode root =  new TreeNode(3);
		root.left = new TreeNode(9);
		root.right = new TreeNode(20);
		root.left.left = null;
		root.left.right = null;
		root.right.left = new TreeNode(15);
		root.right.right = new TreeNode(7);
		System.out.println(solution.levelOrder(root));
		
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
class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
			Queue<TreeNode> q = new LinkedList<>();
			List<List<Integer>> res = new ArrayList<>();
			if(root == null){
				return res;
			}
			q.add(root);
			while (!q.isEmpty()){
				int size = q.size();
				List<Integer> cur = new LinkedList<>();
				for(int i = 0; i < size; i++){
					TreeNode temp = q.poll();
					cur.add(temp.val);
					if(temp.left!=null){
						q.add(temp.left);
					}
					if(temp.right!=null){
						q.add(temp.right);
					}
				}
				res.add(cur);
			}
			return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

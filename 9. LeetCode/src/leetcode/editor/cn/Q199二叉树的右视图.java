package leetcode.editor.cn;

//给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。 
//
// 
//
// 示例 1: 
//
// 
//
// 
//输入: [1,2,3,null,5,null,4]
//输出: [1,3,4]
// 
//
// 示例 2: 
//
// 
//输入: [1,null,3]
//输出: [1,3]
// 
//
// 示例 3: 
//
// 
//输入: []
//输出: []
// 
//
// 
//
// 提示: 
//
// 
// 二叉树的节点个数的范围是 [0,100] 
// -100 <= Node.val <= 100 
// 
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 605 👎 0

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class Q199二叉树的右视图{
	public static void main(String[] args) {
		Solution solution = new Q199二叉树的右视图().new Solution();
		TreeNode root =  new TreeNode(1);
		root.left = new TreeNode(2);
		root.right = new TreeNode(3);
		root.left.left = null;
		root.left.right = null;
		root.right.left = new TreeNode(4);
		root.right.right = new TreeNode(5);
		System.out.println(solution.rightSideView(root));
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
	List<Integer> res = new ArrayList<>();

	public List<Integer> rightSideView(TreeNode root) {
 		dfs(root, 0); // 从根节点开始访问，根节点深度是0
		return res;
 	}

 	public void dfs(TreeNode root, int depth) {
		if (root == null) {
 			return;
 		}
		// 先访问 当前节点，再递归地访问 右子树 和 左子树。
 		if (depth == res.size()) {   // 如果当前节点所在深度还没有出现在res里，说明在该深度下当前节点是第一个被访问的节点，因此将当前节点加入res中。
 			res.add(root.val);
 		}
 		depth++;
		System.out.println(depth);
		dfs(root.right, depth);
		dfs(root.left, depth);
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、BFS
// 层次遍历，每一层最后一个元素加入结果中
// https://leetcode-cn.com/problems/binary-tree-right-side-view/solution/jian-dan-bfsdfs-bi-xu-miao-dong-by-sweetiee/
class Solution1 {
	public List<Integer> rightSideView(TreeNode root) {
		List<Integer> res = new ArrayList<>();
		if(root == null){
			return res;
		}
		Queue<TreeNode> queue = new LinkedList<>();
		queue.add(root);
		while (!queue.isEmpty()){
			int size = queue.size();
			for(int i = 0; i < size; i++){
				TreeNode temp = queue.poll();
				if(temp.left != null){
					queue.add(temp.left);
				}
				if(temp.right != null){
					queue.add(temp.right);
				}
				if(i == size - 1){
					res.add(temp.val);
				}
			}
		}
		return res;

	}
}

}

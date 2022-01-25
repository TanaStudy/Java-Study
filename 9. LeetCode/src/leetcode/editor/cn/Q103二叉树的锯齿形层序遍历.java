package leetcode.editor.cn;

//给你二叉树的根节点 root ，返回其节点值的 锯齿形层序遍历 。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。 
//
// 
//
// 示例 1： 
//
// 
//输入：root = [3,9,20,null,null,15,7]
//输出：[[3],[20,9],[15,7]]
// 
//
// 示例 2： 
//
// 
//输入：root = [1]
//输出：[[1]]
// 
//
// 示例 3： 
//
// 
//输入：root = []
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// 树中节点数目在范围 [0, 2000] 内 
// -100 <= Node.val <= 100 
// 
// Related Topics 树 广度优先搜索 二叉树 👍 577 👎 0

import java.util.*;

public class Q103二叉树的锯齿形层序遍历{
	public static void main(String[] args) {
		Solution solution = new Q103二叉树的锯齿形层序遍历().new Solution();
		
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
// 思路与层次遍历相同，每一层使用双端队列储存
// https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/solution/er-cha-shu-de-ju-chi-xing-ceng-xu-bian-l-qsun/
class Solution {
    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {
		Queue<TreeNode> queue = new LinkedList<>();
		List<List<Integer>> res = new ArrayList<>();
		boolean tag = true;
		if(root == null){
			return res;
		}

		queue.add(root);
		while (!queue.isEmpty()){
			int size = queue.size();
			Deque<Integer> cur = new LinkedList<>();
			for(int i = 0; i < size; i++){
				TreeNode temp = queue.poll();
				if (tag){
					cur.addLast(temp.val);
				}else {
					cur.addFirst(temp.val);
				}
				if(temp.left != null){
					queue.add(temp.left);
				}
				if(temp.right != null){
					queue.add(temp.right);
				}
			}
			tag = !tag;
			res.add((List<Integer>) cur);
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

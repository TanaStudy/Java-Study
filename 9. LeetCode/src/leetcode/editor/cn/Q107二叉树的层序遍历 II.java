package leetcode.editor.cn;

//给你二叉树的根节点 root ，返回其节点值 自底向上的层序遍历 。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历） 
//
// 
//
// 示例 1： 
//
// 
//输入：root = [3,9,20,null,null,15,7]
//输出：[[15,7],[9,20],[3]]
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
// -1000 <= Node.val <= 1000 
// 
// Related Topics 树 广度优先搜索 二叉树 👍 545 👎 0

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

class Q107二叉树的层序遍历II{
	public static void main(String[] args) {
		Solution solution = new Q107二叉树的层序遍历II().new Solution();
		
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
// 跟层序遍历一样，插的时候头插
// https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/solution/er-cha-shu-de-ceng-ci-bian-li-ii-by-leetcode-solut/
class Solution {
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
    	LinkedList<List<Integer>> res = new LinkedList<>();
    	if(root == null){
    		return res;
		}
		Queue<TreeNode> queue = new LinkedList<>();
    	queue.offer(root);
    	while (!queue.isEmpty()){
    		List<Integer> level = new ArrayList<>();
    		int size = queue.size();
    		for(int i = 0; i < size; i++){
    			TreeNode node = queue.poll();
    			level.add(node.val);
    			TreeNode left = node.left;
    			TreeNode right = node.right;
    			if(left != null){
    				queue.add(left);
				}
    			if(right != null){
    				queue.add(right);
				}
			}
    		res.addFirst(level);
		}
    	return res;

    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

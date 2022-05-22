package leetcode.editor.cn;

//给定一个二叉树，判断它是否是高度平衡的二叉树。 
//
// 本题中，一棵高度平衡二叉树定义为： 
//
// 
// 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：root = [3,9,20,null,null,15,7]
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：root = [1,2,2,3,3,null,null,4,4]
//输出：false
// 
//
// 示例 3： 
//
// 
//输入：root = []
//输出：true
// 
//
// 
//
// 提示： 
//
// 
// 树中的节点数在范围 [0, 5000] 内 
// -10⁴ <= Node.val <= 10⁴ 
// 
// Related Topics 树 深度优先搜索 二叉树 👍 1015 👎 0

public class Q110平衡二叉树{
	public static void main(String[] args) {
		Solution solution = new Q110平衡二叉树().new Solution();
		
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
// 方法二、自底向上判断：对二叉树做先序遍历，从底至顶返回子树最大高度，若判定某子树不是平衡树则 “剪枝” ，直接向上返回。
// https://leetcode.cn/problems/balanced-binary-tree/solution/balanced-binary-tree-di-gui-fang-fa-by-jin40789108/
class Solution {
    public boolean isBalanced(TreeNode root) {
    	return recur(root) != -1;
    }
    public int recur(TreeNode root){
    	if(root == null){
    		return 0;
		}
    	int left = recur(root.left);
    	if(left == -1){
    		return -1;
		}
    	int right = recur(root.right);
    	if(right == -1){
    		return -1;
		}
    	return Math.abs(left - right) < 2 ? Math.max(left, right) + 1 : -1;
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、从顶至底（暴力法）判断
// 思路是构造一个获取当前节点最大深度的方法 depth(root) ，通过比较此子树的左右子树的最大高度差abs(depth(root.left) - depth(root.right))，来判断此子树是否是二叉平衡树。
// 若树的所有子树都平衡时，此树才平衡。
// https://leetcode.cn/problems/balanced-binary-tree/solution/balanced-binary-tree-di-gui-fang-fa-by-jin40789108/
class Solution1 {
	public boolean isBalanced(TreeNode root) {
		if(root == null){
			return true;
		}
		return Math.abs(depth(root.left) - depth(root.right)) <= 1 && isBalanced(root.left) && isBalanced(root.right);
	}
	public int depth(TreeNode root){
		if(root == null){
			return 0;
		}
		return Math.max(depth(root.left), depth(root.right)) + 1;
	}
}

}

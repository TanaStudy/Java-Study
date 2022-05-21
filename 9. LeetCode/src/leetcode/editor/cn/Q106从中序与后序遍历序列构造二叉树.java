package leetcode.editor.cn;

//给定两个整数数组 inorder 和 postorder ，其中 inorder 是二叉树的中序遍历， postorder 是同一棵树的后序遍历，请你构造并
//返回这颗 二叉树 。 
//
// 
//
// 示例 1: 
//
// 
//输入：inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
//输出：[3,9,20,null,null,15,7]
// 
//
// 示例 2: 
//
// 
//输入：inorder = [-1], postorder = [-1]
//输出：[-1]
// 
//
// 
//
// 提示: 
//
// 
// 1 <= inorder.length <= 3000 
// postorder.length == inorder.length 
// -3000 <= inorder[i], postorder[i] <= 3000 
// inorder 和 postorder 都由 不同 的值组成 
// postorder 中每一个值都在 inorder 中 
// inorder 保证是树的中序遍历 
// postorder 保证是树的后序遍历 
// 
// Related Topics 树 数组 哈希表 分治 二叉树 👍 747 👎 0

import java.util.HashMap;

public class Q106从中序与后序遍历序列构造二叉树{
	public static void main(String[] args) {
		Solution solution = new Q106从中序与后序遍历序列构造二叉树().new Solution();
		
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
// 在后序遍历序列中,最后一个元素为树的根节点
// 在中序遍历序列中,根节点的左边为左子树，根节点的右边为右子树
// https://leetcode.cn/problems/construct-binary-tree-from-inorder-and-postorder-traversal/solution/tu-jie-gou-zao-er-cha-shu-wei-wan-dai-xu-by-user72/
class Solution {
	HashMap<Integer, Integer> memo = new HashMap<>();

    public TreeNode buildTree(int[] inorder, int[] postorder) {
		for(int i = 0; i < inorder.length; i++){
			memo.put(inorder[i], i);
		}
		TreeNode root = buildTree(inorder, postorder,0, inorder.length - 1, 0, postorder.length - 1);
		return root;
    }
    public TreeNode buildTree(int[] inorder, int[] postorder,int is, int ie, int ps, int pe){
    	if(ie < is || pe < ps){
    		return null;
		}
    	int root = postorder[pe];
    	int ri = memo.get(root);

    	TreeNode node = new TreeNode(root);
    	node.left = buildTree(inorder, postorder,is, ri - 1, ps, ps + ri - is - 1);
    	node.right = buildTree(inorder, postorder,ri + 1, ie, ps + ri - is, pe - 1);
    	return node;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

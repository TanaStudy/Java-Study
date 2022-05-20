package leetcode.editor.cn;

//给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并
//返回其根节点。 
//
// 
//
// 示例 1: 
//
// 
//输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//输出: [3,9,20,null,null,15,7]
// 
//
// 示例 2: 
//
// 
//输入: preorder = [-1], inorder = [-1]
//输出: [-1]
// 
//
// 
//
// 提示: 
//
// 
// 1 <= preorder.length <= 3000 
// inorder.length == preorder.length 
// -3000 <= preorder[i], inorder[i] <= 3000 
// preorder 和 inorder 均 无重复 元素 
// inorder 均出现在 preorder 
// preorder 保证 为二叉树的前序遍历序列 
// inorder 保证 为二叉树的中序遍历序列 
// 
// Related Topics 树 数组 哈希表 分治 二叉树 👍 1595 👎 0

import java.util.HashMap;
import java.util.Map;

public class Q105从前序与中序遍历序列构造二叉树{
	public static void main(String[] args) {
		Solution solution = new Q105从前序与中序遍历序列构造二叉树().new Solution();
		
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
// 递归
// 前序遍历 [ 根节点, [左子树的前序遍历结果], [右子树的前序遍历结果] ]
// 中序遍历 [ [左子树的中序遍历结果], 根节点, [右子树的中序遍历结果] ]
// https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solution/cong-qian-xu-yu-zhong-xu-bian-li-xu-lie-gou-zao-9/
class Solution {
	public Map<Integer, Integer> indexMap;
    public TreeNode buildTree(int[] preorder, int[] inorder) {
		int n = preorder.length;
		indexMap = new HashMap<Integer, Integer>();
		for(int i = 0; i < n; i++){
			indexMap.put(inorder[i],i);
		}
		return myBuildTree(preorder, inorder, 0, n - 1, 0, n - 1);
    }
    public TreeNode myBuildTree(int[] preorder, int[] inorder, int preorder_left, int preorder_right, int inorder_left, int inorder_right){
    	if(preorder_left > preorder_right){
    		return null;
		}
		// 前序遍历中的第一个节点就是根节点
		int preorder_root = preorder_left;
		// 在中序遍历中定位根节点
		int inorder_root = indexMap.get(preorder[preorder_root]);

		// 先把根节点建立出来
		TreeNode root = new TreeNode(preorder[preorder_root]);
		// 得到左子树中的节点数目
		int size_left_subtree = inorder_root - inorder_left;
		// 递归地构造左子树，并连接到根节点
		// 先序遍历中「从 左边界+1 开始的 size_left_subtree」个元素就对应了中序遍历中「从 左边界 开始到 根节点定位-1」的元素
		root.left = myBuildTree(preorder, inorder, preorder_left + 1, preorder_left + size_left_subtree, inorder_left, inorder_root - 1);
		// 递归地构造右子树，并连接到根节点
		// 先序遍历中「从 左边界+1+左子树节点数目 开始到 右边界」的元素就对应了中序遍历中「从 根节点定位+1 到 右边界」的元素
		root.right = myBuildTree(preorder, inorder, preorder_left + size_left_subtree + 1, preorder_right, inorder_root + 1, inorder_right);
    	return root;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给定一个整数数组，它表示BST(即 二叉搜索树 )的 先序遍历 ，构造树并返回其根。 
//
// 保证 对于给定的测试用例，总是有可能找到具有给定需求的二叉搜索树。 
//
// 二叉搜索树 是一棵二叉树，其中每个节点， Node.left 的任何后代的值 严格小于 Node.val , Node.right 的任何后代的值 严格大
//于 Node.val。 
//
// 二叉树的 前序遍历 首先显示节点的值，然后遍历Node.left，最后遍历Node.right。 
//
// 
//
// 示例 1： 
//
// 
//
// 
//输入：preorder = [8,5,1,7,10,12]
//输出：[8,5,10,1,7,null,12]
// 
//
// 示例 2: 
//
// 
//输入: preorder = [1,3]
//输出: [1,null,3]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= preorder.length <= 100 
// 1 <= preorder[i] <= 10^8 
// preorder 中的值 互不相同 
// 
//
// 
// Related Topics 栈 树 二叉搜索树 数组 二叉树 单调栈 👍 200 👎 0

import java.util.Arrays;
import java.util.HashMap;

public class Q1008前序遍历构造二叉搜索树{
	public static void main(String[] args) {
		Solution solution = new Q1008前序遍历构造二叉搜索树().new Solution();
		
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
// 方法二、二分查找到比根节点大的第一个节点，是右子树根节点
// https://leetcode-cn.com/problems/construct-binary-search-tree-from-preorder-traversal/solution/jian-kong-er-cha-shu-by-leetcode/
class Solution {
    public TreeNode bstFromPreorder(int[] preorder) {
		int len = preorder.length;
		return dfs(preorder, 0, len - 1);

    }
    public TreeNode dfs(int[] preorder, int left, int right){
    	if(left > right){
    		return null;
		}
    	TreeNode root = new TreeNode(preorder[left]);
    	if(left == right){
    		return root;
		}
    	int l = left;
    	int r = right;
    	while (l < r){
    		int mid = l + (r - l + 1) / 2;
    		if(preorder[mid] < preorder[left]){
    			l = mid;
			}else{
    			r = mid - 1;
			}
		}
    	TreeNode leftTree = dfs(preorder, left + 1, l);
    	TreeNode rightTree = dfs(preorder, l + 1, right);
    	root.left = leftTree;
    	root.right = rightTree;
    	return root;
	}


}
// 方法一、二叉搜索树的中序遍历是排序数组，前序遍历排序之后得到中序遍历，转换成剑指offer07
// https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/solution/mian-shi-ti-07-zhong-jian-er-cha-shu-di-gui-fa-qin/
class Solution1 {
	HashMap<Integer, Integer> map = new HashMap<>();
	int[] preorder;
	public TreeNode bstFromPreorder(int[] preorder) {
		this.preorder = preorder;
		int[] inorder = new int[preorder.length];
		for(int i = 0; i < preorder.length; i++){
			inorder[i] = preorder[i];
		}
		Arrays.sort(inorder);
		for(int i = 0; i < inorder.length; i++){
			map.put(inorder[i], i);
		}
		return recur(0,0, inorder.length - 1);
	}
	public TreeNode recur(int preIndex, int leftIndex, int rightIndex){
		if(leftIndex > rightIndex){
			return null;
		}
		int pre = preorder[preIndex];
		TreeNode root = new TreeNode(pre);
		int idx = map.get(pre);
		root.left = recur(preIndex + 1, leftIndex, idx - 1);
		root.right = recur(preIndex + (idx - 1 - leftIndex + 1) + 1, idx + 1, rightIndex);
		return root;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

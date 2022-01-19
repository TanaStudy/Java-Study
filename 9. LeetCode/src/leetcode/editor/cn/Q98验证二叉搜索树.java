package leetcode.editor.cn;

//给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。 
//
// 有效 二叉搜索树定义如下： 
//
// 
// 节点的左子树只包含 小于 当前节点的数。 
// 节点的右子树只包含 大于 当前节点的数。 
// 所有左子树和右子树自身必须也是二叉搜索树。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：root = [2,1,3]
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：root = [5,1,4,null,null,3,6]
//输出：false
//解释：根节点的值是 5 ，但是右子节点的值是 4 。
// 
//
// 
//
// 提示： 
//
// 
// 树中节点数目范围在[1, 10⁴] 内 
// -2³¹ <= Node.val <= 2³¹ - 1 
// 
// Related Topics 树 深度优先搜索 二叉搜索树 二叉树 👍 1361 👎 0

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class Q98验证二叉搜索树{
	public static void main(String[] args) {
		Solution solution = new Q98验证二叉搜索树().new Solution();
		TreeNode root = new TreeNode(2);
		root.left = new TreeNode(1);
		root.right = new TreeNode(3);
		System.out.println(Double.MIN_VALUE);

		
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
// 方法三、中序遍历的递归写法
class Solution {
	long inorder = Long.MIN_VALUE;
    public boolean isValidBST(TreeNode root) {
			if(root == null){
				return true;
			}
			if(!isValidBST(root.left)){
				return false;
			}
			if(root.val <= inorder){
				return false;
			}
			inorder = root.val;
			return isValidBST(root.right);
		}

}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一：中序遍历
// 先中序遍历获得list，再判断
class Solution1 {
	public boolean isValidBST(TreeNode root) {
		List<Integer> list = inorder(root);
		System.out.println(list);
		for(int i = 0; i < list.size() - 1; i++){
			if(list.get(i + 1) <= list.get(i)){
				return false;
			}
		}
		return true;
	}
	public List<Integer> inorder(TreeNode root){
		List<Integer> ans = new ArrayList<>();
		Stack<TreeNode> stack = new Stack<>();
		while (root != null || !stack.isEmpty()){
			while (root != null){
				stack.add(root);
				root = root.left;
			}
			root = stack.pop();
			ans.add(root.val);
			root = root.right;
		}
		return ans;
	}
}

// 方法一的优化，在中序遍历的同时判断
// https://leetcode-cn.com/problems/validate-binary-search-tree/solution/yan-zheng-er-cha-sou-suo-shu-by-leetcode-solution/
// inorder的初始化需要是Long.MIN_VALUE，若为Integer.MIN_VALUE会出错，注意Double.MIN_VALUE是一个正值
class Solution2 {
	public boolean isValidBST(TreeNode root) {
		long inorder = Long.MIN_VALUE;
		Stack<TreeNode> stack = new Stack<>();
		while (root != null || !stack.isEmpty()){
			while (root != null){
				stack.add(root);
				root = root.left;
			}
			root = stack.pop();
			if(root.val <= inorder){
				return false;
			}
			inorder = root.val;
			root = root.right;
		}
		return true;
	}

}



}

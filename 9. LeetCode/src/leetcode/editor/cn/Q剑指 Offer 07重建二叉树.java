package leetcode.editor.cn;

//输入某二叉树的前序遍历和中序遍历的结果，请构建该二叉树并返回其根节点。 
//
// 假设输入的前序遍历和中序遍历的结果中都不含重复的数字。 
//
// 
//
// 示例 1: 
//
// 
//Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//Output: [3,9,20,null,null,15,7]
// 
//
// 示例 2: 
//
// 
//Input: preorder = [-1], inorder = [-1]
//Output: [-1]
// 
//
// 
//
// 限制： 
//
// 0 <= 节点个数 <= 5000 
//
// 
//
// 注意：本题与主站 105 题重复：https://leetcode-cn.com/problems/construct-binary-tree-from-
//preorder-and-inorder-traversal/ 
// Related Topics 树 数组 哈希表 分治 二叉树 👍 690 👎 0

import java.util.HashMap;

class Q剑指Offer07重建二叉树{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer07重建二叉树().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
// https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/solution/mian-shi-ti-07-zhong-jian-er-cha-shu-di-gui-fa-qin/
// 中序遍历  [ 左子树 | 根节点 | 右子树 ]
// 前序遍历  [ 根节点 | 左子树 | 右子树 ]
class Solution {
	HashMap<Integer, Integer> map = new HashMap<>();//标记中序遍历
	int[] preorder;//保留的先序遍历

    public TreeNode buildTree(int[] preorder, int[] inorder) {
		this.preorder = preorder;
		for(int i = 0; i < inorder.length; i++){
			map.put(inorder[i], i);
		}
		return recur(0,0, inorder.length - 1);
    }
	/**
	 * @param preIndex  先序遍历的索引
	 * @param leftIndex  中序遍历的索引
	 * @param rightIndex 中序遍历的索引
	 */
    public TreeNode recur(int preIndex, int leftIndex, int rightIndex){
		// 相等就是自己
    	if(leftIndex > rightIndex){
    		return null;
		}
		// root_idx是在先序里面的
    	int pre = preorder[preIndex];
    	TreeNode root = new TreeNode(pre);
		// 有了先序的,再根据先序的，在中序中获 当前根的索引
    	int idx = map.get(pre);
		//左子树的根节点就是 左子树的(前序遍历）第一个，就是+1,左边边界就是left，右边边界是中间区分的idx-1
    	root.left = recur(preIndex + 1, leftIndex, idx - 1);
		//由根节点在中序遍历的idx 区分成2段,idx 就是根
		//右子树的根，就是右子树（前序遍历）的第一个,就是当前根节点 加上左子树的数量
		// pre_root_idx 当前的根  左子树的长度 = 左子树的左边-右边 (idx-1 - in_left_idx +1) 。最后+1就是右子树的根了
    	root.right = recur(preIndex + (idx - 1 - leftIndex + 1) + 1, idx + 1, rightIndex);
    	return root;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

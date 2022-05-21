package leetcode.editor.cn;

//给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 高度平衡 二叉搜索树。 
//
// 高度平衡 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [-10,-3,0,5,9]
//输出：[0,-3,9,-10,null,5]
//解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：
//
// 
//
// 示例 2： 
//
// 
//输入：nums = [1,3]
//输出：[3,1]
//解释：[1,null,3] 和 [3,1] 都是高度平衡二叉搜索树。
// 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 10⁴ 
// -10⁴ <= nums[i] <= 10⁴ 
// nums 按 严格递增 顺序排列 
// 
// Related Topics 树 二叉搜索树 数组 分治 二叉树 👍 1041 👎 0

public class Q108将有序数组转换为二叉搜索树{
	public static void main(String[] args) {
		Solution solution = new Q108将有序数组转换为二叉搜索树().new Solution();
		
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
// 递归，root节点为中位数，然后递归构造左部分为左子树，右部分为右子树
// https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/solution/jian-dan-di-gui-bi-xu-miao-dong-by-sweetiee/
class Solution {
    public TreeNode sortedArrayToBST(int[] nums) {
		return dfs(nums, 0, nums.length - 1);
    }
    public TreeNode dfs(int[] nums, int lo, int hi){
    	if(lo > hi){
    		return null;
		}
		// 以升序数组的中间元素作为根节点 root。
    	int mid = lo + (hi - lo) / 2;
    	TreeNode root = new TreeNode(nums[mid]);
		// 递归的构建 root 的左子树与右子树。
		root.left =  dfs(nums, lo, mid - 1);
		root.right = dfs(nums, mid + 1, hi);
		return root;

	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

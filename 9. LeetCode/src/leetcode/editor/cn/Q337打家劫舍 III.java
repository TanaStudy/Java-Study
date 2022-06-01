package leetcode.editor.cn;

//小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为 root 。 
//
// 除了 root 之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果 两个直接
//相连的房子在同一天晚上被打劫 ，房屋将自动报警。 
//
// 给定二叉树的 root 。返回 在不触动警报的情况下 ，小偷能够盗取的最高金额 。 
//
// 
//
// 示例 1: 
//
// 
//
// 
//输入: root = [3,2,3,null,3,null,1]
//输出: 7 
//解释: 小偷一晚能够盗取的最高金额 3 + 3 + 1 = 7 
//
// 示例 2: 
//
// 
//
// 
//输入: root = [3,4,5,1,3,null,1]
//输出: 9
//解释: 小偷一晚能够盗取的最高金额 4 + 5 = 9
// 
//
// 
//
// 提示： 
//
// 
//
// 
// 树的节点数在 [1, 10⁴] 范围内 
// 0 <= Node.val <= 10⁴ 
// 
// Related Topics 树 深度优先搜索 动态规划 二叉树 👍 1231 👎 0

import java.util.HashMap;

class Q337打家劫舍III{
	public static void main(String[] args) {
		Solution solution = new Q337打家劫舍III().new Solution();
		
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
// 方法三、动态规划
// https://leetcode-cn.com/problems/house-robber-iii/solution/san-chong-fang-fa-jie-jue-shu-xing-dong-tai-gui-hu/
class Solution {
    public int rob(TreeNode root) {
		int[] result = robInternal(root);
		return Math.max(result[0], result[1]);
    }
    public int[] robInternal(TreeNode root){
    	if(root == null){
    		return new int[2];
		}
    	int[] result = new int[2];

    	int[] left = robInternal(root.left);
    	int[] right = robInternal(root.right);

    	result[0] = Math.max(left[0], left[1]) + Math.max(right[0], right[1]);
    	result[1] = left[0] + right[0] + root.val;
    	return result;

	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、暴力递归
// https://leetcode-cn.com/problems/house-robber-iii/solution/san-chong-fang-fa-jie-jue-shu-xing-dong-tai-gui-hu/
class Solution1 {
	public int rob(TreeNode root) {
		if(root == null){
			return 0;
		}
		int money = root.val;
		if(root.left != null){
			money += (rob(root.left.left) + rob(root.left.right));
		}
		if(root.right != null){
			money += (rob(root.right.left) + rob(root.right.right));
		}

		return Math.max(money, rob(root.left) + rob(root.right));
	}
}

// 方法二、方法一的优化
// https://leetcode-cn.com/problems/house-robber-iii/solution/san-chong-fang-fa-jie-jue-shu-xing-dong-tai-gui-hu/
class Solution2 {
	public int rob(TreeNode root) {
		HashMap<TreeNode, Integer> memo = new HashMap<>();
		return robInternal(root,memo);
	}
	public int robInternal(TreeNode root, HashMap<TreeNode, Integer>memo){
		if(root == null){
			return 0;
		}
		if(memo.containsKey(root)){
			return memo.get(root);
		}
		int money = root.val;

		if(root.left != null){
			money += (robInternal(root.left.left, memo) + robInternal(root.left.right, memo));
		}
		if(root.right != null){
			money += (robInternal(root.right.left, memo) + robInternal(root.right.right, memo));
		}
		int result = Math.max(money, robInternal(root.left,memo) + robInternal(root.right, memo));
		memo.put(root, result);
		return result;
	}
}

}

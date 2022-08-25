package leetcode.editor.cn;

//从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。 
//
// 
//
// 例如: 
//给定二叉树: [3,9,20,null,null,15,7], 
//
//     3
//   / \
//  9  20
//    /  \
//   15   7
// 
//
// 返回： 
//
// [3,9,20,15,7]
// 
//
// 
//
// 提示： 
//
// 
// 节点总数 <= 1000 
// 
// Related Topics 树 广度优先搜索 二叉树 👍 229 👎 0

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

class Q剑指Offer32I从上到下打印二叉树{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer32I从上到下打印二叉树().new Solution();
		
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
// 层序遍历，用辅助队列
// https://leetcode.cn/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/solution/mian-shi-ti-32-i-cong-shang-dao-xia-da-yin-er-ch-4/
class Solution {
    public int[] levelOrder(TreeNode root) {
		if (root == null) {
			return new int[0];
		}
		Queue<TreeNode> queue = new LinkedList<>();
		queue.add(root);
		ArrayList<Integer> res = new ArrayList<>();
		while (!queue.isEmpty()) {
			TreeNode cur = queue.poll();
			if (cur.left != null) {
				queue.add(cur.left);
			}
			if (cur.right != null) {
				queue.add(cur.right);
			}
			res.add(cur.val);
		}
		int[] nums = new int[res.size()];
		for (int i = 0; i < res.size(); i++) {
			nums[i] = res.get(i);
		}
		return nums;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

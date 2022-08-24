package leetcode.editor.cn;

//请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。 
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
// 返回其层次遍历结果： 
//
// [
//  [3],
//  [20,9],
//  [15,7]
//]
// 
//
// 
//
// 提示： 
//
// 
// 节点总数 <= 1000 
// 
// Related Topics 树 广度优先搜索 二叉树 👍 248 👎 0

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

class Q剑指Offer32III从上到下打印二叉树III{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer32III从上到下打印二叉树III().new Solution();
		
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
// z字型层序遍历，用一个flag标记左还是右
// https://leetcode.cn/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/solution/cong-shang-dao-xia-da-yin-er-cha-shu-iii-c3rs/
class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
		Queue<TreeNode> queue = new LinkedList<>();
		List<List<Integer>> res = new ArrayList<>();
		if (root == null) {
			return res;
		}
		queue.add(root);
		boolean isOrderLeft = true;
		while (!queue.isEmpty()) {
			LinkedList<Integer> temp = new LinkedList<>();
			int size = queue.size();
			for (int i = 0; i < size; i++) {
				TreeNode cur = queue.poll();
				if (isOrderLeft) {
					temp.addLast(cur.val);
				}else {
					temp.addFirst(cur.val);
				}
				if (cur.left != null) {
					queue.add(cur.left);
				}
				if (cur.right != null) {
					queue.add(cur.right);
				}
			}
			isOrderLeft = !isOrderLeft;
			res.add(temp);
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

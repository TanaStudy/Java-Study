package leetcode.editor.cn;

//给定一个单链表的头节点 head ，其中的元素 按升序排序 ，将其转换为高度平衡的二叉搜索树。 
//
// 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差不超过 1。 
//
// 
//
// 示例 1: 
//
// 
//
// 
//输入: head = [-10,-3,0,5,9]
//输出: [0,-3,9,-10,null,5]
//解释: 一个可能的答案是[0，-3,9，-10,null,5]，它表示所示的高度平衡的二叉搜索树。
// 
//
// 示例 2: 
//
// 
//输入: head = []
//输出: []
// 
//
// 
//
// 提示: 
//
// 
// head 中的节点数在[0, 2 * 10⁴] 范围内 
// -10⁵ <= Node.val <= 10⁵ 
// 
// Related Topics 树 二叉搜索树 链表 分治 二叉树 👍 703 👎 0

import java.util.List;

public class Q109有序链表转换二叉搜索树{
	public static void main(String[] args) {
		Solution solution = new Q109有序链表转换二叉搜索树().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
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
// 递归，先用快慢指针找到中点，然后递归构造左部分为左子树，右部分为右子树
// https://leetcode.cn/problems/convert-sorted-list-to-binary-search-tree/solution/jing-gang-shan-zhao-zi-long-qu-zhong-dia-gzbh/
class Solution {
    public TreeNode sortedListToBST(ListNode head) {
    	return helper(head, null);
    }
    public TreeNode helper(ListNode left, ListNode right){
    	if(left == right){
    		return null;
		}
    	ListNode mid = getMid(left, right);
    	TreeNode node = new TreeNode(mid.val);
    	node.left = helper(left, mid);
    	node.right = helper(mid.next, right);
    	return node;
	}

	public ListNode getMid(ListNode left, ListNode right){
    	ListNode slow = left;
    	ListNode fast = left;
    	while (fast != right && fast.next != right){
    		slow = slow.next;
    		fast = fast.next.next;
		}
    	return slow;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

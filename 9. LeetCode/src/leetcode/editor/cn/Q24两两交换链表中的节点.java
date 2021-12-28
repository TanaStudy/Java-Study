package leetcode.editor.cn;

//给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。 
//
// 
//
// 示例 1： 
//
// 
//输入：head = [1,2,3,4]
//输出：[2,1,4,3]
// 
//
// 示例 2： 
//
// 
//输入：head = []
//输出：[]
// 
//
// 示例 3： 
//
// 
//输入：head = [1]
//输出：[1]
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点的数目在范围 [0, 100] 内 
// 0 <= Node.val <= 100 
// 
// Related Topics 递归 链表 👍 1174 👎 0

public class Q24两两交换链表中的节点{
	public static void main(String[] args) {
		Solution solution = new Q24两两交换链表中的节点().new Solution();
		
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
// 递归
// https://leetcode-cn.com/problems/swap-nodes-in-pairs/solution/liang-liang-jiao-huan-lian-biao-zhong-de-jie-di-91/
class Solution {
    public ListNode swapPairs(ListNode head) {
    	if(head == null || head.next == null){
    		return head;
		}
    	ListNode one = head;
    	ListNode two = one.next;
    	ListNode three = two.next;

    	two.next = one;
    	one.next = swapPairs(three);

    	return two;

    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 非递归
class Solution1 {
	public ListNode swapPairs(ListNode head) {
		ListNode dummy  = new ListNode();
		dummy.next = head;
		ListNode pre = dummy;
		while (pre.next != null && pre.next.next!=null){
			ListNode l1 = pre.next;
			ListNode l2 = pre.next.next;
			l1.next = l2.next;
			l2.next = l1;
			pre.next = l2;
			pre = l1;
		}
		return dummy.next;

	}
}
}

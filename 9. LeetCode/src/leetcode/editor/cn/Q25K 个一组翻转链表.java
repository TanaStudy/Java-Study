package leetcode.editor.cn;

//给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。 
//
// k 是一个正整数，它的值小于或等于链表的长度。 
//
// 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。 
//
// 进阶： 
//
// 
// 你可以设计一个只使用常数额外空间的算法来解决此问题吗？ 
// 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：head = [1,2,3,4,5], k = 2
//输出：[2,1,4,3,5]
// 
//
// 示例 2： 
//
// 
//输入：head = [1,2,3,4,5], k = 3
//输出：[3,2,1,4,5]
// 
//
// 示例 3： 
//
// 
//输入：head = [1,2,3,4,5], k = 1
//输出：[1,2,3,4,5]
// 
//
// 示例 4： 
//
// 
//输入：head = [1], k = 1
//输出：[1]
// 
//
// 
// 
//
// 提示： 
//
// 
// 列表中节点的数量在范围 sz 内 
// 1 <= sz <= 5000 
// 0 <= Node.val <= 1000 
// 1 <= k <= sz 
// 
// Related Topics 递归 链表 👍 1403 👎 0

class Q25K个一组翻转链表{
	public static void main(String[] args) {
		Solution solution = new Q25K个一组翻转链表().new Solution();
		ListNode head = new ListNode(1);
		ListNode pre = head;
		for(int i = 2; i < 6; i++){
			pre.next = new ListNode(i);
			pre = pre.next;
		}


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
// https://leetcode-cn.com/problems/reverse-nodes-in-k-group/solution/tu-jie-kge-yi-zu-fan-zhuan-lian-biao-by-user7208t/
class Solution {
    public ListNode reverseKGroup(ListNode head, int k) {
		ListNode dummy = new ListNode();
		dummy.next = head;
		ListNode pre = dummy;
		ListNode end = dummy;

		while (end.next != null){
			for(int i = 0; i < k && end != null; i++){
				end = end.next;
			}
			if(end == null){
				break;
			}
			ListNode next = end.next;
			end.next = null;

			ListNode start = pre.next;
			pre.next = reverse(start);

			start.next = next;
			pre = start;
			end = pre;
		}
		return dummy.next;

    }
    public ListNode reverse(ListNode head){
		ListNode l1 = null;
		ListNode l2 = head;
		while(l2 != null){
			ListNode temp = l2.next;
			l2.next = l1;
			l1 = l2;
			l2 = temp;
		}
		return l1;


	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

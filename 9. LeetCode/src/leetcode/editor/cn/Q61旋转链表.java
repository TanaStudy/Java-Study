	package leetcode.editor.cn;

//给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。 
//
// 
//
// 示例 1： 
//
// 
//输入：head = [1,2,3,4,5], k = 2
//输出：[4,5,1,2,3]
// 
//
// 示例 2： 
//
// 
//输入：head = [0,1,2], k = 4
//输出：[2,0,1]
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点的数目在范围 [0, 500] 内 
// -100 <= Node.val <= 100 
// 0 <= k <= 2 * 10⁹ 
// 
// Related Topics 链表 双指针 👍 689 👎 0

public class Q61旋转链表{
	public static void main(String[] args) {
		Solution solution = new Q61旋转链表().new Solution();
		
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
// https://leetcode-cn.com/problems/rotate-list/solution/xuan-zhuan-lian-biao-by-leetcode-solutio-woq1/
// 先把链表连成环，然后在新链表的第 (n - 1) - (k % n) 个节点为尾结点，断开链表。返回后面一个节点为头结点
class Solution {
    public ListNode rotateRight(ListNode head, int k) {
    	if(head == null || head.next == null){
    		return head;
		}
		ListNode end = head;
		int len = 1;
		while (end.next != null){
			end = end.next;
			len++;
		}
		end.next = head;
		int move = len - 1 - k % len;
		while (move > 0){
			head = head.next;
			move--;
		}
		ListNode newHead = head.next;
		head.next = null;
		return newHead;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

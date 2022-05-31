package leetcode.editor.cn;

//给定一个单链表 L 的头节点 head ，单链表 L 表示为： 
//
// 
//L0 → L1 → … → Ln - 1 → Ln
// 
//
// 请将其重新排列后变为： 
//
// 
//L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → … 
//
// 不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。 
//
// 
//
// 示例 1： 
//
// 
//
// 
//输入：head = [1,2,3,4]
//输出：[1,4,2,3] 
//
// 示例 2： 
//
// 
//
// 
//输入：head = [1,2,3,4,5]
//输出：[1,5,2,4,3] 
//
// 
//
// 提示： 
//
// 
// 链表的长度范围为 [1, 5 * 10⁴] 
// 1 <= node.val <= 1000 
// 
// Related Topics 栈 递归 链表 双指针 👍 927 👎 0

import java.util.List;

public class Q143重排链表{
	public static void main(String[] args) {
		Solution solution = new Q143重排链表().new Solution();
		
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
// 寻找链表中点 + 链表逆序 + 合并链表
// 1.找到原链表的中点（参考「876. 链表的中间结点」）。快慢指针来
// 2.将原链表的右半端反转（参考「206. 反转链表」）。迭代法实现链表的反转。
// 3.将原链表的两端合并。两链表长度相差不超过 1，因此直接合并即可。
// https://leetcode.cn/problems/reorder-list/solution/zhong-pai-lian-biao-by-leetcode-solution/
class Solution {
    public void reorderList(ListNode head) {
		if(head == null){
			return;
		}
		ListNode mid = middleNode(head);
		ListNode l1 = head;
		ListNode l2 = mid.next;
		mid.next = null;
		l2 = reverseList(l2);
		mergeList(l1,l2);
    }
    public ListNode middleNode(ListNode head){
    	ListNode slow = head;
    	ListNode fast = head;
    	while (fast.next != null && fast.next.next != null){
    		slow = slow.next;
    		fast = fast.next.next;
		}
    	return slow;
	}

	public ListNode reverseList(ListNode head){
    	ListNode prev = null;
    	ListNode curr = head;
    	while (curr != null){
    		ListNode nextTemp = curr.next;
    		curr.next = prev;
    		prev = curr;
    		curr = nextTemp;
		}
    	return prev;
	}

	public void mergeList(ListNode l1, ListNode l2){
    	ListNode l1_tmp;
		ListNode l2_tmp;
		while (l1 != null && l2 != null){
			l1_tmp = l1.next;
			l2_tmp = l2.next;

			l1.next = l2;
			l1 = l1_tmp;

			l2.next = l1;
			l2 = l2_tmp;
		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
// 
//
// 示例 1： 
//
// 
//输入：head = [1,2,6,3,4,5,6], val = 6
//输出：[1,2,3,4,5]
// 
//
// 示例 2： 
//
// 
//输入：head = [], val = 1
//输出：[]
// 
//
// 示例 3： 
//
// 
//输入：head = [7,7,7,7], val = 7
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// 列表中的节点数目在范围 [0, 10⁴] 内 
// 1 <= Node.val <= 50 
// 0 <= val <= 50 
// 
// Related Topics 递归 链表 👍 778 👎 0

public class Q203移除链表元素{
	public static void main(String[] args) {
		Solution solution = new Q203移除链表元素().new Solution();
		
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
// https://leetcode-cn.com/problems/remove-linked-list-elements/solution/203yi-chu-lian-biao-yuan-su-by-lewis-dxstabdzew/
class Solution {
    public ListNode removeElements(ListNode head, int val) {
		ListNode dummy = new ListNode();
		dummy.next = head;
		ListNode pre = dummy;
		while (pre.next != null){
			if(pre.next.val == val){
				pre.next = pre.next.next;
			}else {
				pre = pre.next;
			}
		}
		return dummy.next;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

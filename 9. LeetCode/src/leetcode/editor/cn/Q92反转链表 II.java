package leetcode.editor.cn;

//给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链
//表节点，返回 反转后的链表 。
// 
//
// 示例 1： 
//
// 
//输入：head = [1,2,3,4,5], left = 2, right = 4
//输出：[1,4,3,2,5]
// 
//
// 示例 2： 
//
// 
//输入：head = [5], left = 1, right = 1
//输出：[5]
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点数目为 n 
// 1 <= n <= 500 
// -500 <= Node.val <= 500 
// 1 <= left <= right <= n 
// 
//
// 
//
// 进阶： 你可以使用一趟扫描完成反转吗？ 
// Related Topics 链表 👍 1107 👎 0

class Q92反转链表II{
	public static void main(String[] args) {
		Solution solution = new Q92反转链表II().new Solution();
		ListNode head = new ListNode(1);
		ListNode dummy = head;
		for(int i = 2; i < 6; i++){
			dummy.next = new ListNode(i);
			dummy = dummy.next;
		}
//		ListNode res = solution.reverseBetween(head,3,4);
		while (head != null){
			System.out.println(head.val);
			head = head.next;
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
// 头插法
// https://leetcode-cn.com/problems/reverse-linked-list-ii/solution/fan-zhuan-lian-biao-ii-by-leetcode-solut-teyq/
class Solution {
    public ListNode reverseBetween(ListNode head, int left, int right) {
		ListNode dummy = new ListNode();
		dummy.next = head;
		ListNode pre = dummy;
		for(int i = 0; i < left - 1; i++){
			pre = pre.next;
		}
		ListNode cur = pre.next;
		for(int i = 0; i < right - left; i++){
			ListNode next = cur.next;
			cur.next = next.next;
			next.next = pre.next;
			pre.next = next;
		}
		return dummy.next;
    }
}
//leetcode submit region end(Prohibit modification and deletion)


}

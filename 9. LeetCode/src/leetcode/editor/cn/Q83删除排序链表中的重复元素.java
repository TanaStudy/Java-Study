package leetcode.editor.cn;

//存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除所有重复的元素，使每个元素 只出现一次 。 
//
// 返回同样按升序排列的结果链表。 
//
// 
//
// 示例 1： 
//
// 
//输入：head = [1,1,2]
//输出：[1,2]
// 
//
// 示例 2： 
//
// 
//输入：head = [1,1,2,3,3]
//输出：[1,2,3]
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点数目在范围 [0, 300] 内 
// -100 <= Node.val <= 100 
// 题目数据保证链表已经按升序排列 
// 
// Related Topics 链表 👍 704 👎 0

public class Q83删除排序链表中的重复元素{
	public static void main(String[] args) {
		Solution solution = new Q83删除排序链表中的重复元素().new Solution();
		ListNode head = new ListNode(1);
		ListNode cur = head;
		for(int i = 0; i < 4; i++){
			cur.next = new ListNode(1);
			cur = cur.next;
		}
		ListNode res = solution.deleteDuplicates(head);
		while (res != null){
			System.out.println(res.val);
			res = res.next;
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
class Solution {
    public ListNode deleteDuplicates(ListNode head) {
		ListNode cur = head;
		while (cur != null && cur.next != null){
			if (cur.val == cur.next.val){
				cur.next = cur.next.next;
			}else {
				cur = cur.next;
			}
		}
		return head;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。 
//
// 请你将两个数相加，并以相同形式返回一个表示和的链表。 
//
// 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。 
//
// 
//
// 示例 1： 
//
// 
//输入：l1 = [2,4,3], l2 = [5,6,4]
//输出：[7,0,8]
//解释：342 + 465 = 807
// 
//
// 示例 2： 
//
// 
//输入：l1 = [0], l2 = [0]
//输出：[0]
// 
//
// 示例 3： 
//
// 
//输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//输出：[8,9,9,9,0,0,0,1]
// 
//
// 
//
// 提示： 
//
// 
// 每个链表中的节点数在范围 [1, 100] 内 
// 0 <= Node.val <= 9 
// 题目数据保证列表表示的数字不含前导零 
// 
// Related Topics 递归 链表 数学 👍 7062 👎 0

public class Q2两数相加{
	public static void main(String[] args) {
		Solution solution = new Q2两数相加().new Solution();
		ListNode A = new ListNode(2);
		A.next = new ListNode(6);
		A.next.next = new ListNode(9);
		
		ListNode B = new ListNode(2);
		B.next = new ListNode(4);

		ListNode ans = solution.addTwoNumbers(A, B);
		while(ans != null){
			System.out.println(ans.val);
			ans = ans.next;
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
// 模拟
// https://leetcode-cn.com/problems/add-two-numbers/solution/liang-shu-xiang-jia-by-leetcode-solution/
class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
    	ListNode head = new ListNode();
    	ListNode cur = head;
		int carry = 0;
    	while(l1 != null || l2 !=null){
    		int v1,v2;
    		if(l1 == null){
				v1 = 0;
			}else {
    			v1 = l1.val;
				l1 = l1.next;
			}
    		if(l2 == null){
				v2 = 0;
			}else{
    			v2 = l2.val;
				l2 = l2.next;
			}
    		int sum = v1 + v2 + carry;
			cur.next = new ListNode(sum % 10);
			cur = cur.next;
			carry = sum / 10;
		}
    	if(carry > 0){
			cur.next = new ListNode(carry);
		}
    	return head.next;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。 
//
// 
//
// 示例 1： 
//
// 输入：head = [1,3,2]
//输出：[2,3,1] 
//
// 
//
// 限制： 
//
// 0 <= 链表长度 <= 10000 
// Related Topics 栈 递归 链表 双指针 👍 217 👎 0

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

class Q剑指Offer06从尾到头打印链表{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer06从尾到头打印链表().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
// 方法二、递归
// https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/solution/mian-shi-ti-06-cong-wei-dao-tou-da-yin-lian-biao-d/
class Solution {
	List<Integer> temp = new ArrayList<>();
    public int[] reversePrint(ListNode head) {
    	recur(head);
    	int[] ans = new int[temp.size()];
    	for(int i = 0; i < ans.length; i++){
    		ans[i] = temp.get(i);
		}
    	return ans;
    }
    public void recur(ListNode head){
    	if(head == null){
    		return;
		}
    	recur(head.next);
    	temp.add(head.val);
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、栈
// https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/solution/mian-shi-ti-06-cong-wei-dao-tou-da-yin-lian-biao-d/
class Solution1 {
	public int[] reversePrint(ListNode head) {
		Stack<ListNode> stack = new Stack<>();
		while (head != null){
			stack.add(head);
			head = head.next;
		}
		int[] ans = new int[stack.size()];
		for(int i = 0; i < ans.length;i++){
			ans[i] = stack.pop().val;
		}
		return ans;
	}
}

}

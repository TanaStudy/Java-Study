package leetcode.editor.cn;

//给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。 
//
// 
//
// 示例 1： 
//
// 
//输入：head = [1,2,2,1]
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：head = [1,2]
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点数目在范围[1, 10⁵] 内 
// 0 <= Node.val <= 9 
// 
//
// 
//
// 进阶：你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？ 
// Related Topics 栈 递归 链表 双指针 👍 1210 👎 0

import java.util.ArrayList;
import java.util.List;

public class Q234回文链表{
	public static void main(String[] args) {
		Solution solution = new Q234回文链表().new Solution();
		
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
// 方法二、快慢指针
//
class Solution {
    public boolean isPalindrome(ListNode head) {
		ListNode pre = null;
		ListNode slow = head;
		ListNode fast = head;
		while (fast != null && fast.next != null){
			fast = fast.next.next;
			ListNode temp = slow.next;
			slow.next = pre;
			pre = slow;
			slow = temp;
		}
		if(fast != null){
			slow = slow.next;
		}
		while (slow != null && pre != null){
			if(slow.val!=pre.val){
				return false;
			}
			slow = slow.next;
			pre = pre.next;
		}
		return true;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、暴力
// 复制链表到数组，再用双指针判断
// https://leetcode-cn.com/problems/palindrome-linked-list/solution/hui-wen-lian-biao-by-leetcode-solution/
class Solution1 {
	public boolean isPalindrome(ListNode head) {
		List<Integer> list = new ArrayList<>();
		while (head != null){
			list.add(head.val);
			head = head.next;
		}
		int left = 0;
		int right = list.size() - 1;
		while (left < right){
			if(list.get(left) != list.get(right)){
				return false;
			}
			left++;
			right--;
		}
		return true;
	}
}

}

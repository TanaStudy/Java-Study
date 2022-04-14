package leetcode.editor.cn;

//给你一个链表数组，每个链表都已经按升序排列。 
//
// 请你将所有链表合并到一个升序链表中，返回合并后的链表。 
//
// 
//
// 示例 1： 
//
// 输入：lists = [[1,4,5],[1,3,4],[2,6]]
//输出：[1,1,2,3,4,4,5,6]
//解释：链表数组如下：
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//将它们合并到一个有序链表中得到。
//1->1->2->3->4->4->5->6
// 
//
// 示例 2： 
//
// 输入：lists = []
//输出：[]
// 
//
// 示例 3： 
//
// 输入：lists = [[]]
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// k == lists.length 
// 0 <= k <= 10^4 
// 0 <= lists[i].length <= 500 
// -10^4 <= lists[i][j] <= 10^4 
// lists[i] 按 升序 排列 
// lists[i].length 的总和不超过 10^4 
// 
// Related Topics 链表 分治 堆（优先队列） 归并排序 👍 1663 👎 0

import java.util.PriorityQueue;

public class Q23合并K个升序链表{
	public static void main(String[] args) {
		Solution solution = new Q23合并K个升序链表().new Solution();
		
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
// 方法三、优先级队列
// https://leetcode-cn.com/problems/merge-k-sorted-lists/solution/he-bing-kge-sheng-xu-lian-biao-java-by-s-27q3/
// 时间复杂度O(nlogk)
class Solution {
    public ListNode mergeKLists(ListNode[] lists) {
		int len = lists.length;
		if(len == 0){
			return null;
		}
		ListNode dummy = new ListNode();
		ListNode pre = dummy;

		PriorityQueue<ListNode> pq = new PriorityQueue<>((a,b) -> a.val - b.val);
		for (ListNode list : lists) {
			if (list != null) {
				pq.add(list);
			}
		}
		while (!pq.isEmpty()){
			ListNode cur = pq.poll();
			pre.next = cur;
			if(cur.next != null){
				pq.add(cur.next);
			}
			pre = pre.next;
		}
		return dummy.next;
    }


}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、直接合并
// 调用合并两个有序数组的方法，两两合并，时间复杂度O(k²n)
class Solution1 {
	public ListNode mergeKLists(ListNode[] lists) {
		ListNode res = null;
		for(int i = 0; i < lists.length; i++){
			res = mergeTwoLists(res, lists[i]);
		}
		return res;
	}
	public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
		ListNode head = new ListNode();
		ListNode list3 = head;

		while (list1 != null && list2 != null) {
			if (list1.val < list2.val) {
				list3.next = list1;
				list1 = list1.next;
			} else {
				list3.next = list2;
				list2 = list2.next;
			}
			list3 = list3.next;
		}
		if (list1 != null) {
			list3.next = list1;
		}
		if (list2 != null) {
			list3.next = list2;
		}
		return head.next;
	}
}
// 方法二、分治合并
// https://leetcode-cn.com/problems/merge-k-sorted-lists/solution/he-bing-kge-pai-xu-lian-biao-by-leetcode-solutio-2/
// 两两合并，时间复杂度为O(kn×logk)
class Solution2 {
		public ListNode mergeKLists(ListNode[] lists) {
			if(lists.length == 0){
				return null;
			}
			return merge(lists, 0, lists.length - 1);
		}
		public ListNode merge(ListNode[] lists, int left, int right){
			if(left == right){
				return lists[left];
			}
			int mid = left + (right - left) / 2;
			ListNode l1 = merge(lists, left, mid);
			ListNode l2 = merge(lists, mid + 1, right);
			return mergeTwoLists(l1,l2);
		}
		public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
			ListNode head = new ListNode();
			ListNode list3 = head;

			while (list1 != null && list2 != null) {
				if (list1.val < list2.val) {
					list3.next = list1;
					list1 = list1.next;
				} else {
					list3.next = list2;
					list2 = list2.next;
				}
				list3 = list3.next;
			}
			if (list1 != null) {
				list3.next = list1;
			}
			if (list2 != null) {
				list3.next = list2;
			}
			return head.next;
		}

	}

}

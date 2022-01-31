package leetcode.editor.cn;

//给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。 
//
// 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到
//链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。 
//
// 不允许修改 链表。 
//
// 
// 
//
// 
//
// 示例 1： 
//
// 
//
// 
//输入：head = [3,2,0,-4], pos = 1
//输出：返回索引为 1 的链表节点
//解释：链表中有一个环，其尾部连接到第二个节点。
// 
//
// 示例 2： 
//
// 
//
// 
//输入：head = [1,2], pos = 0
//输出：返回索引为 0 的链表节点
//解释：链表中有一个环，其尾部连接到第一个节点。
// 
//
// 示例 3： 
//
// 
//
// 
//输入：head = [1], pos = -1
//输出：返回 null
//解释：链表中没有环。
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点的数目范围在范围 [0, 10⁴] 内 
// -10⁵ <= Node.val <= 10⁵ 
// pos 的值为 -1 或者链表中的一个有效索引 
// 
//
// 
//
// 进阶：你是否可以使用 O(1) 空间解决此题？ 
// Related Topics 哈希表 链表 双指针 👍 1304 👎 0


import java.util.HashSet;


class Q142环形链表II{
	public static void main(String[] args) {
		Solution solution = new Q142环形链表II().new Solution();

	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
// 方法二、
// https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/linked-list-cycle-ii-kuai-man-zhi-zhen-shuang-zhi-/
// 快慢指针从头开始，第一次相遇后，快指针指向头结点，第二次相遇即为头结点
public class Solution {
    public ListNode detectCycle(ListNode head) {
		ListNode slow = head;
		ListNode fast = head;
		while (true){
			if(fast == null || fast.next == null){
				return null;
			}
			slow = slow.next;
			fast = fast.next.next;
			if(slow == fast){
				break;
			}
		}
		fast = head;
		while (slow != fast){
			slow = slow.next;
			fast = fast.next;
		}
		return slow;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、hashset
// https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/huan-xing-lian-biao-ii-by-leetcode-solution/
// HashSet第二次加入的元素为入口
public class Solution1 {
	public ListNode detectCycle(ListNode head) {
		HashSet<ListNode> map = new HashSet<>();
		while (head != null){
			if(!map.contains(head)){
				map.add(head);
				head = head.next;
			}else {
				return head;
			}
		}
		return null;
	}
}

}

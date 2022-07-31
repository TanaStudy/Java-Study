package leetcode.editor.cn;

//用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的
//功能。(若队列中没有元素，deleteHead 操作返回 -1 ) 
//
// 
//
// 示例 1： 
//
// 输入：
//["CQueue","appendTail","deleteHead","deleteHead"]
//[[],[3],[],[]]
//输出：[null,null,3,-1]
// 
//
// 示例 2： 
//
// 输入：
//["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
//[[],[],[5],[2],[],[]]
//输出：[null,-1,null,null,5,2]
// 
//
// 提示： 
//
// 
// 1 <= values <= 10000 
// 最多会对 appendTail、deleteHead 进行 10000 次调用 
// 
// Related Topics 栈 设计 队列 👍 402 👎 0

import java.util.Stack;

class Q剑指Offer09用两个栈实现队列{
	public static void main(String[] args) {
        CQueue solution = new Q剑指Offer09用两个栈实现队列().new CQueue();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 加入队尾 appendTail()函数： 将数字 val 加入栈 A 即可。
// 删除队首deleteHead()函数： 有以下三种情况。
//  1. 当栈 B 不为空： B中仍有已完成倒序的元素，因此直接返回 B 的栈顶元素。
//  2. 否则，当 A 为空： 即两个栈都为空，无元素，因此返回 -1−1 。
//  3. 否则： 将栈 A 元素全部转移至栈 B 中，实现元素倒序，并返回栈 B 的栈顶元素。
//
//  https://leetcode.cn/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/solution/mian-shi-ti-09-yong-liang-ge-zhan-shi-xian-dui-l-2/
class CQueue {

    Stack<Integer> s1;
    Stack<Integer> s2;
    public CQueue() {
        s1 = new Stack<>();
        s2 = new Stack<>();
    }
    
    public void appendTail(int value) {
        s1.add(value);
    }
    
    public int deleteHead() {
        if(!s2.isEmpty()){
            return s2.pop();
        }
        if(s1.isEmpty()){
            return -1;
        }
        while (!s1.isEmpty()){
            s2.add(s1.pop());
        }
        return s2.pop();
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * CQueue obj = new CQueue();
 * obj.appendTail(value);
 * int param_2 = obj.deleteHead();
 */
//leetcode submit region end(Prohibit modification and deletion)

}

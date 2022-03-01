package leetcode.editor.cn;

//请你设计并实现一个满足 LRU (最近最少使用) 缓存 约束的数据结构。 
//
// 实现 LRUCache 类： 
//
// 
// 
// 
// LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存 
// int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。 
// void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 
//key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。 
// 
//
// 函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。 
// 
// 
//
// 
//
// 示例： 
//
// 
//输入
//["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
//输出
//[null, null, null, 1, null, -1, null, -1, 3, 4]
//
//解释
//LRUCache lRUCache = new LRUCache(2);
//lRUCache.put(1, 1); // 缓存是 {1=1}
//lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
//lRUCache.get(1);    // 返回 1
//lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
//lRUCache.get(2);    // 返回 -1 (未找到)
//lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
//lRUCache.get(1);    // 返回 -1 (未找到)
//lRUCache.get(3);    // 返回 3
//lRUCache.get(4);    // 返回 4
// 
//
// 
//
// 提示： 
//
// 
// 1 <= capacity <= 3000 
// 0 <= key <= 10000 
// 0 <= value <= 10⁵ 
// 最多调用 2 * 10⁵ 次 get 和 put 
// 
// Related Topics 设计 哈希表 链表 双向链表 👍 1947 👎 0

import org.omg.PortableServer.THREAD_POLICY_ID;

import java.util.HashMap;
import java.util.LinkedList;

class Q146LRU缓存{
	public static void main(String[] args) {
		// Solution solution = new Q146LRU 缓存().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 使用HashMap和LinkedList
// https://leetcode-cn.com/problems/lru-cache/solution/lru-ce-lue-xiang-jie-he-shi-xian-by-labuladong/
class LRUCache {
    class Node{
        public int key, val;
        public Node next, prev;
        public Node(int k, int v){
            this.key = k;
            this.val = v;
        }
    }
    class DoubleList{
        public Node head, tail;
        public int size;

        public void addFirst(Node node){
            if(head == null){
                head = tail = node;
            }else {
                Node n = head;
                n.prev = node;
                node.next = n;
                head = node;
            }
            size++;
        }

        public void remove(Node node){
            if(head == node && tail == node){
                head = null;
                tail = null;
            }else if(tail == node){
                node.prev.next = null;
                tail = node.prev;
            }else if(head == node){
                node.next.prev = null;
                head = node.next;
            }else {
                node.prev.next = node.next;
                node.next.prev = node.prev;
            }
            size--;
        }
        public Node removeLast(){
            Node node = tail;
            remove(tail);
            return node;
        }
        public int size(){
            return size;
        }
    }
    public HashMap<Integer, Node> map;
    // public LinkedList<Node> cache;
    public DoubleList cache;
    public int cap;

    public LRUCache(int capacity) {
        map = new HashMap<>();
        cache = new DoubleList();
        this.cap = capacity;
    }
    
    public int get(int key) {
        if(!map.containsKey(key)){
            return -1;
        }
        int val = map.get(key).val;
        put(key, val);
        return val;

    }
    
    public void put(int key, int value) {
        Node x = new Node(key, value);

        if(map.containsKey(key)){
            cache.remove(map.get(key));
            cache.addFirst(x);
            map.put(key,x);
        }else {
            if(cap == cache.size()){
                Node last = cache.removeLast();
                map.remove(last.key);
            }
            cache.addFirst(x);
            map.put(key, x);
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */
//leetcode submit region end(Prohibit modification and deletion)

}

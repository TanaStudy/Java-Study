package leetcode.editor.cn;

//给你一个整数数组 nums 和一个整数 k ，请你返回其中出现频率前 k 高的元素。你可以按 任意顺序 返回答案。 
//
// 
//
// 示例 1: 
//
// 
//输入: nums = [1,1,1,2,2,3], k = 2
//输出: [1,2]
// 
//
// 示例 2: 
//
// 
//输入: nums = [1], k = 1
//输出: [1] 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 10⁵ 
// k 的取值范围是 [1, 数组中不相同的元素的个数] 
// 题目数据保证答案唯一，换句话说，数组中前 k 个高频元素的集合是唯一的 
// 
//
// 
//
// 进阶：你所设计算法的时间复杂度 必须 优于 O(n log n) ，其中 n 是数组大小。 
// Related Topics 数组 哈希表 分治 桶排序 计数 快速选择 排序 堆（优先队列） 👍 1077 👎 0


import java.util.Comparator;
import java.util.HashMap;
import java.util.PriorityQueue;

class Q347前K个高频元素{
	public static void main(String[] args) {
		Solution solution = new Q347前K个高频元素().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// hashmap存频率，最小堆保存频率最大的k的元素
// https://leetcode-cn.com/problems/top-k-frequent-elements/solution/leetcode-di-347-hao-wen-ti-qian-k-ge-gao-pin-yuan-/
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
		HashMap<Integer, Integer> map = new HashMap<>();
		for(int num : nums){
			if(map.containsKey(num)){
				map.put(num, map.get(num) + 1);
			}else {
				map.put(num, 1);
			}
		}

		PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				return map.get(o1) - map.get(o2);
			}
		});

		for(Integer key : map.keySet()){
			if(pq.size() < k){
				pq.add(key);
			}else if(map.get(key) > map.get(pq.peek())){
				pq.remove();
				pq.add(key);
			}
		}
		int[] res = new int[k];
		for(int i = 0; i < k; i++){
			res[i] = pq.remove();
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

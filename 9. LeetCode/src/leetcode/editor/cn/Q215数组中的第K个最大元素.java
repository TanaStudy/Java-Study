package leetcode.editor.cn;

//给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。 
//
// 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。 
//
// 
//
// 示例 1: 
//
// 
//输入: [3,2,1,5,6,4] 和 k = 2
//输出: 5
// 
//
// 示例 2: 
//
// 
//输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
//输出: 4 
//
// 
//
// 提示： 
//
// 
// 1 <= k <= nums.length <= 10⁴ 
// -10⁴ <= nums[i] <= 10⁴ 
// 
// Related Topics 数组 分治 快速选择 排序 堆（优先队列） 👍 1422 👎 0

import java.util.Arrays;
import java.util.PriorityQueue;

public class Q215数组中的第K个最大元素{
	public static void main(String[] args) {
		Solution solution = new Q215数组中的第K个最大元素().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、优先队列
// https://blog.csdn.net/qq_41682302/article/details/95910651
// https://leetcode-cn.com/problems/kth-largest-element-in-an-array/solution/partitionfen-er-zhi-zhi-you-xian-dui-lie-java-dai-/
class Solution {
    public int findKthLargest(int[] nums, int k) {
		PriorityQueue<Integer> pq = new PriorityQueue<>();

//		for(int num : nums){
//			pq.add(num);
//			if(pq.size() > k){
//				pq.poll();
//			}
//		}
		for(int i = 0; i < nums.length; i++){
			if(i < k){
				pq.add(nums[i]);
			}else {
				if(nums[i] > pq.peek()){
					pq.poll();
					pq.add(nums[i]);
				}
			}
		}
		return pq.peek();

    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、直接排序返回
class Solution1 {
	public int findKthLargest(int[] nums, int k) {
		Arrays.sort(nums);
		return nums[nums.length - k];
	}
}

}

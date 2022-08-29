package leetcode.editor.cn;

//输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。 
//
// 
//
// 示例 1： 
//
// 输入：arr = [3,2,1], k = 2
//输出：[1,2] 或者 [2,1]
// 
//
// 示例 2： 
//
// 输入：arr = [0,1,2,1], k = 1
//输出：[0] 
//
// 
//
// 限制： 
//
// 
// 0 <= k <= arr.length <= 10000 
// 0 <= arr[i] <= 10000 
// 
// Related Topics 数组 分治 快速选择 排序 堆（优先队列） 👍 344 👎 0

import java.util.PriorityQueue;

class Q剑指Offer40最小的k个数{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer40最小的k个数().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法三、快排
class Solution {
    public int[] getLeastNumbers(int[] arr, int k) {
		quickSort(arr,0,arr.length-1);
		int[] res = new int[k];
		for(int i = 0; i < k; i++){
			res[i] = arr[i];
		}
		return res;
    }
    public void quickSort(int[] nums, int low, int high){
    	if(low >high){
    		return;
		}
    	int i = low;
    	int j = high;
    	int p = nums[low];
    	while (i < j){
    		while (i < j && nums[j] >= p){
    			j--;
			}
    		while (i < j && nums[i] <= p){
    			i++;
			}
    		if(i < j){
    			int temp = nums[i];
    			nums[i] = nums[j];
    			nums[j] = temp;
			}
		}
    	nums[low] = nums[i];
    	nums[i] = p;
    	quickSort(nums, low, j - 1);
    	quickSort(nums, i + 1, high);
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、小顶堆
class Solution1 {
	public int[] getLeastNumbers(int[] arr, int k) {
		PriorityQueue<Integer> pq = new PriorityQueue<>();
		for(int i = 0; i < arr.length; i++){
			pq.add(arr[i]);
		}
		int[] res = new int[k];
		for(int i = 0; i < k; i++){
			res[i] = pq.poll();
		}
		return res;

	}
}
// 方法二、大顶堆
// https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/solution/3chong-jie-fa-miao-sha-topkkuai-pai-dui-er-cha-sou/#%E4%BA%8C%E3%80%81%E5%A4%A7%E6%A0%B9%E5%A0%86%E5%89%8D-k-%E5%B0%8F-/-%E5%B0%8F%E6%A0%B9%E5%A0%86%EF%BC%88%E5%89%8D-k-%E5%A4%A7,java%E4%B8%AD%E6%9C%89%E7%8E%B0%E6%88%90%E7%9A%84-priorityqueue%EF%BC%8C%E5%AE%9E%E7%8E%B0%E8%B5%B7%E6%9D%A5%E6%9C%80%E7%AE%80%E5%8D%95%EF%BC%9A
class Solution2 {
	public int[] getLeastNumbers(int[] arr, int k) {
		if(k == 0 || arr.length == 0){
			return new int[0];
		}
		PriorityQueue<Integer> pq = new PriorityQueue<>((a,b)->b-a);
		for(int num : arr){
			if(pq.size() < k){
				pq.add(num);
			}else if(num < pq.peek()){
				pq.poll();
				pq.add(num);
			}
		}
		int[] res = new int[k];
		for(int i = 0; i < k; i++){
			res[i] = pq.poll();
		}
		return res;

	}
}

}

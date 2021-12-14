package leetcode.editor.cn;

//给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。 
//
// 算法的时间复杂度应该为 O(log (m+n)) 。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums1 = [1,3], nums2 = [2]
//输出：2.00000
//解释：合并数组 = [1,2,3] ，中位数 2
// 
//
// 示例 2： 
//
// 
//输入：nums1 = [1,2], nums2 = [3,4]
//输出：2.50000
//解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
// 
//
// 示例 3： 
//
// 
//输入：nums1 = [0,0], nums2 = [0,0]
//输出：0.00000
// 
//
// 示例 4： 
//
// 
//输入：nums1 = [], nums2 = [1]
//输出：1.00000
// 
//
// 示例 5： 
//
// 
//输入：nums1 = [2], nums2 = []
//输出：2.00000
// 
//
// 
//
// 提示： 
//
// 
// nums1.length == m 
// nums2.length == n 
// 0 <= m <= 1000 
// 0 <= n <= 1000 
// 1 <= m + n <= 2000 
// -10⁶ <= nums1[i], nums2[i] <= 10⁶ 
// 
// Related Topics 数组 二分查找 分治 👍 4722 👎 0

import java.util.Arrays;

public class Q4寻找两个正序数组的中位数{
	public static void main(String[] args) {
		Solution solution = new Q4寻找两个正序数组的中位数().new Solution();
		int[] num1 = new int[]{1,2};
		int[] num2 = new int[]{3,4};
		System.out.println(solution.findMedianSortedArrays(num1,num2));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、第k个数
// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-w-2/
class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
    	int n = nums1.length;
    	int m = nums2.length;
    	int left = (n + m + 1) / 2;
    	int right = (n + m + 2) / 2;
    	return (getKth(nums1,0,n-1,nums2,0,m-1,left)+getKth(nums1,0,n-1,nums2,0,m-1,right))*0.5;
    	
    }
    public int getKth(int[] nums1, int start1, int end1, int[] nums2, int start2, int end2, int k){
    	int len1 = end1-start1+1;
    	int len2 = end2-start2+1;
    	if(len1 >len2){
    		return getKth(nums2, start2, end2, nums1, start1, end1, k);
		}
    	if(len1 == 0){
    		return nums2[start2+k-1];
		}
    	if(k == 1){
    		return Math.min(nums1[start1],nums2[start2]);
		}

    	int i = start1 + Math.min(len1 , k/2) - 1;
    	int j = start2 + Math.min(len2 , k/2) - 1;

    	if(nums1[i] > nums2[j]){
    		return getKth(nums1,start1,end1,nums2,j+1,end2,k-(j-start2+1));
		}else {
    		return getKth(nums1,i+1,end1,nums2,start2,end2,k-(i-start1+1));
		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、合并两个数组求直接求中位数
class Solution1 {
	public double findMedianSortedArrays(int[] nums1, int[] nums2) {
		int len1 = nums1.length;
		int len2 = nums2.length;
		double[] num = new double[len1+len2];

		int i = 0, j = 0, k = 0;
		while (i < len1 && j < len2){
			if(nums1[i] < nums2[j]){
				num[k++] = nums1[i++];
			}else {
				num[k++] = nums2[j++];
			}
		}
		while(i < len1){
			num[k++] = nums1[i++];
		}
		while(j < len2){
			num[k++] = nums2[j++];
		}
		double res;
		int len = len1+len2;
		if(len % 2 == 0){
			res = (num[len / 2]+num[len / 2 - 1]) / 2;
		}else{
			res = num[(len - 1) / 2];
		}
		return res;
	}
}
}

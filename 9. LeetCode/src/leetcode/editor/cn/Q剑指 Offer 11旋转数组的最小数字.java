package leetcode.editor.cn;

//把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。 
//
// 给你一个可能存在 重复 元素值的数组 numbers ，它原来是一个升序排列的数组，并按上述情形进行了一次旋转。请返回旋转数组的最小元素。例如，数组 [3
//,4,5,1,2] 为 [1,2,3,4,5] 的一次旋转，该数组的最小值为1。 
//
// 示例 1： 
//
// 
//输入：[3,4,5,1,2]
//输出：1
// 
//
// 示例 2： 
//
// 
//输入：[2,2,2,0,1]
//输出：0
// 
//
// 注意：本题与主站 154 题相同：https://leetcode-cn.com/problems/find-minimum-in-rotated-
//sorted-array-ii/ 
// Related Topics 数组 二分查找 👍 489 👎 0

import java.util.Arrays;

class Q剑指Offer11旋转数组的最小数字{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer11旋转数组的最小数字().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 二分
// https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/solution/mian-shi-ti-11-xuan-zhuan-shu-zu-de-zui-xiao-shu-3/
class Solution {
    public int minArray(int[] numbers) {
		int i = 0, j = numbers.length - 1;
		while (i < j){
			int m = (i + j) / 2;
			if(numbers[m] > numbers[j]){
				i = m + 1;
			}else if(numbers[m] < numbers[j]){
				j = m;
			}else if(numbers[m] == numbers[j]){
				j--;
			}
		}
		return numbers[i];
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

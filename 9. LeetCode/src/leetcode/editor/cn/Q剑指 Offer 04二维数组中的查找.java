package leetcode.editor.cn;

//在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个高效的函数，输入这样的一个二维数组和一个
//整数，判断数组中是否含有该整数。 
//
// 
//
// 示例: 
//
// 现有矩阵 matrix 如下： 
//
// 
//[
//  [1,   4,  7, 11, 15],
//  [2,   5,  8, 12, 19],
//  [3,   6,  9, 16, 22],
//  [10, 13, 14, 17, 24],
//  [18, 21, 23, 26, 30]
//]
// 
//
// 给定 target = 5，返回 true。 
//
// 给定 target = 20，返回 false。 
//
// 
//
// 限制： 
//
// 0 <= n <= 1000 
//
// 0 <= m <= 1000 
//
// 
//
// 注意：本题与主站 240 题相同：https://leetcode-cn.com/problems/search-a-2d-matrix-ii/ 
// Related Topics 数组 二分查找 分治 矩阵 👍 523 👎 0

class Q剑指Offer04二维数组中的查找{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer04二维数组中的查找().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、类似二叉搜索树
// https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/solution/mian-shi-ti-04-er-wei-shu-zu-zhong-de-cha-zhao-zuo/
// 从最左下角的数开始搜索，这个数是这一行最小的数，如果比target都大，那么行--；最左下角这个数是这一列最大的，如果比target都小，那么列++
// 时间复杂度O(m+n)
class Solution {
    public boolean findNumberIn2DArray(int[][] matrix, int target) {
		int i = matrix.length - 1, j = 0;

		while (i >= 0 && j < matrix[0].length){
			int flag = matrix[i][j];
			if(flag > target){
				i--;
			}else if(flag < target){
				j++;
			}else if(flag == target){
				return true;
			}
		}
		return false;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、暴力
class Solution1 {
	public boolean findNumberIn2DArray(int[][] matrix, int target) {
		for(int i = 0; i < matrix.length; i++){
			for(int j = 0; j < matrix[0].length; j++){
				if(matrix[i][j] == target){
					return true;
				}
			}
		}
		return false;
	}
}

}

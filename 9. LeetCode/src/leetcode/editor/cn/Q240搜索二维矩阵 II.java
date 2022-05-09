package leetcode.editor.cn;

//编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性： 
//
// 
// 每行的元素从左到右升序排列。 
// 每列的元素从上到下升序排列。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21
//,23,26,30]], target = 5
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21
//,23,26,30]], target = 20
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// m == matrix.length 
// n == matrix[i].length 
// 1 <= n, m <= 300 
// -10⁹ <= matrix[i][j] <= 10⁹ 
// 每行的所有元素从左到右升序排列 
// 每列的所有元素从上到下升序排列 
// -10⁹ <= target <= 10⁹ 
// 
// Related Topics 数组 二分查找 分治 矩阵 👍 970 👎 0

class Q240搜索二维矩阵II{
	public static void main(String[] args) {
		Solution solution = new Q240搜索二维矩阵II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法一、Z 字形查找
// https://leetcode-cn.com/problems/search-a-2d-matrix-ii/solution/sou-suo-er-wei-ju-zhen-ii-by-leetcode-so-9hcx/
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
		int m = matrix.length, n = matrix[0].length;
		int x = 0, y = n - 1;
		while (x < m && y >= 0){
			if(matrix[x][y] == target){
				return true;
			}
			if(matrix[x][y] > target){
				y--;
			}else {
				x++;
			}
		}
		return false;
    }

}
//leetcode submit region end(Prohibit modification and deletion)
// 方法二、对每一行二分
// https://leetcode-cn.com/problems/search-a-2d-matrix-ii/solution/sou-suo-er-wei-ju-zhen-ii-by-leetcode-so-9hcx/
class Solution1 {
	public boolean searchMatrix(int[][] matrix, int target) {
		for(int[] row : matrix){
			int index = search(row, target);
			if(index >= 0){
				return true;
			}
		}
		return false;
	}
	public int search(int[] nums, int target){
		int low = 0, high = nums.length - 1;
		while (low <= high){
			int mid = (high - low) / 2 + low;
			int num = nums[mid];
			if(num == target){
				return mid;
			}else if(num > target){
				high = mid - 1;
			}else {
				low = mid + 1;
			}
		}
		return -1;
	}
}

}

package leetcode.editor.cn;

//编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性： 
//
// 
// 每行中的整数从左到右按升序排列。 
// 每行的第一个整数大于前一行的最后一个整数。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
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
// 1 <= m, n <= 100 
// -10⁴ <= matrix[i][j], target <= 10⁴ 
// 
// Related Topics 数组 二分查找 矩阵 👍 557 👎 0

public class Q74搜索二维矩阵{
	public static void main(String[] args) {
		Solution solution = new Q74搜索二维矩阵().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/search-a-2d-matrix/solution/sou-suo-er-wei-ju-zhen-by-leetcode-solut-vxui/
// 二分法，将二维展开成一维的二分
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
		int m = matrix.length;
		int n = matrix[0].length;
		int low = 0, high = m * n - 1;
		while (low <= high){
			int mid = low + (high - low) / 2;
			int temp = matrix[mid / n][mid % n];
			if(temp < target){
				low = mid + 1;
			}else if(temp > target){
				high = mid - 1;
			}else if(temp == target){
				return true;
			}
		}
		return false;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。 
//
// 
//
// 示例 1： 
//
// 
//输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[1,2,3,6,9,8,7,4,5]
// 
//
// 示例 2： 
//
// 
//输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
//输出：[1,2,3,4,8,12,11,10,9,5,6,7]
// 
//
// 
//
// 提示： 
//
// 
// m == matrix.length 
// n == matrix[i].length 
// 1 <= m, n <= 10 
// -100 <= matrix[i][j] <= 100 
// 
// Related Topics 数组 矩阵 模拟 👍 937 👎 0

import java.util.ArrayList;
import java.util.List;

public class Q54螺旋矩阵{
	public static void main(String[] args) {
		Solution solution = new Q54螺旋矩阵().new Solution();
		int[][] matrix = new int[][]{{1,2,3},{4,5,6},{7,8,9}};
		System.out.println(solution.spiralOrder(matrix));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/spiral-matrix/solution/cxiang-xi-ti-jie-by-youlookdeliciousc-3/
class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
		List<Integer> ans = new ArrayList<>();
		int upper = 0;
		int down = matrix.length - 1;
		int left = 0;
		int right = matrix[0].length - 1;
		while (true){
			for(int i = left; i <= right; i++){
				ans.add(matrix[upper][i]);
			}
			if(++upper > down){
				break;
			}
			for(int i = upper; i <= down; i++){
				ans.add(matrix[i][right]);
			}
			if(--right < left){
				break;
			}
			for(int i = right; i >= left; i--){
				ans.add(matrix[down][i]);
			}
			if(--down < upper){
				break;
			}
			for(int i = down; i >= upper; i--){
				ans.add(matrix[i][left]);
			}
			if(++left > right){
				break;
			}
		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

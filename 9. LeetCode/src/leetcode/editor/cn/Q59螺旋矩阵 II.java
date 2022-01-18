package leetcode.editor.cn;

//给你一个正整数 n ，生成一个包含 1 到 n² 所有元素，且元素按顺时针顺序螺旋排列的 n x n 正方形矩阵 matrix 。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 3
//输出：[[1,2,3],[8,9,4],[7,6,5]]
// 
//
// 示例 2： 
//
// 
//输入：n = 1
//输出：[[1]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= n <= 20 
// 
// Related Topics 数组 矩阵 模拟 👍 576 👎 0

class Q59螺旋矩阵II{
	public static void main(String[] args) {
		Solution solution = new Q59螺旋矩阵II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/spiral-matrix-ii/solution/spiral-matrix-ii-mo-ni-fa-she-ding-bian-jie-qing-x/
class Solution {
    public int[][] generateMatrix(int n) {
		int[][] res = new int[n][n];
		int top = 0, bottom = n - 1, left = 0, right = n - 1;
		int num = 1, tag = n * n;
		while (num <= tag){
			for(int i = left; i <= right; i++){
				res[top][i] = num++;
			}
			top++;
			for(int i = top; i <= bottom; i++){
				res[i][right] = num++;
			}
			right--;
			for(int i = right; i >= left; i--){
				res[bottom][i] = num++;
			}
			bottom--;
			for(int i = bottom; i >= top; i--){
				res[i][left] = num++;
			}
			left++;
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给你一个大小为 m x n 的矩阵 mat ，请以对角线遍历的顺序，用一个数组返回这个矩阵中的所有元素。 
//
// 
//
// 示例 1： 
//
// 
//输入：mat = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[1,2,4,7,5,3,6,8,9]
// 
//
// 示例 2： 
//
// 
//输入：mat = [[1,2],[3,4]]
//输出：[1,2,3,4]
// 
//
// 
//
// 提示： 
//
// 
// m == mat.length 
// n == mat[i].length 
// 1 <= m, n <= 10⁴ 
// 1 <= m * n <= 10⁴ 
// -10⁵ <= mat[i][j] <= 10⁵ 
// 
// Related Topics 数组 矩阵 模拟 👍 280 👎 0

public class Q498对角线遍历{
	public static void main(String[] args) {
		Solution solution = new Q498对角线遍历().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 每一趟x + y的值加一
// https://leetcode-cn.com/problems/diagonal-traverse/solution/dui-jiao-xian-bian-li-fen-xi-ti-mu-zhao-zhun-gui-l/
class Solution {
    public int[] findDiagonalOrder(int[][] mat) {
		if(mat == null || mat.length == 0){
			return new int[0];
		}

		int m = mat.length;
		int n = mat[0].length;
		int[] nums = new int[m * n];

		int k = 0;
		boolean bXFlag = true;
		for(int i = 0; i < m + n; i++){
			int pm = bXFlag ? m : n;
			int pn = bXFlag ? n : m;
			int x = (i < pm) ? i : pm - 1;
			int y = i - x;
			while (x >= 0 && y < pn){
				nums[k++] = bXFlag ? mat[x][y] : mat[y][x];
				x--;
				y++;
			}
			bXFlag = !bXFlag;
		}
		return nums;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

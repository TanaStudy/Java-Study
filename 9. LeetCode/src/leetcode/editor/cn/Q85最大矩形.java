package leetcode.editor.cn;

//给定一个仅包含 0 和 1 、大小为 rows x cols 的二维二进制矩阵，找出只包含 1 的最大矩形，并返回其面积。 
//
// 
//
// 示例 1： 
//
// 
//输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"]
//,["1","0","0","1","0"]]
//输出：6
//解释：最大矩形如上图所示。
// 
//
// 示例 2： 
//
// 
//输入：matrix = []
//输出：0
// 
//
// 示例 3： 
//
// 
//输入：matrix = [["0"]]
//输出：0
// 
//
// 示例 4： 
//
// 
//输入：matrix = [["1"]]
//输出：1
// 
//
// 示例 5： 
//
// 
//输入：matrix = [["0","0"]]
//输出：0
// 
//
// 
//
// 提示： 
//
// 
// rows == matrix.length 
// cols == matrix[0].length 
// 1 <= row, cols <= 200 
// matrix[i][j] 为 '0' 或 '1' 
// 
// Related Topics 栈 数组 动态规划 矩阵 单调栈 👍 1263 👎 0

import java.util.ArrayDeque;
import java.util.Deque;

public class Q85最大矩形{
	public static void main(String[] args) {
		Solution solution = new Q85最大矩形().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 参考链接里的第二种解法，把每一层的height传给84题的答案中
// https://leetcode.cn/problems/maximal-rectangle/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-1-8/
class Solution {
    public int maximalRectangle(char[][] matrix) {
		if(matrix.length == 0){
			return 0;
		}
		int[] heights = new int[matrix[0].length];
		int maxArea = 0;
		for(int row = 0; row < matrix.length; row++){
			for(int col = 0; col < matrix[0].length; col++){
				if(matrix[row][col] == '1'){
					heights[col] += 1;
				}else {
					heights[col] = 0;
				}
			}
			maxArea = Math.max(maxArea, largestRectangleArea(heights));
		}
		return maxArea;
    }
	public int largestRectangleArea(int[] heights) {
		int len = heights.length;
		if(len == 0){
			return 0;
		}
		if(len == 1){
			return heights[0];
		}

		int res = 0;
		Deque<Integer> stack = new ArrayDeque<>(len);
		for(int i = 0; i < len; i++){
			while (!stack.isEmpty() && heights[i] < heights[stack.peekLast()]){
				int curHeight = heights[stack.pollLast()];
				while (!stack.isEmpty() && heights[stack.peekLast()] == curHeight){
					stack.pollLast();
				}

				int curWidth;
				if(stack.isEmpty()){
					curWidth = i;
				}else {
					curWidth = i - stack.peekLast() - 1;
				}

				res = Math.max(res, curHeight * curWidth);
			}
			stack.addLast(i);

		}
		while (!stack.isEmpty()){
			int curHeight = heights[stack.pollLast()];
			while (!stack.isEmpty() && heights[stack.peekLast()] == curHeight){
				stack.pollLast();
			}
			int curWidth;
			if(stack.isEmpty()){
				curWidth = len;
			}else {
				curWidth = len - stack.peekLast() - 1;
			}
			res = Math.max(res, curHeight * curWidth);
		}
		return res;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。 
//
// 给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。 
//
// 
// 
// 每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 4
//输出：[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
//解释：如上图所示，4 皇后问题存在两个不同的解法。
// 
//
// 示例 2： 
//
// 
//输入：n = 1
//输出：[["Q"]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= n <= 9 
// 
// 
// 
// Related Topics 数组 回溯 👍 1155 👎 0

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Q51N皇后{
	public static void main(String[] args) {
		Solution solution = new Q51N皇后().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/n-queens/solution/dai-ma-sui-xiang-lu-51-n-queenshui-su-fa-2k32/
// 回溯
class Solution {
	List<List<String>> res = new ArrayList<>();
    public List<List<String>> solveNQueens(int n) {
		char[][] chessBoard = new char[n][n];
		for(char[] c : chessBoard){
			Arrays.fill(c,'.');
		}
		backTrack(n, 0, chessBoard);
		return res;
    }
    public void backTrack(int n, int row, char[][] chessBoard){
    	if(row == n){
			res.add(Array2List(chessBoard));
    		return;
		}
    	for(int col = 0; col < n; col++){
			if(isVaild(row, col, n, chessBoard)){
				chessBoard[row][col] = 'Q';
				backTrack(n, row + 1, chessBoard);
				chessBoard[row][col] = '.';
			}

		}

	}
	public boolean isVaild(int row, int col, int n, char[][] chessBoard){
    	// 检查列
    	for(int i = 0; i < row; i++){
    		if(chessBoard[i][col] == 'Q'){
    			return false;
			}
		}
    	// 检查左上45°
    	for(int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--){
    		if(chessBoard[i][j] == 'Q'){
    			return false;
			}
		}
    	// 检查右上45°
    	for(int i = row - 1, j = col + 1; i >= 0 && j <= n - 1; i--, j++){
    		if(chessBoard[i][j] == 'Q'){
    			return false;
			}
		}
    	return true;
	}
	public List<String> Array2List(char[][] chessBoard){
    	List<String> list = new ArrayList<>();

    	for(char[] c : chessBoard){
    		list.add(String.copyValueOf(c));
		}
    	return list;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

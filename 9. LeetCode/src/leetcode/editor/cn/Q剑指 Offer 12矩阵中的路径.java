package leetcode.editor.cn;

//给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。 
//
// 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。 
//
// 
//
// 例如，在下面的 3×4 的矩阵中包含单词 "ABCCED"（单词中的字母已标出）。 
//
// 
//
// 
//
// 示例 1： 
//
// 
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = 
//"ABCCED"
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：board = [["a","b"],["c","d"]], word = "abcd"
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// 1 <= board.length <= 200 
// 1 <= board[i].length <= 200 
// board 和 word 仅由大小写英文字母组成 
// 
//
// 
//
// 注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/ 
// Related Topics 数组 回溯 矩阵 👍 487 👎 0

class Q剑指Offer12矩阵中的路径{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer12矩阵中的路径().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/solution/mian-shi-ti-12-ju-zhen-zhong-de-lu-jing-shen-du-yo/
class Solution {
    public boolean exist(char[][] board, String word) {
		char[] words = word.toCharArray();
		for(int i = 0; i < board.length; i++){
			for(int j = 0; j < board[0].length;j++){
				if(dfs(board,words,i,j,0)){
					return true;
				}
			}
		}
		return false;
    }
    public boolean dfs(char[][] board, char[] word, int i, int j, int k){
    	if(i >= board.length || i < 0 ||j < 0 || j >= board[0].length || board[i][j] != word[k]){
    		return false;
		}
    	if(k == word.length - 1){
    		return true;
		}
		board[i][j] = '\0';
    	boolean res = dfs(board, word,i - 1, j , k + 1) || dfs(board, word, i + 1, j, k + 1) ||
				dfs(board, word, i, j - 1, k + 1) || dfs(board, word, i, j + 1, k + 1);

    	board[i][j] = word[k];
    	return res;

	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

package leetcode.editor.cn;

//给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。 
//
// 岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。 
//
// 此外，你可以假设该网格的四条边均被水包围。 
//
// 
//
// 示例 1： 
//
// 
//输入：grid = [
//  ["1","1","1","1","0"],
//  ["1","1","0","1","0"],
//  ["1","1","0","0","0"],
//  ["0","0","0","0","0"]
//]
//输出：1
// 
//
// 示例 2： 
//
// 
//输入：grid = [
//  ["1","1","0","0","0"],
//  ["1","1","0","0","0"],
//  ["0","0","1","0","0"],
//  ["0","0","0","1","1"]
//]
//输出：3
// 
//
// 
//
// 提示： 
//
// 
// m == grid.length 
// n == grid[i].length 
// 1 <= m, n <= 300 
// grid[i][j] 的值为 '0' 或 '1' 
// 
// Related Topics 深度优先搜索 广度优先搜索 并查集 数组 矩阵 👍 1467 👎 0

public class Q200岛屿数量{
	public static void main(String[] args) {
		Solution solution = new Q200岛屿数量().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 岛屿系列题题解
// https://leetcode-cn.com/problems/number-of-islands/solution/dao-yu-lei-wen-ti-de-tong-yong-jie-fa-dfs-bian-li-/
class Solution {
    public int numIslands(char[][] grid) {
		int ans = 0;
		for(int i = 0; i < grid.length; i++){
			for(int j = 0; j < grid[0].length; j++){
				if(grid[i][j] == '1'){
					dfs(grid, i, j);
					ans++;
				}
			}
		}
		return ans;
    }
    public void dfs(char[][] grid, int r, int c){
    	if(!inArea(grid, r, c)){
    		return;
		}
    	if(grid[r][c] != '1'){
    		return;
		}
    	grid[r][c] = '2';

    	dfs(grid, r - 1, c);
    	dfs(grid, r + 1, c);
    	dfs(grid, r, c - 1);
    	dfs(grid, r, c + 1);

	}
	public boolean inArea(char[][] grid, int r, int c){
    	return 0 <= r && r < grid.length && 0 <= c && c < grid[0].length;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

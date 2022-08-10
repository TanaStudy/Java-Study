package leetcode.editor.cn;

//地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一
//格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但
//它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？ 
//
// 
//
// 示例 1： 
//
// 输入：m = 2, n = 3, k = 1
//输出：3
// 
//
// 示例 2： 
//
// 输入：m = 3, n = 1, k = 0
//输出：1
// 
//
// 提示： 
//
// 
// 1 <= n,m <= 100 
// 0 <= k <= 20 
// 
// Related Topics 深度优先搜索 广度优先搜索 动态规划 👍 418 👎 0

class Q剑指Offer13机器人的运动范围{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer13机器人的运动范围().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/solution/mian-shi-ti-13-ji-qi-ren-de-yun-dong-fan-wei-dfs-b/
// 代码参考了评论里的代码
class Solution {
    public int movingCount(int m, int n, int k) {
		boolean[][] visited = new boolean[m][n];
		return dfs(visited, m, n, k, 0, 0);
    }
    public int dfs(boolean[][] visited, int m, int n, int k, int i, int j){
    	if(i >= m || j >= n || bitSum(i) + bitSum(j) > k || visited[i][j]){
    		return 0;
		}
    	visited[i][j] = true;
    	return 1 + dfs(visited, m, n, k, i + 1, j) + dfs(visited, m, n, k, i, j + 1);
	}
	public int bitSum(int x){
    	int sum = 0;
    	while (x > 0){
    		sum = sum + x % 10;
    		x = x / 10;
		}
    	return sum;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

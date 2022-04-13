package leetcode.editor.cn;

//给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。 
//
// 设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。 
//
// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。 
//
// 
//
// 示例 1: 
//
// 
//输入：prices = [3,3,5,0,0,3,1,4]
//输出：6
//解释：在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。
//     随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。 
//
// 示例 2： 
//
// 
//输入：prices = [1,2,3,4,5]
//输出：4
//解释：在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。   
//     注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。   
//     因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
// 
//
// 示例 3： 
//
// 
//输入：prices = [7,6,4,3,1] 
//输出：0 
//解释：在这个情况下, 没有交易完成, 所以最大利润为 0。 
//
// 示例 4： 
//
// 
//输入：prices = [1]
//输出：0
// 
//
// 
//
// 提示： 
//
// 
// 1 <= prices.length <= 10⁵ 
// 0 <= prices[i] <= 10⁵ 
// 
// Related Topics 数组 动态规划 👍 1061 👎 0

class Q123买卖股票的最佳时机III{
	public static void main(String[] args) {
		Solution solution = new Q123买卖股票的最佳时机III().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 动态规格
// j = 0 表示没有交易发生
// j = 1 表示此时已经发生了 1 次买入股票的行为
// j = 2 表示此时已经发生了 2 次买入股票的行为
// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iii/solution/dong-tai-gui-hua-by-liweiwei1419-7/
class Solution {
    public int maxProfit(int[] prices) {
    	int len = prices.length;
		if(len < 2){
			return 0;
		}
		int[][][] dp = new int[len][3][2];

		dp[0][0][0] = 0;
		dp[0][1][1] = -prices[0];
		dp[0][2][1] = Integer.MIN_VALUE;
		for(int i = 1; i < len; i++){
			// 转移顺序先持股，再卖出
			dp[i][1][1] = Math.max(dp[i - 1][1][1], -prices[i]) ;
			dp[i][1][0] = Math.max(dp[i - 1][1][0], dp[i - 1][1][1] + prices[i]);
			dp[i][2][1] = Math.max(dp[i - 1][2][1], dp[i - 1][1][0] - prices[i]);
			dp[i][2][0] = Math.max(dp[i - 1][2][0], dp[i - 1][2][1] + prices[i]);
		}
		return Math.max(dp[len - 1][1][0], dp[len - 1][2][0]);
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

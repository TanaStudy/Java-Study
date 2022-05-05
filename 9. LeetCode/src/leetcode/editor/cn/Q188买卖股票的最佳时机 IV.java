package leetcode.editor.cn;

//给定一个整数数组 prices ，它的第 i 个元素 prices[i] 是一支给定的股票在第 i 天的价格。 
//
// 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。 
//
// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。 
//
// 
//
// 示例 1： 
//
// 
//输入：k = 2, prices = [2,4,1]
//输出：2
//解释：在第 1 天 (股票价格 = 2) 的时候买入，在第 2 天 (股票价格 = 4) 的时候卖出，这笔交易所能获得利润 = 4-2 = 2 。 
//
// 示例 2： 
//
// 
//输入：k = 2, prices = [3,2,6,5,0,3]
//输出：7
//解释：在第 2 天 (股票价格 = 2) 的时候买入，在第 3 天 (股票价格 = 6) 的时候卖出, 这笔交易所能获得利润 = 6-2 = 4 。
//     随后，在第 5 天 (股票价格 = 0) 的时候买入，在第 6 天 (股票价格 = 3) 的时候卖出, 这笔交易所能获得利润 = 3-0 = 3 
//。 
//
// 
//
// 提示： 
//
// 
// 0 <= k <= 100 
// 0 <= prices.length <= 1000 
// 0 <= prices[i] <= 1000 
// 
// Related Topics 数组 动态规划 👍 689 👎 0

import java.util.Arrays;

class Q188买卖股票的最佳时机IV{
	public static void main(String[] args) {
		Solution solution = new Q188买卖股票的最佳时机IV().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int maxProfit(int k, int[] prices) {
		int len = prices.length;
		if (k == 0 || len < 2) {
			return 0;
		}
		// 特殊判断，因为交易一次需要 2 天，如果 k >= len / 2，相当于没有限制
		// 转换为「力扣」第 122 题，使用贪心算法
		if (k >= len / 2) {
			return greedy(prices, len);
		}
		// 状态转移方程里下标有 -1 的时候，为了防止数组下标越界，多开一行，因此第一维的长度是 len + 1
		// 第二维表示交易次数，从 0 开始，因此第二维的长度是 k + 1
		// 第三维表示是否持股，0：不持股，1：持股
		int[][][] dp = new int[len + 1][k + 1][2];

		// 初始化：把持股的部分都设置为一个较小的负值
		// 注意：如果使用默认值 0，状态转移的过程中会做出错误的决策
		for (int i = 0; i <= len; i++) {
			for (int j = 0; j <= k; j++) {
				dp[i][j][1] = Integer.MIN_VALUE;
			}
		}
		// 注意：i 和 j 都有 1 个位置的偏移
		for (int i = 1; i <= len; i++) {
			for (int j = 1; j <= k; j++) {
				dp[i][j][1] = Math.max(dp[i - 1][j][1], dp[i - 1][j - 1][0] - prices[i - 1]);
				dp[i][j][0] = Math.max(dp[i - 1][j][0], dp[i - 1][j][1] + prices[i - 1]);
			}
		}
		// 说明：第一维和第二维状态都具有前缀性质的，输出最后一个状态即可
		return dp[len][k][0];


    }
	public int greedy(int[] prices, int len) {
		// 转换为股票系列的第 2 题，使用贪心算法完成，思路是只要有利润，就交易
		int res = 0;
		for (int i = 1; i < len; i++) {
			if (prices[i] > prices[i - 1]) {
				res += prices[i] - prices[i - 1];
			}
		}
		return res;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

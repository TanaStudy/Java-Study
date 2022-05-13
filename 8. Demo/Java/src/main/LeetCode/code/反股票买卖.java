package code;

// 输入一个数组，找出A1 A2两个数，使得 A1-A2尽可能大，输出A1-A2的结果。例如 输入[0，2，3，8]，输出 -1，即2-3。
public class 反股票买卖 {
    public static int maxProfit(int[] prices) {
        int len = prices.length;
        if (len < 2) {
            return 0;
        }
        int[][] dp = new int[len][2];

        dp[0][0] = Integer.MIN_VALUE;
        dp[0][1] = prices[0];

        for(int i = 1; i < len; i++){
            dp[i][0] = Math.max(dp[i-1][0],dp[i-1][1]-prices[i]);
            dp[i][1] = Math.max(dp[i-1][1],prices[i]);
        }
        return dp[len-1][0];
    }

    public static void main(String[] args) {
        int[] nums = new int[]{12,7,5,1};
        System.out.println(maxProfit(nums));
    }
}

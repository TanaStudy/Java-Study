package leetcode.editor.cn;

//给你一根长度为 n 的绳子，请把绳子剪成整数长度的 m 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 k[0],k[1]...k[m - 1]
// 。请问 k[0]*k[1]*...*k[m - 1] 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘
//积是18。 
//
// 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。 
//
// 
//
// 示例 1： 
//
// 输入: 2
//输出: 1
//解释: 2 = 1 + 1, 1 × 1 = 1 
//
// 示例 2: 
//
// 输入: 10
//输出: 36
//解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36 
//
//
//
// 提示： 
//
// 
// 2 <= n <= 1000 
// 
//
// 注意：本题与主站 343 题相同：https://leetcode-cn.com/problems/integer-break/ 
// Related Topics 数学 动态规划 👍 172 👎 0

import java.math.BigInteger;
import java.util.Arrays;

class Q剑指Offer14II剪绳子II{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer14II剪绳子II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、循环取余
// https://leetcode-cn.com/problems/jian-sheng-zi-ii-lcof/solution/di-zi-fen-xi-shi-yong-dong-tai-gui-hua-q-jlr7/
class Solution {
    public int cuttingRope(int n) {
		if(n < 4){
			return n - 1;
		}
		long res = 1;
		while (n > 4){
			res = res * 3;
			res = res % 1000000007;
			n = n - 3;
		}
		return (int)(res * n % 1000000007);

    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、动态规划用BigInteger
// https://leetcode-cn.com/problems/jian-sheng-zi-ii-lcof/solution/di-zi-fen-xi-shi-yong-dong-tai-gui-hua-q-jlr7
// 这里注意要在代码提交的地方导包，不然会找不到BigInteger
// import java.math.BigInteger;
class Solution1 {
	public int cuttingRope(int n) {
		BigInteger[] dp = new BigInteger[n + 1];
		Arrays.fill(dp, BigInteger.valueOf(1));
		for(int i = 3; i <= n; i++){
			for(int j = 1; j < i; j++){
				dp[i] = dp[i].max(BigInteger.valueOf(j * (i - j))).max(dp[i - j].multiply(BigInteger.valueOf(j)));
			}
		}
		return dp[n].mod(BigInteger.valueOf(1000000007)).intValue();

	}
}
}

package leetcode.editor.cn;

//给定整数 n ，返回 所有小于非负整数 n 的质数的数量 。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 10
//输出：4
//解释：小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
// 
//
// 示例 2： 
//
// 
//输入：n = 0
//输出：0
// 
//
// 示例 3： 
//
// 
//输入：n = 1
//输出：0
// 
//
// 
//
// 提示： 
//
// 
// 0 <= n <= 5 * 10⁶ 
// 
// Related Topics 数组 数学 枚举 数论 👍 842 👎 0

import java.util.Arrays;

public class Q204计数质数{
	public static void main(String[] args) {
		Solution solution = new Q204计数质数().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、埃氏筛，x 是 素数，2x,3x不是素数
// https://leetcode-cn.com/problems/count-primes/solution/ji-shu-zhi-shu-by-leetcode-solution/
class Solution {
    public int countPrimes(int n) {
		int[] isPrime = new int[n];
		Arrays.fill(isPrime, 1);
		int ans = 0;
		for (int i = 2; i < n; i++) {
			if (isPrime[i] == 1) {
				ans++;
				if ((long) i * i < n) {
					for (int j = i * i; j < n; j = j + i) {
						isPrime[j] = 0;
					}
				}
			}
		}
		return ans;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、枚举 [2,x-1] 中的每个数 y，判断 y 是否为 x 的因数。
// 方法一改进：y 是 x 因数，x/y 也是 x的因数， 列举 [2,根号x]
// https://leetcode-cn.com/problems/count-primes/solution/ji-shu-zhi-shu-by-leetcode-solution/
class Solution1 {
	public int countPrimes(int n) {
		int ans = 0;
		for(int i = 2; i < n; i++){
			if(isPrimes(i)){
				ans = ans + 1;
			}
		}
		return ans;
	}
	public boolean isPrimes(int n){
//		for(int i = 2; i < n; i++){
//			if(n % i == 0){
//				return false;
//			}
//		}
//		return true;

		for(int i = 2; i * i <= n; i++){
			if(n % i == 0){
				return false;
			}
		}
		return true;
	}
}
}

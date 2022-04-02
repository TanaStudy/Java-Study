package leetcode.editor.cn;

//实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xⁿ ）。 
//
// 
//
// 示例 1： 
//
// 
//输入：x = 2.00000, n = 10
//输出：1024.00000
// 
//
// 示例 2： 
//
// 
//输入：x = 2.10000, n = 3
//输出：9.26100
// 
//
// 示例 3： 
//
// 
//输入：x = 2.00000, n = -2
//输出：0.25000
//解释：2-2 = 1/22 = 1/4 = 0.25
// 
//
// 
//
// 提示： 
//
// 
// -100.0 < x < 100.0 
// -231 <= n <= 231-1 
// -104 <= xⁿ <= 104 
// 
// Related Topics 递归 数学 👍 917 👎 0

class Q50Pow{
	public static void main(String[] args) {
		Solution solution = new Q50Pow().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 快速幂分治
// https://leetcode-cn.com/problems/powx-n/solution/50-powx-n-kuai-su-mi-qing-xi-tu-jie-by-jyd/
class Solution {
    public double myPow(double x, int n) {
    	if(x == 0.0f){
    		return 0.0d;
		}
    	long b = n;
    	double res = 1.0;
    	if(b < 0){
    		x = 1/ x;
    		b = -b;
		}
    	while (b > 0){
    		if ((b & 1) == 1){
    			res = res * x;
			}
    		x = x * x;
    		b >>= 1;
		}
    	return res;

    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

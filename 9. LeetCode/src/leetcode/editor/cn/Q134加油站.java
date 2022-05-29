package leetcode.editor.cn;

//在一条环路上有 n 个加油站，其中第 i 个加油站有汽油 gas[i] 升。 
//
// 你有一辆油箱容量无限的的汽车，从第 i 个加油站开往第 i+1 个加油站需要消耗汽油 cost[i] 升。你从其中的一个加油站出发，开始时油箱为空。 
//
// 给定两个整数数组 gas 和 cost ，如果你可以绕环路行驶一周，则返回出发时加油站的编号，否则返回 -1 。如果存在解，则 保证 它是 唯一 的。 
//
// 
//
// 示例 1: 
//
// 
//输入: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
//输出: 3
//解释:
//从 3 号加油站(索引为 3 处)出发，可获得 4 升汽油。此时油箱有 = 0 + 4 = 4 升汽油
//开往 4 号加油站，此时油箱有 4 - 1 + 5 = 8 升汽油
//开往 0 号加油站，此时油箱有 8 - 2 + 1 = 7 升汽油
//开往 1 号加油站，此时油箱有 7 - 3 + 2 = 6 升汽油
//开往 2 号加油站，此时油箱有 6 - 4 + 3 = 5 升汽油
//开往 3 号加油站，你需要消耗 5 升汽油，正好足够你返回到 3 号加油站。
//因此，3 可为起始索引。 
//
// 示例 2: 
//
// 
//输入: gas = [2,3,4], cost = [3,4,3]
//输出: -1
//解释:
//你不能从 0 号或 1 号加油站出发，因为没有足够的汽油可以让你行驶到下一个加油站。
//我们从 2 号加油站出发，可以获得 4 升汽油。 此时油箱有 = 0 + 4 = 4 升汽油
//开往 0 号加油站，此时油箱有 4 - 3 + 2 = 3 升汽油
//开往 1 号加油站，此时油箱有 3 - 3 + 3 = 3 升汽油
//你无法返回 2 号加油站，因为返程需要消耗 4 升汽油，但是你的油箱只有 3 升汽油。
//因此，无论怎样，你都不可能绕环路行驶一周。 
//
// 
//
// 提示: 
//
// 
// gas.length == n 
// cost.length == n 
// 1 <= n <= 10⁵ 
// 0 <= gas[i], cost[i] <= 10⁴ 
// 
// Related Topics 贪心 数组 👍 934 👎 0

public class Q134加油站{
	public static void main(String[] args) {
		Solution solution = new Q134加油站().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 我们首先检查第 0 个加油站，并试图判断能否环绕一周；
// 如果不能，就从第一个无法到达的加油站开始继续检查。
// https://leetcode.cn/problems/gas-station/solution/jia-you-zhan-by-leetcode-solution/
class Solution {
    public int canCompleteCircuit(int[] gas, int[] cost) {
		int n = gas.length;
		int i = 0;
		// 从头到尾遍历每个加油站，并且检查以该加油站为起点，能否行驶一周
		while (i < n){
			int sumOfGas = 0; // 总共加的油
			int sumOfCost = 0; // 总共消费的油
			int count = 0;
			while (count < n){// 退出循环的条件是走过所有的站点
				int j = (i + count) % n;// 加油站是环形的
				sumOfGas += gas[j];
				sumOfCost += cost[j];
				if(sumOfCost > sumOfGas){// 如果这个站点发现油不够了
					break;
				}
				count++;
			}
			if(count == n){// 如果能环绕一圈
				return i;
			}else {// 不行的话 从下一个站点开始 检查
				i = i + count + 1;
			}
		}
		return -1;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

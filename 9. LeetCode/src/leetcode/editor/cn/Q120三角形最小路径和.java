package leetcode.editor.cn;

//给定一个三角形 triangle ，找出自顶向下的最小路径和。 
//
// 每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果
//正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。 
//
// 
//
// 示例 1： 
//
// 
//输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
//输出：11
//解释：如下面简图所示：
//   2
//  3 4
// 6 5 7
//4 1 8 3
//自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
// 
//
// 示例 2： 
//
// 
//输入：triangle = [[-10]]
//输出：-10
// 
//
// 
//
// 提示： 
//
// 
// 1 <= triangle.length <= 200 
// triangle[0].length == 1 
// triangle[i].length == triangle[i - 1].length + 1 
// -10⁴ <= triangle[i][j] <= 10⁴ 
// 
//
// 
//
// 进阶： 
//
// 
// 你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题吗？ 
// 
// Related Topics 数组 动态规划 👍 940 👎 0

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class Q120三角形最小路径和{
	public static void main(String[] args) {
		Solution solution = new Q120三角形最小路径和().new Solution();
		List<List<Integer>> triangle = new ArrayList<>();
		List<Integer> l1 = new ArrayList<Integer>(){{
			add(-1);
		}};
		List<Integer> l2 = new ArrayList<Integer>(){{
			add(2);
			add(3);
		}};
		List<Integer> l3 = new ArrayList<Integer>(){{
			add(1);
			add(-1);
			add(-3);
		}};
		triangle.add(l1);
		triangle.add(l2);
		triangle.add(l3);
		System.out.println(solution.minimumTotal(triangle));

		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、自底向上dp
// 不需要判断边界条件
// https://leetcode-cn.com/problems/triangle/solution/di-gui-ji-yi-hua-dp-bi-xu-miao-dong-by-sweetiee/
class Solution {
    public int minimumTotal(List<List<Integer>> triangle) {
		int n = triangle.size();
		int[][] dp = new int[n + 1][n + 1];
		for (int i = n - 1; i >=0; i--){
			for(int j = 0; j <= i; j++){
				dp[i][j] = Math.min(dp[i + 1][j], dp[i + 1][j + 1]) + triangle.get(i).get(j);
			}
		}
		return dp[0][0];
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、自顶向下dp
// 需要考虑每一行第一个元素和最后一个元素边界条件，然后在dp数组的最后一行取最小值
// https://leetcode-cn.com/problems/triangle/solution/san-jiao-xing-zui-xiao-lu-jing-he-by-leetcode-solu/
class Solution1 {
	public int minimumTotal(List<List<Integer>> triangle) {
		int len = triangle.size();
		int[][] dp = new int[len][len];
		dp[0][0] = triangle.get(0).get(0);

		for(int i = 1; i < len; i++){
			dp[i][0] = dp[i - 1][0] + triangle.get(i).get(0);
			for(int j = 1; j < i; j++){
				dp[i][j] = Math.min(dp[i - 1][j], dp[i - 1][j - 1]) + triangle.get(i).get(j);
			}
			dp[i][i] = dp[i - 1][i - 1] + triangle.get(i).get(i);
		}
		int ans = dp[len - 1][0];
		for(int i = 1; i < len; i++){
			ans = Math.min(ans, dp[len - 1][i]);
		}
		return ans;
	}
}

}

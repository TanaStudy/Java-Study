package leetcode.editor.cn;

//给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。 
//
// 在「杨辉三角」中，每个数是它左上方和右上方的数的和。 
//
// 
//
// 
//
// 示例 1: 
//
// 
//输入: numRows = 5
//输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
// 
//
// 示例 2: 
//
// 
//输入: numRows = 1
//输出: [[1]]
// 
//
// 
//
// 提示: 
//
// 
// 1 <= numRows <= 30 
// 
// Related Topics 数组 动态规划 👍 655 👎 0

import java.util.ArrayList;
import java.util.List;

public class Q118杨辉三角{
	public static void main(String[] args) {
		Solution solution = new Q118杨辉三角().new Solution();
		int numRows = 3;
		System.out.println(solution.generate(numRows));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/pascals-triangle/solution/yang-hui-san-jiao-by-leetcode-solution-lew9/
class Solution {
    public List<List<Integer>> generate(int numRows) {
		List<List<Integer>> ans = new ArrayList<>();
		for(int i = 0;i < numRows; i++){
			List<Integer> cur = new ArrayList<>();
			for(int j = 0; j <= i; j++){
				if(j == 0 || j == i){
					cur.add(1);
				}else {
					cur.add(ans.get(i-1).get(j-1) + ans.get(i-1).get(j));
				}
			}
			ans.add(cur);

		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

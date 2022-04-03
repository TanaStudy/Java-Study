package leetcode.editor.cn;

//给定一个非负索引 rowIndex，返回「杨辉三角」的第 rowIndex 行。 
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
//输入: rowIndex = 3
//输出: [1,3,3,1]
// 
//
// 示例 2: 
//
// 
//输入: rowIndex = 0
//输出: [1]
// 
//
// 示例 3: 
//
// 
//输入: rowIndex = 1
//输出: [1,1]
// 
//
// 
//
// 提示: 
//
// 
// 0 <= rowIndex <= 33 
// 
//
// 
//
// 进阶： 
//
// 你可以优化你的算法到 O(rowIndex) 空间复杂度吗？ 
// Related Topics 数组 动态规划 👍 377 👎 0

import java.util.ArrayList;
import java.util.List;

class Q119杨辉三角II{
	public static void main(String[] args) {
		Solution solution = new Q119杨辉三角II().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/pascals-triangle-ii/solution/yang-hui-san-jiao-ii-by-leetcode-solutio-shuk/
class Solution {
    public List<Integer> getRow(int rowIndex) {
		List<List<Integer>> ans = new ArrayList<>();
		for(int i = 0; i <= rowIndex; i++){
			List<Integer> row = new ArrayList<>();
			for(int j = 0; j <= i; j++){
				if(j == 0 ||j == i){
					row.add(1);
				}else {
					row.add(ans.get(i - 1).get(j - 1) + ans.get(i - 1).get(j));
				}
			}
			ans.add(row);
		}
		return ans.get(rowIndex);
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

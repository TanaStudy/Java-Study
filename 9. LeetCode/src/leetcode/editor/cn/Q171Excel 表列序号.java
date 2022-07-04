package leetcode.editor.cn;

//给你一个字符串 columnTitle ，表示 Excel 表格中的列名称。返回 该列名称对应的列序号 。 
//
// 例如： 
//
// 
//A -> 1
//B -> 2
//C -> 3
//...
//Z -> 26
//AA -> 27
//AB -> 28 
//... 
//
// 
//
// 示例 1: 
//
// 
//输入: columnTitle = "A"
//输出: 1
// 
//
// 示例 2: 
//
// 
//输入: columnTitle = "AB"
//输出: 28
// 
//
// 示例 3: 
//
// 
//输入: columnTitle = "ZY"
//输出: 701 
//
// 
//
// 提示： 
//
// 
// 1 <= columnTitle.length <= 7 
// columnTitle 仅由大写英文组成 
// columnTitle 在范围 ["A", "FXSHRXW"] 内 
// 
// Related Topics 数学 字符串 👍 332 👎 0

class Q171Excel表列序号{
	public static void main(String[] args) {
		Solution solution = new Q171Excel表列序号().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 二十六进制逆运算
// https://leetcode.cn/problems/excel-sheet-column-number/solution/gong-shui-san-xie-tong-yong-jin-zhi-zhua-y5fm/
class Solution {
    public int titleToNumber(String columnTitle) {
		char[] cs = columnTitle.toCharArray();
		int n = cs.length;
		int ans = 0;
		for(int i = 0; i < n; i++){
			ans = ans * 26 + (cs[i] - 'A' + 1);
		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

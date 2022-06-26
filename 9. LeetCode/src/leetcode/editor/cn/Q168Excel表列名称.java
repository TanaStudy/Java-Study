package leetcode.editor.cn;

//给你一个整数 columnNumber ，返回它在 Excel 表中相对应的列名称。 
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
//
// 示例 1： 
//
// 
//输入：columnNumber = 1
//输出："A"
// 
//
// 示例 2： 
//
// 
//输入：columnNumber = 28
//输出："AB"
// 
//
// 示例 3： 
//
// 
//输入：columnNumber = 701
//输出："ZY"
// 
//
// 示例 4： 
//
// 
//输入：columnNumber = 2147483647
//输出："FXSHRXW"
// 
//
// 
//
// 提示： 
//
// 
// 1 <= columnNumber <= 2³¹ - 1 
// 
// Related Topics 数学 字符串 👍 537 👎 0

public class Q168Excel表列名称{
	public static void main(String[] args) {
		Solution solution = new Q168Excel表列名称().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 二十六进制转换
// https://leetcode.cn/problems/excel-sheet-column-title/solution/gong-shui-san-xie-cong-1-kai-shi-de-26-j-g2ur/
class Solution {
    public String convertToTitle(int columnNumber) {
		StringBuilder sb = new StringBuilder();
		while (columnNumber > 0){
			columnNumber--;
			sb.append((char)(columnNumber % 26 + 'A'));
			columnNumber /= 26;
		}
		sb.reverse();
		return sb.toString();
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

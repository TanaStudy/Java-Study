package leetcode.editor.cn;

//给定一个只包含三种字符的字符串：（ ，） 和 *，写一个函数来检验这个字符串是否为有效字符串。有效字符串具有如下规则： 
//
// 
// 任何左括号 ( 必须有相应的右括号 )。 
// 任何右括号 ) 必须有相应的左括号 ( 。 
// 左括号 ( 必须在对应的右括号之前 )。 
// * 可以被视为单个右括号 ) ，或单个左括号 ( ，或一个空字符串。 
// 一个空字符串也被视为有效字符串。 
// 
//
// 示例 1: 
//
// 
//输入: "()"
//输出: True
// 
//
// 示例 2: 
//
// 
//输入: "(*)"
//输出: True
// 
//
// 示例 3: 
//
// 
//输入: "(*))"
//输出: True
// 
//
// 注意: 
//
// 
// 字符串大小将在 [1，100] 范围内。 
// 
// Related Topics 栈 贪心 字符串 动态规划 👍 460 👎 0

public class Q678有效的括号字符串{
	public static void main(String[] args) {
		Solution solution = new Q678有效的括号字符串().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 模拟 ( : l 和 r 同时加一； ) : l 和 r 同时减一；* : l 减一， r 加一
// https://leetcode-cn.com/problems/valid-parenthesis-string/solution/gong-shui-san-xie-yi-ti-shuang-jie-dong-801rq/
class Solution {
    public boolean checkValidString(String s) {
		int l = 0, r = 0;
		for(char c : s.toCharArray()){
			if(c == '('){
				l++;
				r++;
			}else if(c == ')'){
				l--;
				r--;
			}else if(c == '*'){
				l--;
				r++;
			}
			l = Math.max(l, 0);
			if(l > r){
				return false;
			}
		}
		return l == 0;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

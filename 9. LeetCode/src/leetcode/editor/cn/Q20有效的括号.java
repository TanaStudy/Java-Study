package leetcode.editor.cn;

//给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。 
//
// 有效字符串需满足： 
//
// 
// 左括号必须用相同类型的右括号闭合。 
// 左括号必须以正确的顺序闭合。 
//
//
// 
//
// 示例 1： 
//
// 
//输入：s = "()"
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：s = "()[]{}"
//输出：true
// 
//
// 示例 3： 
//
// 
//输入：s = "(]"
//输出：false
// 
//
// 示例 4： 
//
// 
//输入：s = "([)]"
//输出：false
// 
//
// 示例 5： 
//
// 
//输入：s = "{[]}"
//输出：true 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 10⁴ 
// s 仅由括号 '()[]{}' 组成 
// 
// Related Topics 栈 字符串 👍 2766 👎 0

import java.util.*;

public class Q20有效的括号{
	public static void main(String[] args) {
		Solution solution = new Q20有效的括号().new Solution();
		String s = "}";
		System.out.println(solution.isValid(s));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、使用map
// https://leetcode-cn.com/problems/valid-parentheses/solution/you-xiao-de-gua-hao-by-leetcode-solution/
class Solution {

    public boolean isValid(String s) {
		int n = s.length();
		if(n % 2 == 1){
			return false;
		}
		Map<Character,Character> map = new HashMap<Character,Character>(){{
			put(')','(');
			put(']','[');
			put('}','{');
		}};
		Stack<Character> stack = new Stack<>();
		for(int i = 0;i < n; i ++){
			char c = s.charAt(i);
			if(!map.containsKey(c)){
				stack.push(c);
			}else{
				if(stack.isEmpty() || stack.peek() != map.get(c)){
					return false;
				}
				stack.pop();
			}
		}
		return stack.isEmpty();
    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、不使用map
class Solution1	{
	public boolean isValid(String s) {
		Stack<Character> stack = new Stack<>();
		for(int i = 0; i < s.length();i++){
			char c = s.charAt(i);
			if(c == '(' || c == '[' || c == '{'){
				stack.push(c);
			}else if(c == ')'){
				if(stack.isEmpty() || stack.pop() != '('){
					return false;
				}
			}else if(c == ']' ){
				if(stack.isEmpty() || stack.pop() != '['){
					return false;
				}
			}else if(c == '}'){
				if(stack.isEmpty() || stack.pop() != '{'){
					return false;
				}
			}
		}
		return stack.isEmpty();

	}
}


}

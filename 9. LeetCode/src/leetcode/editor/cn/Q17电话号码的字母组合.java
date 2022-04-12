package leetcode.editor.cn;

//给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。 
//
// 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。 
//
// 
//
// 
//
// 示例 1： 
//
// 
//输入：digits = "23"
//输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
// 
//
// 示例 2： 
//
// 
//输入：digits = ""
//输出：[]
// 
//
// 示例 3： 
//
// 
//输入：digits = "2"
//输出：["a","b","c"]
// 
//
// 
//
// 提示： 
//
// 
// 0 <= digits.length <= 4 
// digits[i] 是范围 ['2', '9'] 的一个数字。 
// 
// Related Topics 哈希表 字符串 回溯 👍 1641 👎 0

import java.util.ArrayList;
import java.util.List;

public class Q17电话号码的字母组合{
	public static void main(String[] args) {
		Solution solution = new Q17电话号码的字母组合().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 回溯
// https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/solution/tong-su-yi-dong-dong-hua-yan-shi-17-dian-hua-hao-m/
class Solution {
	List<String> res = new ArrayList<>();
	String[] phone = new String[]{
		" ",
		" ",
		"abc",
		"def",
		"ghi",
		"jkl",
		"mno",
		"pqrs",
		"tuv",
		"wxyz"
	};
    public List<String> letterCombinations(String digits) {
    	if(digits.length() == 0){
    		return res;
		}
    	back(digits, new StringBuffer(), 0);
    	return res;

    }
    public void back(String digits, StringBuffer str,int index){
    	if(index == digits.length()){
    		res.add(str.toString());
    		return;
		}
    	char curChar = digits.charAt(index);
    	String curStr = phone[curChar - '0'];

    	for(int i = 0; i < curStr.length(); i++){
    		str.append(curStr.charAt(i));
    		back(digits,str,index+1);
    		str.deleteCharAt(str.length()-1);
		}
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

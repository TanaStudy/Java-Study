package leetcode.editor.cn;

//给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。 
//
// 
//
// 示例 1: 
//
// 
//输入: s = "abcabcbb"
//输出: 3 
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
// 
//
// 示例 2: 
//
// 
//输入: s = "bbbbb"
//输出: 1
//解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
// 
//
// 示例 3: 
//
// 
//输入: s = "pwwkew"
//输出: 3
//解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
// 
//
// 示例 4: 
//
// 
//输入: s = ""
//输出: 0
// 
//
// 
//
// 提示： 
//
// 
// 0 <= s.length <= 5 * 10⁴ 
// s 由英文字母、数字、符号和空格组成 
// 
// Related Topics 哈希表 字符串 滑动窗口 👍 6407 👎 0

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Q3无重复字符的最长子串{
	public static void main(String[] args) {
		Solution solution = new Q3无重复字符的最长子串().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
	//方法二、滑动窗口使用map
    public int lengthOfLongestSubstring(String s) {
		int res = 0;
		int left = 0;
		Map<Character,Integer> map = new HashMap<>();
		for(int i = 0; i < s.length(); i++){
			// 两个例子：abca和abba
			if(map.containsKey(s.charAt(i))){
				left = Math.max(left,map.get(s.charAt(i))+1);
			}
			map.put(s.charAt(i),i);
			res = Math.max(res,i-left+1);
		}
		return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、滑动窗口使用set
class Solution1 {
	public int lengthOfLongestSubstring(String s) {
		int res = 0;
		int right = -1;
		Set<Character> set = new HashSet<Character>();
		for(int i = 0; i < s.length();i++){
			if(i != 0){
				set.remove(s.charAt(i-1));
			}
			while(right + 1 < s.length() && !set.contains(s.charAt(right + 1))){
				set.add(s.charAt(right + 1));
				right++;
			}
			res = Math.max(res,right-i+1);
		}
		return res;
	}
}


}

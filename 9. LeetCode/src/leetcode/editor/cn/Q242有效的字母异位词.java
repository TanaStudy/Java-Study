package leetcode.editor.cn;

//给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。 
//
// 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。 
//
// 
//
// 示例 1: 
//
// 
//输入: s = "anagram", t = "nagaram"
//输出: true
// 
//
// 示例 2: 
//
// 
//输入: s = "rat", t = "car"
//输出: false 
//
// 
//
// 提示: 
//
// 
// 1 <= s.length, t.length <= 5 * 10⁴ 
// s 和 t 仅包含小写字母 
// 
//
// 
//
// 进阶: 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？ 
// Related Topics 哈希表 字符串 排序 👍 477 👎 0

import java.util.HashMap;

public class Q242有效的字母异位词{
	public static void main(String[] args) {
		Solution solution = new Q242有效的字母异位词().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法二、用数组，跟方法一类似
// https://leetcode-cn.com/problems/valid-anagram/solution/you-xiao-de-zi-mu-yi-wei-ci-by-leetcode-solution/
class Solution {
    public boolean isAnagram(String s, String t) {
		if (s.length() != t.length()) {
			return false;
		}
		int[] table = new int[26];
		for (int i = 0; i < s.length(); i++) {
			table[s.charAt(i) - 'a']++;
		}
		for (int i = 0; i < t.length(); i++) {
			table[t.charAt(i) - 'a']--;
			if (table[t.charAt(i) - 'a'] < 0) {
				return false;
			}
		}
		return true;

    }
}
//leetcode submit region end(Prohibit modification and deletion)
// 方法一、hash表
class Solution1 {
	public boolean isAnagram(String s, String t) {
		HashMap<Character, Integer> map = new HashMap<>();
		int sLen = s.length();
		int tLen = t.length();
		if(sLen != tLen){
			return false;
		}
		for(int i = 0; i < sLen; i++){
			char temp = s.charAt(i);
			if(!map.containsKey(temp)){
				map.put(temp,1);
			}else {
				map.put(temp,map.get(temp) + 1);
			}
		}
		for(int i = 0; i < tLen; i++){
			char temp = t.charAt(i);
			if(!map.containsKey(temp) || map.get(temp) == 0){
				return false;
			}else {
				map.put(temp,map.get(temp) - 1);
			}
		}
		return true;
	}
}

}

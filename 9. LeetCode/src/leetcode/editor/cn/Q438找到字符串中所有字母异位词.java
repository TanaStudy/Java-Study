package leetcode.editor.cn;

//给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。 
//
// 异位词 指由相同字母重排列形成的字符串（包括相同的字符串）。 
//
// 
//
// 示例 1: 
//
// 
//输入: s = "cbaebabacd", p = "abc"
//输出: [0,6]
//解释:
//起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
//起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
// 
//
// 示例 2: 
//
// 
//输入: s = "abab", p = "ab"
//输出: [0,1,2]
//解释:
//起始索引等于 0 的子串是 "ab", 它是 "ab" 的异位词。
//起始索引等于 1 的子串是 "ba", 它是 "ab" 的异位词。
//起始索引等于 2 的子串是 "ab", 它是 "ab" 的异位词。
// 
//
// 
//
// 提示: 
//
// 
// 1 <= s.length, p.length <= 3 * 10⁴ 
// s 和 p 仅包含小写字母 
// 
// Related Topics 哈希表 字符串 滑动窗口 👍 829 👎 0

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Q438找到字符串中所有字母异位词{
	public static void main(String[] args) {
		Solution solution = new Q438找到字符串中所有字母异位词().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法一、滑动窗口＋数组
// https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/solution/zhao-dao-zi-fu-chuan-zhong-suo-you-zi-mu-xzin/
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
		int sLen = s.length(), pLen = p.length();

		if(sLen < pLen){
			return new ArrayList<>();
		}
		List<Integer> ans = new ArrayList<>();
		int[] sCount = new int[26];
		int[] pCount = new int[26];

		for(int i = 0; i < pLen; i++){
			sCount[s.charAt(i) - 'a']++;
			pCount[p.charAt(i) - 'a']++;
		}
		if(Arrays.equals(sCount,pCount)){
			ans.add(0);
		}

		for(int i = 0; i < sLen - pLen; i++){
			sCount[s.charAt(i) - 'a']--;
			sCount[s.charAt(i + pLen) - 'a']++;
			if (Arrays.equals(sCount, pCount)) {
				ans.add(i + 1);
			}

		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

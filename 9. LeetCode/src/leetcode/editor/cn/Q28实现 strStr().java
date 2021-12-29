package leetcode.editor.cn;

//实现 strStr() 函数。 
//
// 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如
//果不存在，则返回 -1 。 
//
// 
//
// 说明： 
//
// 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。 
//
// 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。 
//
// 
//
// 示例 1： 
//
// 
//输入：haystack = "hello", needle = "ll"
//输出：2
// 
//
// 示例 2： 
//
// 
//输入：haystack = "aaaaa", needle = "bba"
//输出：-1
// 
//
// 示例 3： 
//
// 
//输入：haystack = "", needle = ""
//输出：0
// 
//
// 
//
// 提示： 
//
// 
// 0 <= haystack.length, needle.length <= 5 * 10⁴ 
// haystack 和 needle 仅由小写英文字符组成 
// 
// Related Topics 双指针 字符串 字符串匹配 👍 1143 👎 0

import java.util.Arrays;

class Q28实现strStr{
	public static void main(String[] args) {
		Solution solution = new Q28实现strStr ().new Solution();
		String haystack = "hello";
		String needle = "ll";
		System.out.println(solution.strStr(haystack,needle));
		
	}
//leetcode submit region begin(Prohibit modification and deletion)

// 方法二、KMP
// https://leetcode-cn.com/problems/implement-strstr/solution/duo-tu-yu-jing-xiang-jie-kmp-suan-fa-by-w3c9c/
class Solution {
    public int strStr(String haystack, String needle) {
		if(needle.equals("")){
			return 0;
		}
		int nLen = needle.length();
		int[] next = new int[nLen];

		for(int left = 0, right = 1; right < nLen; right++){
			while (left > 0 && needle.charAt(left) != needle.charAt(right)){
				left = next[left-1];
			}
			if(needle.charAt(left) == needle.charAt(right)){
				left++;
			}
			next[right] = left;
		}

		for(int i = 0, j = 0; i < haystack.length(); i++){
			while (j > 0 && haystack.charAt(i) != needle.charAt(j)){
				j = next[j-1];
			}
			if(haystack.charAt(i) == needle.charAt(j)){
				j++;
			}
			if(j == nLen){
				return i - nLen + 1;
			}
		}
		return -1;



    }
}
//leetcode submit region end(Prohibit modification and deletion)

// 方法一、暴力
class Solution1 {
	public int strStr(String haystack, String needle) {
		if(needle.equals("")){
			return 0;
		}
		int sLen = haystack.length();
		int nLen = needle.length();
		for(int i = 0; i + nLen <= sLen; i++){
			boolean flag = true;
			for(int j = 0; j < nLen; j++){
				if(haystack.charAt(i +j) != needle.charAt(j)){
					flag = false;
					break;
				}
			}
			if(flag){
				return i;
			}
		}
		return -1;
	}
}

}

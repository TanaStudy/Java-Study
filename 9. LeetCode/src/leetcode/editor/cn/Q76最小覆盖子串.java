package leetcode.editor.cn;

//给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。 
//
// 
//
// 注意： 
//
// 
// 对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。 
// 如果 s 中存在这样的子串，我们保证它是唯一的答案。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "ADOBECODEBANC", t = "ABC"
//输出："BANC"
// 
//
// 示例 2： 
//
// 
//输入：s = "a", t = "a"
//输出："a"
// 
//
// 示例 3: 
//
// 
//输入: s = "a", t = "aa"
//输出: ""
//解释: t 中两个字符 'a' 均应包含在 s 的子串中，
//因此没有符合条件的子字符串，返回空字符串。 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length, t.length <= 10⁵ 
// s 和 t 由英文字母组成 
// 
//
// 
//进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？ Related Topics 哈希表 字符串 滑动窗口 👍 1868 👎 0

public class Q76最小覆盖子串{
	public static void main(String[] args) {
		Solution solution = new Q76最小覆盖子串().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 滑动窗口，代码参考评论
// https://leetcode.cn/problems/minimum-window-substring/solution/tong-su-qie-xiang-xi-de-miao-shu-hua-dong-chuang-k/
class Solution {
    public String minWindow(String s, String t) {
		if(s == null || s.length() == 0 || t == null || t.length() == 0){
			return "";
		}
		int[] need = new int[128];
		//记录需要的字符的个数
		for(int i = 0; i < t.length(); i++){
			need[t.charAt(i)]++;
		}
		//l是当前左边界，r是当前右边界，size记录窗口大小，count是需求的字符个数，start是最小覆盖串开始的index
		int l = 0, r = 0, size = Integer.MAX_VALUE, count = t.length(), start = 0;
		//遍历所有字符
		while (r < s.length()){
			char c = s.charAt(r);
			if(need[c] > 0){//需要字符c
				count--;
			}
			need[c]--;
			if(count == 0){
				while (l < r && need[s.charAt(l)] < 0){
					need[s.charAt(l)]++;//应该是释放左边移动出窗口的字符
					l++;
				}
				if(r - l + 1 < size){//不能右移时候挑战最小窗口大小，更新最小窗口开始的start
					size = r - l + 1;
					start = l;
				}
				need[s.charAt(l)]++;
				l++;
				count++;
			}
			r++;
		}
		return size == Integer.MAX_VALUE ? "" : s.substring(start, start + size);
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

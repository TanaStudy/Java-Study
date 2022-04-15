package leetcode.editor.cn;

//给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。 
//
// 回文串 是正着读和反着读都一样的字符串。 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "aab"
//输出：[["a","a","b"],["aa","b"]]
// 
//
// 示例 2： 
//
// 
//输入：s = "a"
//输出：[["a"]]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 16 
// s 仅由小写英文字母组成 
// 
// Related Topics 字符串 动态规划 回溯 👍 1040 👎 0

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

public class Q131分割回文串{
	public static void main(String[] args) {
		Solution solution = new Q131分割回文串().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 回溯
// https://leetcode-cn.com/problems/palindrome-partitioning/solution/hui-su-you-hua-jia-liao-dong-tai-gui-hua-by-liweiw/
class Solution {
    public List<List<String>> partition(String s) {
		int len = s.length();
		List<List<String>> res = new ArrayList<>();
		if(len == 0){
			return res;
		}

		Deque<String> stack = new ArrayDeque<>();
		char[] charArray = s.toCharArray();
		dfs(charArray, 0 , len, stack, res);
		return res;

    }
    private void dfs(char[] charArray, int index, int len, Deque<String> path, List<List<String>> res){
    	if(index == len){
    		res.add(new ArrayList<>(path));
    		return;
		}
    	for(int i = index; i < len; i++){
    		if(!checkPalindrome(charArray, index, i)){
    			continue;
			}
    		path.addLast(new String(charArray, index, i + 1 - index));
    		dfs(charArray, i + 1, len, path, res);
    		path.removeLast();
		}
	}
	private boolean checkPalindrome(char[] charArray, int left, int right){
    	while (left < right){
    		if(charArray[left] != charArray[right]){
    			return false;
			}
    		left++;
    		right--;
		}
    	return true;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}

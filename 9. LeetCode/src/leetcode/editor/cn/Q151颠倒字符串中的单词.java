package leetcode.editor.cn;

////给你一个字符串 s ，颠倒字符串中 单词 的顺序。 
////
//// 单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。 
////
//// 返回 单词 顺序颠倒且 单词 之间用单个空格连接的结果字符串。 
////
//// 注意：输入字符串 s中可能会存在前导空格、尾随空格或者单词间的多个空格。返回的结果字符串中，单词间应当仅用单个空格分隔，且不包含任何额外的空格。 
////
//// 
////
//// 示例 1： 
////
//// 
////输入：s = "the sky is blue"
////输出："blue is sky the"
//// 
////
//// 示例 2： 
////
//// 
////输入：s = " hello world "
////输出："world hello"
////解释：颠倒后的字符串中不能存在前导空格和尾随空格。
//// 
////
//// 示例 3： 
////
//// 
////输入：s = "a good example"
////输出："example good a"
////解释：如果两个单词间有多余的空格，颠倒后的字符串需要将单词间的空格减少到仅有一个。
//// 
////
//// 
////
//// 提示： 
////
//// 
//// 1 <= s.length <= 10⁴ 
//// s 包含英文大小写字母、数字和空格 ' ' 
//// s 中 至少存在一个 单词 
//// 
////
//// 
//// 
////
//// 
////
//// 进阶：如果字符串在你使用的编程语言中是一种可变数据类型，请尝试使用 O(1) 额外空间复杂度的 原地 解法。 
//// Related Topics 双指针 字符串 👍 569 👎 0
//

public class Q151颠倒字符串中的单词{
	public static void main(String[] args) {
		Solution solution = new Q151颠倒字符串中的单词().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法三、双指针
// https://leetcode.cn/problems/reverse-words-in-a-string/solution/151-fan-zhuan-zi-fu-chuan-li-de-dan-ci-shuang-zh-2/
class Solution {
	public String reverseWords(String s) {
		s = s.trim(); // 删除首尾空格
		int j = s.length() - 1, i = j;
		StringBuilder res = new StringBuilder();
		while(i >= 0) {
			while(i >= 0 && s.charAt(i) != ' ') i--; // 搜索首个空格
			res.append(s.substring(i + 1, j + 1) + " "); // 添加单词
			while(i >= 0 && s.charAt(i) == ' ') i--; // 跳过单词间空格
			j = i; // j 指向下个单词的尾字符
		}
		return res.toString().trim(); // 转化为字符串并返回
	}
}


//leetcode submit region end(Prohibit modification and deletion)
// 方法一、使用内置api
// https://leetcode-cn.com/problems/reverse-words-in-a-string/solution/fan-zhuan-zi-fu-chuan-li-de-dan-ci-by-leetcode-sol/
class Solution1 {
	public String reverseWords(String s) {
		String[] strs = s.trim().split(" "); // 删除首尾空格，分割字符串
		StringBuilder res = new StringBuilder();
		for (int i = strs.length - 1; i >= 0; i--) { // 倒序遍历单词列表
			if (strs[i].equals("")) continue; // 遇到空单词则跳过
			res.append(strs[i] + " "); // 将单词拼接至 StringBuilder
		}
		return res.toString().trim(); // 转化为字符串，删除尾部空格，并返回
	}
}

// 方法二、实现api
// https://leetcode-cn.com/problems/reverse-words-in-a-string/solution/fan-zhuan-zi-fu-chuan-li-de-dan-ci-by-leetcode-sol/
class Solution2 {
	public String reverseWords(String s) {
		StringBuilder sb = trimSpaces(s);

		reverse(sb, 0, sb.length() - 1);

		reverseEachWord(sb);

		return sb.toString();
	}

	public StringBuilder trimSpaces(String s) {
		int left = 0, right = s.length() - 1;
		while (left <= right && s.charAt(left) == ' ') {
			left++;
		}
		while (left <= right && s.charAt(right) == ' ') {
			right--;
		}

		StringBuilder sb = new StringBuilder();
		while (left <= right) {
			char c = s.charAt(left);
			if (c != ' ') {
				sb.append(c);
			} else if (sb.charAt(sb.length() - 1) != ' ') {
				sb.append(c);
			}
			left++;
		}
		return sb;
	}

	public void reverse(StringBuilder sb, int left, int right) {
		while (left < right) {
			char tmp = sb.charAt(left);
			sb.setCharAt(left, sb.charAt(right));
			sb.setCharAt(right, tmp);
			left++;
			right--;
		}
	}

	public void reverseEachWord(StringBuilder sb) {
		int n = sb.length();
		int start = 0, end = 0;
		while (start < n) {
			while (end < n && sb.charAt(end) != ' ') {
				end++;
			}
			reverse(sb, start, end - 1);
			start = end + 1;
			end++;
		}
	}

}
}

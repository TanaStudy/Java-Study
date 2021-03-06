package leetcode.editor.cn;

//编写一个函数来查找字符串数组中的最长公共前缀。 
//
// 如果不存在公共前缀，返回空字符串 ""。 
//
// 
//
// 示例 1： 
//
// 
//输入：strs = ["flower","flow","flight"]
//输出："fl"
// 
//
// 示例 2： 
//
// 
//输入：strs = ["dog","racecar","car"]
//输出：""
//解释：输入不存在公共前缀。 
//
// 
//
// 提示： 
//
// 
// 1 <= strs.length <= 200 
// 0 <= strs[i].length <= 200 
// strs[i] 仅由小写英文字母组成 
// 
// Related Topics 字符串 👍 1895 👎 0

public class Q14最长公共前缀{
	public static void main(String[] args) {
		Solution solution = new Q14最长公共前缀().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// https://leetcode-cn.com/problems/longest-common-prefix/solution/hua-jie-suan-fa-14-zui-chang-gong-gong-qian-zhui-b/
class Solution {
    public String longestCommonPrefix(String[] strs) {
    	String common = strs[0];
    	for(int i = 1;i < strs.length;i++){
    		String cur = strs[i];
			int j = 0;
    		for(;j < common.length() && j < cur.length();j++){
    			if(common.charAt(j) != cur.charAt(j)){
    				break;
				}
			}
    		common = common.substring(0,j);
		}
    	return common;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

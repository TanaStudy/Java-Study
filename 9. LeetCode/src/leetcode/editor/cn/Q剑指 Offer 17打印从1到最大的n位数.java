package leetcode.editor.cn;

//输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。 
//
// 示例 1: 
//
// 输入: n = 1
//输出: [1,2,3,4,5,6,7,8,9]
// 
//
// 
//
// 说明： 
//
// 
// 用返回一个整数列表来代替打印 
// n 为正整数 
// 
// Related Topics 数组 数学 👍 203 👎 0

class Q剑指Offer17打印从1到最大的n位数{
	public static void main(String[] args) {
		Solution solution = new Q剑指Offer17打印从1到最大的n位数().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 考虑大数并且符合
// https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/solution/mian-shi-ti-17-da-yin-cong-1-dao-zui-da-de-n-wei-2/
class Solution{
	int[] res;
	int count = 0, nine = 0, n, start;
	char[] num, loop = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
	public int[] printNumbers(int n){
		this.n = n;
		res = new int[(int)Math.pow(10, n) - 1];
		num = new char[n];
		start = n - 1;
		dfs(0);
		return res;
	}
	public void dfs(int x){
		if(x == n){
			String s = String.valueOf(num).substring(start);
			if(!s.equals("0")){
				res[count++] = Integer.parseInt(s);
			}
			if(n - start == nine) {
				start--;
			}
			return;
		}
		for(char i : loop){
			if(i == '9') {
				nine++;
			}
			num[x] = i;
			dfs(x + 1);
		}
		nine--;
	}
}
//leetcode submit region end(Prohibit modification and deletion)
// 不考虑大数
// https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/solution/mian-shi-ti-17-da-yin-cong-1-dao-zui-da-de-n-wei-2/
class Solution1 {
	public int[] printNumbers(int n) {
		int end = (int) (Math.pow(10, n) - 1);
		int[] res = new int[end];
		for(int i = 0; i < end; i++){
			res[i] = i + 1;
		}
		return res;
	}
}
// 考虑大数的通用解法
// https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/solution/mian-shi-ti-17-da-yin-cong-1-dao-zui-da-de-n-wei-2/
class Solution2{
		StringBuilder res;
		int count = 0, nine = 0, n, start;
		char[] num, loop = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
		public String printNumbers(int n){
			this.n = n;
			res = new StringBuilder();
			num = new char[n];
			start = n - 1;
			dfs(0);
			res.deleteCharAt(res.length() - 1);
			return res.toString();
		}
		public void dfs(int x){
			if(x == n){
				String s = String.valueOf(num).substring(start);
				if(!s.equals("0")){
					res.append(s + ",");
				}
				if(n - start == nine) {
					start--;
				}
				return;
			}
			for(char i : loop){
				if(i == '9') {
					nine++;
				}
				num[x] = i;
				dfs(x + 1);
			}
			nine--;
		}
}

}

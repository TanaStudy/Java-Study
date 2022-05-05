package leetcode.editor.cn;

//给你一个数组 points ，其中 points[i] = [xi, yi] 表示 X-Y 平面上的一个点。求最多有多少个点在同一条直线上。 
//
// 
//
// 示例 1： 
//
// 
//输入：points = [[1,1],[2,2],[3,3]]
//输出：3
// 
//
// 示例 2： 
//
// 
//输入：points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
//输出：4
// 
//
// 
//
// 提示： 
//
// 
// 1 <= points.length <= 300 
// points[i].length == 2 
// -10⁴ <= xi, yi <= 10⁴ 
// points 中的所有点 互不相同 
// 
// Related Topics 几何 数组 哈希表 数学 👍 403 👎 0

public class Q149直线上最多的点数{
	public static void main(String[] args) {
		Solution solution = new Q149直线上最多的点数().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 方法一、暴力
// https://leetcode-cn.com/problems/max-points-on-a-line/solution/gong-shui-san-xie-liang-chong-mei-ju-zhi-u44s/
class Solution {
    public int maxPoints(int[][] points) {
		int n = points.length;
		int ans = 1;
		for(int i = 0; i < n; i++){
			int[] x = points[i];
			for(int j = i + 1; j < n; j++){
				int[] y = points[j];
				int cnt = 2;
				for(int k = j + 1; k < n; k++){
					int[] p = points[k];
					int s1 = (y[1] - x[1]) * (p[0] - y[0]);
					int s2 = (p[1] - y[1]) * (y[0] - x[0]);
					if(s1 == s2){
						cnt++;
					}
				}
				ans = Math.max(ans, cnt);
			}
		}
		return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

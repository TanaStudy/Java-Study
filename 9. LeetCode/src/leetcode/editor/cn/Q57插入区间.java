package leetcode.editor.cn;

//给你一个 无重叠的 ，按照区间起始端点排序的区间列表。 
//
// 在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。 
//
// 
//
// 示例 1： 
//
// 
//输入：intervals = [[1,3],[6,9]], newInterval = [2,5]
//输出：[[1,5],[6,9]]
// 
//
// 示例 2： 
//
// 
//输入：intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
//输出：[[1,2],[3,10],[12,16]]
//解释：这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。 
//
// 示例 3： 
//
// 
//输入：intervals = [], newInterval = [5,7]
//输出：[[5,7]]
// 
//
// 示例 4： 
//
// 
//输入：intervals = [[1,5]], newInterval = [2,3]
//输出：[[1,5]]
// 
//
// 示例 5： 
//
// 
//输入：intervals = [[1,5]], newInterval = [2,7]
//输出：[[1,7]]
// 
//
// 
//
// 提示： 
//
// 
// 0 <= intervals.length <= 10⁴ 
// intervals[i].length == 2 
// 0 <= intervals[i][0] <= intervals[i][1] <= 10⁵ 
// intervals 根据 intervals[i][0] 按 升序 排列 
// newInterval.length == 2 
// 0 <= newInterval[0] <= newInterval[1] <= 10⁵ 
// 
// Related Topics 数组 👍 571 👎 0

import java.util.ArrayList;
import java.util.List;

public class Q57插入区间{
	public static void main(String[] args) {
		Solution solution = new Q57插入区间().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
// 分成三段处理。重叠前，重叠部分，重叠后。代码参考评论
// https://leetcode-cn.com/problems/insert-interval/solution/cha-ru-qu-jian-by-leetcode-solution/
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
		List<int[]> res = new ArrayList<>();

		int L = newInterval[0], R = newInterval[1], len = intervals.length, j = 0;
		//重叠前直接加入List
		while (j < len && intervals[j][1] < L){
			res.add(intervals[j++]);
		}
		//处理重叠区域
		while (j < len && intervals[j][0] <= R){
			L = Math.min(L, intervals[j][0]);
			R = Math.max(R, intervals[j++][1]);
		}
		res.add(new int[]{L, R});
		//不会再出现重叠区域，直接加入List
		while (j < len){
			res.add(intervals[j++]);
		}
		return res.toArray(new int[res.size()][]);
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}

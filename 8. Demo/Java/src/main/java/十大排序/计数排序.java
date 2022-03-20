package 十大排序;

import java.util.Arrays;

// https://www.cnblogs.com/zer0Black/p/6169858.html#3
// 参考代码2
// 计算每个元素出现的个数，然后计算每个元素应该在的位置，最后通过位置将元素插入到数组中
public class 计数排序 {
    public static int[] countSort(int[] nums){
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;

        for(int i = 0; i < nums.length; i++){
            max = Math.max(max,nums[i]);
            min = Math.min(min,nums[i]);
        }
        int[] help = new int[max - min + 1];

        for(int i = 0; i < nums.length; i++){
            int pos = nums[i] - min;
            help[pos]++;
        }
        for(int i = 1; i < help.length; i++){
            help[i] = help[i - 1] + help[i];
        }
        int[] res = new int[nums.length];
        for(int i = 0; i < help.length;i++){
            int pos = --help[nums[i] - min];
            res[pos] = nums[i];
        }
        return res;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{4,3,6,3,5,1};
        System.out.println(Arrays.toString(nums));
        System.out.println(Arrays.toString(countSort(nums)));
    }
}

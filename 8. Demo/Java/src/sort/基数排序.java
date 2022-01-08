package sort;

import java.util.Arrays;

// 代码参考https://blog.csdn.net/weixin_42643931/article/details/107431178
// 示例和解释可参考https://blog.csdn.net/gisboygogogo/article/details/108192725?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_title~default-0.no_search_link&spm=1001.2101.3001.4242.1&utm_relevant_index=3
// 按照个十百位数依次进行排序
public class 基数排序 {
    public static int[] radixSort(int[] nums){
        int max = nums[0];
        int len = nums.length;
        for(int i = 1; i < len; i++){
            max = Math.max(max, nums[i]);
        }
        int maxDigit = 1;
        while (max / 10 > 0){
            maxDigit++;
            max = max/10;
        }
        int[][] bucket = new int[10][len];
        int base = 10;
        for(int i = 0; i < maxDigit; i++){
            int[] bklen = new int[10];
            for(int j = 0; j < len; j++){
                int whickBucket = (nums[j] % base) / (base / 10) ;
                bucket[whickBucket][bklen[whickBucket]] = nums[j];
                bklen[whickBucket]++;
            }
            int k = 0;
            for(int a = 0; a < bucket.length; a++){
                for(int b = 0; b < bklen[a]; b++){
                    nums[k++] = bucket[a][b];
                }
            }
            base = base * 10;
        }
        return nums;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{53, 3, 542, 748, 14, 214};
        System.out.println(Arrays.toString(radixSort(nums)));
    }
}

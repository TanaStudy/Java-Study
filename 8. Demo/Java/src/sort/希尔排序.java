package sort;

import java.util.Arrays;

// https://blog.csdn.net/weixin_41190227/article/details/86600821
// 插入排序的改进版本，将数组分为几组进行插入排序
public class 希尔排序 {
    public static int[] shellSort(int[] nums){
        int len = nums.length;
        int gap = len / 2;
        while (gap > 0){
            for(int i = gap; i < len; i++){
                int cur = nums[i];
                int preIndex = i - gap;
                while (preIndex >= 0 && nums[preIndex] > cur){
                    nums[preIndex + gap] = nums[preIndex];
                    preIndex = preIndex - gap;
                }
                nums[preIndex + gap] = cur;
            }
            gap = gap / 2;
        }
        return nums;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(shellSort(nums)));
    }
}

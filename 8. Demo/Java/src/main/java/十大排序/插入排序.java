package 十大排序;

import java.util.Arrays;

// https://blog.csdn.net/weixin_41190227/article/details/86600821
// 每一轮将当前元素插入到已排序的数组中
public class 插入排序 {
    public static int[] insertionSort(int[] nums){
        for(int i = 0; i < nums.length - 1; i++){
            int cur = nums[i + 1];
            int preIndex = i;
            while (preIndex >= 0 && cur < nums[preIndex]){
                nums[preIndex + 1] = nums[preIndex];
                preIndex--;
            }
            nums[preIndex + 1] = cur;
        }
        return nums;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(insertionSort(nums)));
    }
}

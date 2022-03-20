package 十大排序;

import java.util.Arrays;

// https://blog.csdn.net/weixin_41190227/article/details/86600821
// 两两交换，每一轮都把子数组中最大的元素交换到子数组末尾
public class 冒泡排序 {
    public static int[] bubbleSort(int[] nums){
        for(int i = 0; i < nums.length; i++){
            for(int j = 0; j < nums.length - 1 - i; j++){
                if(nums[j] > nums[j+1]){
                    int temp = nums[j];
                    nums[j] = nums[j+1];
                    nums[j+1] = temp;
                }
            }
        }
        return nums;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(bubbleSort(nums)));
    }
}

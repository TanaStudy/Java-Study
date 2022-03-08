package sort;

import java.util.Arrays;

// https://blog.csdn.net/u014241071/article/details/81565148
public class 快速排序 {
    public static int[] quickSort(int[] nums){
        quickSort(nums,0,nums.length - 1);
        return nums;
    }
    public static void quickSort(int[] nums, int low, int high){
        if(low > high){
            return;
        }
        int i = low;
        int j = high;
        // p是基准，以最左边的数为基准
        int p = nums[low];
        while (i < j){
            // 从右往左找一个比基准更小的数
            while (i < j && nums[j] >= p){
                j--;
            }
            // 从左往右找一个比基准更大的数
            while (i < j && nums[i] <= p){
                i++;
            }
            // 交换这两个数
            if(i < j){
                int temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
            }
        }
        // while循环结束，i==j，交换基准和i位置上的数
        nums[low] = nums[i];
        nums[i] = p;
        // 递归
        quickSort(nums, low, j-1);
        quickSort(nums,i+1,high);
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(quickSort(nums)));
    }
}

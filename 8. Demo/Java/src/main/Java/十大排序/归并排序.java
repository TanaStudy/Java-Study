package 十大排序;

import java.util.Arrays;

// https://www.cnblogs.com/chengxiao/p/6194356.html
public class 归并排序 {
    public static int[] mergeSort(int[] nums){
        int[] temp = new int[nums.length];
        sort(nums,0, nums.length - 1,temp);
        return nums;
    }
    public static void sort(int[] nums, int left, int right, int[] temp){
        if(left < right){
            int mid = left + (right - left) / 2;
            // 左边递归，并使左子数组有序
            sort(nums, left, mid, temp);
            // 右边递归，并使右子数组有序
            sort(nums, mid + 1, right, temp);
            // 合并两个有序数组
            merge(nums, left, right, temp);
        }
    }
    public static void merge(int[] nums, int left, int right, int[] temp){
        int mid = left + (right - left) / 2;
        // 左序列指针
        int i = left;
        // 右序列指针
        int j = mid + 1;
        int t = 0;
        // 将数组变成有序
        while (i <= mid && j <= right){
            if(nums[i] <= nums[j]){
                temp[t++] = nums[i++];
            }else {
                temp[t++] = nums[j++];
            }
        }
        while (i <= mid){
            temp[t++] = nums[i++];
        }
        while (j <= right){
            temp[t++] = nums[j++];
        }
        // 将有序的temp数组拷贝到原数组中
        t = 0;
        while (left <= right){
            nums[left++] = temp[t++];
        }
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(mergeSort(nums)));
    }

}

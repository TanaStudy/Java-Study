package 十大排序;

import java.util.Arrays;

// https://blog.csdn.net/weixin_41190227/article/details/86600821
// https://www.runoob.com/w3cnote/selection-sort.html
// 每一轮找到最小的数，放在数组的前端
public class 选择排序 {
    public static int[] selectionSort(int[] nums){
        for(int i = 0; i < nums.length - 1; i++){
                        int minIndex = i;
                        for(int j = i + 1; j < nums.length; j++){
                            if(nums[j] < nums[minIndex]){
                                minIndex = j;
                }
            }
            int temp = nums[i];
            nums[i] = nums[minIndex];
            nums[minIndex] = temp;
        }
        return nums;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(selectionSort(nums)));
    }
}

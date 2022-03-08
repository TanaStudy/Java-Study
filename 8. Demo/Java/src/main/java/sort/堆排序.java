package sort;

import java.util.Arrays;

// https://blog.csdn.net/weixin_41190227/article/details/86600821
// 注意原文代码有问题，i的左子树和右子树分别2i+1和2(i+1)
// 正确的代码应该为https://www.runoob.com/w3cnote/heap-sort.html
public class 堆排序 {
    // 初始化全局变量len
    static int len;
    public static int[] heapSort(int[] nums){
        // len为数组长度
        len = nums.length;
        // 从最后一个非叶子节点开始向上构造最大堆,i的左子树和右子树分别2i+1和2(i+1)
        for(int i = len / 2 - 1; i >= 0; i--){
            adjustHeap(nums,i);
        }
        while (len > 0){
            // 交换最大堆的根节点（最大值）和子数组的最后一个元素
            swap(nums, 0, len - 1);
            // 长度减一
            len--;
            // 对子数组调整为最大堆
            adjustHeap(nums,0);
        }
        return nums;
    }
    public static void adjustHeap(int[] nums, int i){
        // 左子树
        int left = i * 2 + 1;
        // 右子树
        int right = i * 2 + 2;
        int maxIndex = i;
        // 如果有左子树，且左子树大于父节点，则将最大指针指向左子树
        if(left < len && nums[left] > nums[maxIndex]){
            maxIndex = left;
        }
        // 如果有右子树，且右子树大于父节点，则将最大指针指向右子树
        if(right < len && nums[right] > nums[maxIndex]){
            maxIndex = right;
        }
        // 如果父节点不是最大值，则将父节点与最大值交换，并且递归调整与父节点交换的位置。
        if(maxIndex != i){
            swap(nums, maxIndex, i);
            adjustHeap(nums,maxIndex);
        }

    }
    public static void swap(int[] nums, int i, int j){
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{7,10,2,4,7,1,8,5,19};
        System.out.println(Arrays.toString(heapSort(nums)));
    }
}

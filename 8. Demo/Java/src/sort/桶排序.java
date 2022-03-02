package sort;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

// https://www.cnblogs.com/zer0Black/p/6169858.html#3
// 把每个数分到桶中，对桶进行快排，然后再合并所有桶
public class 桶排序 {
    public static int[] bucketSort(int[] nums){
        int len = nums.length;
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;

        for(int i = 0; i < len; i++){
            max = Math.max(max, nums[i]);
            min = Math.min(min, nums[i]);
        }

        int bucketNum = (max - min) / len + 1;
        List<List<Integer>> bucket = new ArrayList<>();
        for(int i = 0; i < bucketNum; i++){
            bucket.add(new ArrayList<>());
        }

        for(int i = 0; i < len; i++){
            int num = (nums[i] - min) / len;
            bucket.get(num).add(nums[i]);
        }

        List<Integer> list = new ArrayList<>();
        for(int i = 0; i < bucket.size(); i++){
            Collections.sort(bucket.get(i));
            list.addAll(bucket.get(i));
        }

        int[] res = new int[len];
        for(int i = 0; i < len; i++){
            res[i] = list.get(i);
        }

        return res;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{4,3,6,3,5,1};
        System.out.println(Arrays.toString(bucketSort(nums)));
    }
}

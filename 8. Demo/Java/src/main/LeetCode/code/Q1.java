package code;

import java.util.Arrays;

/*
给定一个数n，如23121;给定—组数字A如{2，4，9}，求由A中元素组成的、小于n的最大数，如小于23121的最大数为22999,
 */
public class Q1 {

    // 23121   [2,4,9] ---- > 22999
    public static int findMax(int target, int[] nums) {
        char[] str = String.valueOf(target).toCharArray();
        int len = str.length;
        Arrays.sort(nums);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len; i++) {
            int cur = str[i] - '0';
            int curNum = nums[binarySearch(cur, nums)];
            sb.append(curNum);
            if (curNum == cur) {
                if (i == len - 1) {
                    return backtrace(str, i, nums, sb);
                }
            } else if (curNum < cur) {
                while (i + 1 < len) {
                    sb.append(nums[nums.length - 1]);
                    i++;
                }
                return Integer.parseInt(sb.toString());
            }
        }
        return -1;
    }

    public static int backtrace(char[] str, int idx, int[] nums, StringBuilder sb) {
        while (sb.length() > 0 && (int) sb.charAt(sb.length() - 1) == str[idx]) {
            int find = binarySearch(str[idx] - '0', nums);
            sb.deleteCharAt(sb.length() - 1);
            if (find > 0) {
                sb.append(nums[find - 1]);
                if (idx < str.length - 1) {
                    while (idx + 1 < str.length) {
                        sb.append(nums[nums.length - 1]);
                        idx++;
                    }
                }
                return Integer.parseInt(sb.toString());

            }
            idx--;
        }
        // 如果都回退完了
        if (idx == -1) {
            idx++;
            int find = binarySearch(str[0] - '0', nums);
            if (find > 0) {
                sb.append(nums[find - 1]);
            }
            while (idx < str.length - 1) {
                sb.append(nums[nums.length - 1]);
                idx++;
            }
        }
        return Integer.parseInt(sb.toString());
    }

    public static int binarySearch(int cur, int[] nums) {
        int l = 0, r = nums.length - 1;
        while (l < r) {
            int mid = (l + r) / 2;
            if (nums[mid] == cur) {
                return mid;
            } else if (nums[mid] < cur) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return l;
    }

    public static void main(String[] args) {
        int n = 23121;
        int[] nums = new int[]{2, 4, 9};
        int res = findMax(n, nums);
        System.out.println(res);
    }
}

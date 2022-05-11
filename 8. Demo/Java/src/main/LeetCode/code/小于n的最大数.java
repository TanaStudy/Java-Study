package code;

import java.util.Arrays;

/*
给定一个数n，如23121;给定—组数字A如{2，4，9}，求由A中元素组成的、小于n的最大数，如小于23121的最大数为22999,
 */
public class 小于n的最大数 {

    // 方法一、二分＋回溯
    // 23121   [2,4,9] ---- > 22999
    public static int findMax1(int target, int[] nums) {
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
    // 方法二、贪心
    // https://sutianxin.top/posts/2261888774.html#30%E3%80%81%E5%B0%8F%E4%BA%8E-n-%E7%9A%84%E6%9C%80%E5%A4%A7%E6%95%B0
    public static String minValue(int value, int[] nums) {
        Arrays.sort(nums);
        boolean flag = false;
        String valueStr = String.valueOf(value);
        StringBuilder result = new StringBuilder();
        for (int i = 0;i < valueStr.length();i++) {
            int current = valueStr.charAt(i) - '0';
            for (int j = 0;j < nums.length;j++) {
                if (flag) {
                    // 如果已经确定当前结果小于 value ，那么剩下的几位全部使用最大值
                    result.append(nums[nums.length - 1]);
                    // 直接退出，因为不用与数组其他的元素进行对比了，可以比较下一位了
                    break;
                } else if (current == nums[j]) {
                    // 如果发现当前结果的第 i 位刚好等于 nums[j] ，那么直接将 nums[j] 拼接到结果中
                    result.append(nums[j]);
                    break;
                } else if (current < nums[j]) {
                    // 如果发现当前位小于 nums[j] ，那么尝试拼接前一位，并将 flag 置为 true
                    // 这里的 nums[j - 1] 一定小于 current
                    if (j - 1 >= 0) {
                        result.append(nums[j - 1]);
                    }
                    flag = true;
                    break;
                }
            }
        }
        return result.toString();
    }

    public static void main(String[] args) {
        int n = 23121;
        int[] nums = new int[]{2, 4, 9};
        String res = minValue(n, nums);
        System.out.println(res);
    }
}

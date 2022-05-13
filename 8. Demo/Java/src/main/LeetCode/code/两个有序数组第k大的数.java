package code;

public class 两个有序数组第k大的数 {

    public static int getKth(int[] nums1, int[] nums2, int k){
        int n = nums1.length;
        int m = nums2.length;
        return getKth(nums1, 0, n - 1, nums2, 0, m - 1, k);
    }
    private static int getKth(int[] nums1, int start1, int end1, int[] nums2, int start2, int end2, int k) {
        int len1 = end1 - start1 + 1;
        int len2 = end2 - start2 + 1;
        //让 len1 的长度小于 len2，这样就能保证如果有数组空了，一定是 len1
        if (len1 > len2) return getKth(nums2, start2, end2, nums1, start1, end1, k);
        if (len1 == 0) return nums2[start2 + k - 1];

        if (k == 1) return Math.min(nums1[start1], nums2[start2]);

        int i = start1 + Math.min(len1, k / 2) - 1;
        int j = start2 + Math.min(len2, k / 2) - 1;

        if (nums1[i] > nums2[j]) {
            return getKth(nums1, start1, end1, nums2, j + 1, end2, k - (j - start2 + 1));
        }
        else {
            return getKth(nums1, i + 1, end1, nums2, start2, end2, k - (i - start1 + 1));
        }
    }

    public static void main(String[] args) {
        int[] nums1 = new int[]{1,3,5,7};
        int[] nums2 = new int[]{2,4,6,8};
        int k = 1;

        System.out.println(getKth(nums1,nums2,nums1.length + nums2.length - k + 1));
    }

}

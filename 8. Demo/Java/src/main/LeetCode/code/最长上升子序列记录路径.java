package code;

import java.util.LinkedList;
import java.util.List;

public class 最长上升子序列记录路径 {
    // 最长上升子序列
    // https://www.acwing.com/solution/content/36571/
    public static int Q1(int[] nums){
        int n = nums.length;
        int[] dp=new int[n];
        int res=0;
        for(int i=0;i<n;i++){
            dp[i]=Math.max(dp[i],1);
            for(int j=0;j<i;j++){
                if(nums[j]<nums[i]){
                    dp[i]=Math.max(dp[j]+1,dp[i]);
                }
            }
            res=Math.max(res,dp[i]);
        }
       return res;
    }

    // 最长上升子序列的路径
    // https://www.acwing.com/solution/content/36571/
    public static List<Integer> Q2(int[] nums){
        int n = nums.length;
        int[] dp=new int[n];
        int[] g=new int[n];
        int maxIdx=0;
        for(int i=0;i<n;i++){
            dp[i]=Math.max(dp[i],1);
            for(int j=0;j<i;j++){
                if(nums[j]<nums[i]){
                    if(dp[j]+1>dp[i]){
                        dp[i]=dp[j]+1;
                        g[i]=j;
                        maxIdx=Math.max(maxIdx,i);
                    }
                }
            }
        }
        int i=maxIdx,k=maxIdx;
        LinkedList<Integer> res=new LinkedList<>();
        while(i-->=0){
            if(k>=0){
                res.addFirst(nums[k]);
            }
            if(nums[k]<=nums[g[k]]){
                break;
            }
            k=g[k];
        }
        return res;

    }

    public static void main(String[] args) {
        int[] nums = new int[]{0,1,0,3,2,3};
        System.out.println(Q1(nums));
        System.out.println(Q2(nums));
    }
}

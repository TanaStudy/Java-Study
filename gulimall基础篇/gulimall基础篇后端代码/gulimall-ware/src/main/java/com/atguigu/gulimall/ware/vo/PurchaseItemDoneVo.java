package com.atguigu.gulimall.ware.vo;

import lombok.Data;

@Data
public class PurchaseItemDoneVo {
    //{itemId:1,status:4,reason:""}
    private Long itemId;
    private Integer status;
    private String reason;
}

package com.atguigu.gulimall.order.dao;

import com.atguigu.gulimall.order.entity.OrderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单
 * 
 * @author tanzhihan
 * @email 851901870@qq.com
 * @date 2021-06-18 14:44:56
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {
	
}

package com.zz.dao;

import com.zz.po.OrderState;
import com.zz.po.Orders;
import com.zz.po.OrdersExt;
import com.zz.po.OrdersPage;

import java.util.List;

public interface IOrdersDao {
    //添加
    public void addOrder(Orders orders);
    //打印，查询
    public OrdersExt findOrder(Integer oid);
    //添加Orders中剩余的属性值
    public void addNPA(OrdersExt ordersExt);
    //订单分页
    public List<Integer> getPageOid(OrdersPage ordersPage);
    //获得total
    public Integer getCountOid(Integer uid);
    //修改订单状态
    public void updateOrderState(OrderState orderState);
}

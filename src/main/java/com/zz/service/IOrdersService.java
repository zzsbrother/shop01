package com.zz.service;

import com.zz.po.*;

public interface IOrdersService {
    //将订单添加到数据库，orders orderItem
    public Integer addOrder(Cart cart,Integer uid);
    //打印
    public OrdersExt findOrder(Integer oid);
    //将订单里面的其它数据填充
    public void addNPA(OrdersExt orders);
    //获得我的订单页面和分页信息
    public OrdersPage fingOrdersPage(Integer uid,Integer pagenow);
    //改变订单状态
    void updateOrderState(OrderState orderState);
}

package com.zz.po;

import java.util.List;

public class OrdersPage extends PageSource{
    private Integer uid;  //登录的用户ID
    private List<OrdersExt> list;  //订单集合

    public List<OrdersExt> getList() {
        return list;
    }

    public void setList(List<OrdersExt> list) {
        this.list = list;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}

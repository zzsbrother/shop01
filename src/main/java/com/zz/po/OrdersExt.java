package com.zz.po;

import java.util.List;

public class OrdersExt extends Orders {
    private List<OrderItemExt> itemExts;

    public List<OrderItemExt> getItemExts() {
        return itemExts;
    }

    public void setItemExts(List<OrderItemExt> itemExts) {
        this.itemExts = itemExts;
    }
}

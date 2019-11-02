package com.zz.po;

import java.util.List;

public class CategorySecondExt extends CategorySecond{
    private List<Product> proList;

    public List<Product> getProList() {
        return proList;
    }

    public void setProList(List<Product> proList) {
        this.proList = proList;
    }
}

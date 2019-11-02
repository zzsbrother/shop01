package com.zz.po;

import java.util.List;

public class Page extends PageSource{
    private Integer cid;  //一级类目ID
    private Integer csid;  //二级类目ID
    private List<Product> proList; //商品集合
    private String pnames;  //模糊查询的商品名

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public List<Product> getProList() {
        return proList;
    }

    public void setProList(List<Product> proList) {
        this.proList = proList;
    }

    public String getPnames() {
        return pnames;
    }

    public void setPnames(String pnames) {
        this.pnames = pnames;
    }
}

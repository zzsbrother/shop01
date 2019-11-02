package com.zz.po;

public class CartItel {
    private Product product;    //商品
    private Integer number;     //商品个数

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
    //小计，返回商品价格*商品个数
    public Double getSubtotal(){
        return this.product.getShopprice()*this.number;
    }
}

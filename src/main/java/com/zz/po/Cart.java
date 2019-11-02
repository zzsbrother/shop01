package com.zz.po;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
    private Map<Integer,CartItel> map = new LinkedHashMap<Integer,CartItel>();   //商品集合
    private Double totalPrice;          //总计（总共的价格）
    private Integer numbers;

    public Cart(){
        this.totalPrice=0.0;
    }
    //增加商品
    public void addProToCart(CartItel cartItel){
        Integer pid=cartItel.getProduct().getPid();
        if(!map.containsKey(pid)){
            map.put(pid,cartItel);
        }else{
            System.out.println(map.get(pid).getNumber());
            map.get(pid).setNumber(map.get(pid).getNumber()+cartItel.getNumber());
        }
        this.totalPrice=this.totalPrice+cartItel.getSubtotal();
    }

    //删除某一商品
    public void deletePro(Integer pid){
        CartItel cartItel = map.remove(pid);
        this.totalPrice=this.totalPrice-cartItel.getSubtotal();
    }
    //删除所以商品
    public void ClearCart(){
        map.clear();
        this.totalPrice=0.0;
    }
    //改变商品数量
    public void ChangeProNum(Integer pid,Integer number){
        CartItel cartItel=map.get(pid);
        this.totalPrice = this.totalPrice-cartItel.getSubtotal();
        cartItel.setNumber(number);
        this.totalPrice = this.totalPrice+cartItel.getSubtotal();
    }
    //获得购物车列表
    public Collection<CartItel> getCartProList(){
        return map.values();
    }
    //获得总计
    public Double getTotalPrice(){
        return totalPrice;
    }

    public Integer getNumbers(){
        Collection<CartItel> values=getCartProList();
        Integer numbers=0;
        for (CartItel c:values) {
            numbers=numbers+c.getNumber();
        }
        return numbers;
    }
}

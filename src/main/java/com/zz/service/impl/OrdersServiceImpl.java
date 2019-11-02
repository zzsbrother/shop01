package com.zz.service.impl;

import com.zz.dao.IOrderItemDao;
import com.zz.dao.IOrdersDao;
import com.zz.po.*;
import com.zz.service.IOrdersService;
import com.zz.util.PageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService{

    @Resource
    private IOrdersDao ordersDao;
    @Resource
    private IOrderItemDao orderItemDao;

    @Override
    public Integer addOrder(Cart cart,Integer uid) {
        Orders orders = new Orders();
        orders.setTotal(cart.getTotalPrice());
        orders.setState(1);
        orders.setOrdertime(new Date());
        orders.setUid(uid);
        //添加订单的订单号
        Random random = new Random();
        String result="";
        for (int i=0;i<8;i++)
        {
            result+=random.nextInt(10);
        }
        orders.setOrdernumber(result);
        /*System.out.println("订单编号："+orders.getOrdernumber());*/
        ordersDao.addOrder(orders);

        Integer oid = orders.getOid();


       /* System.out.println("OrdersService:oid:"+oid);*/

        for (CartItel c:cart.getCartProList()) {
            OrderItem orderItem=new OrderItem();
            orderItem.setCount(c.getNumber());
            orderItem.setSubtotal(c.getSubtotal());
            orderItem.setPid(c.getProduct().getPid());
            orderItem.setOid(oid);
            orderItemDao.addOrderItem(orderItem);
        }

        return oid;
    }

    @Override
    public OrdersExt findOrder(Integer oids) {
        return ordersDao.findOrder(oids);
    }

    @Override
    public void addNPA(OrdersExt ordersExt) {
         ordersDao.addNPA(ordersExt);
    }

    @Override
    public OrdersPage fingOrdersPage(Integer uid, Integer pagenow) {
        OrdersPage ordersPage = new OrdersPage();
        ordersPage.setUid(uid);
        System.out.println("pagenow:"+pagenow);
        ordersPage.setPagenow(pagenow);
        ordersPage.setPagesize(5);
        ordersPage.setPageall((pagenow-1)*ordersPage.getPagesize());
        List<Integer> oids=ordersDao.getPageOid(ordersPage);
        System.out.println("oid:");
        for (Integer oid:oids) {
            System.out.println(oid);
        }
        List<OrdersExt> list = new ArrayList<OrdersExt>();
        for (Integer o :oids) {
            OrdersExt ordersExt=ordersDao.findOrder(o);
            list.add(ordersExt);
        }
        /*for (OrdersExt i:list) {
            System.out.println("-----------------------");
            System.out.println("OrdersService:"+i.getName());
            for (OrderItemExt j:i.getItemExts()) {
                System.out.println("OrdersService:"+j.getItemid());
                System.out.println("OrdersService:"+j.getProduct().getPname());
            }
        }*/
        ordersPage.setList(list);
        ordersPage.setTotal(ordersDao.getCountOid(uid));
        Paging paging= PageUtil.pageUtil.getPaging(ordersPage);

        /*System.out.println("OrdersService:"+paging.getLastone());
        for (Object x:paging.getGroupList()) {
            System.out.println(x);
        }
        System.out.println("OrdersService:"+paging.getNext());*/

        ordersPage.setPaging(paging);
        return ordersPage;
    }

    @Override
    public void updateOrderState(OrderState orderState) {
        ordersDao.updateOrderState(orderState);
    }

}

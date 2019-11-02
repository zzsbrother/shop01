package com.zz.controller;

import com.zz.po.OrderItemExt;
import com.zz.po.OrderState;
import com.zz.po.OrdersExt;
import com.zz.service.IOrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pay")
public class PayController {

    @Resource
    private IOrdersService iOrdersService;
    @RequestMapping("gopay")
    public String gopay(HttpServletRequest request, HttpSession session){
        String addr=request.getParameter("addr2");
        String uname=request.getParameter("uname2");
        String phone=request.getParameter("phone2");
        System.out.println(addr);
        System.out.println(uname+"-"+phone);
        if(session.getAttribute("ordersExt")==null){
            return "cart";
        }
        OrdersExt ordersExt=(OrdersExt) session.getAttribute("ordersExt");
        ordersExt.setName(uname);
        ordersExt.setAddr(addr);
        ordersExt.setPhone(phone);
        iOrdersService.addNPA(ordersExt);
        session.setAttribute("ordersExt",ordersExt);
        System.out.println("PayController:name="+ordersExt.getName());
        return "pay";
    }

    @RequestMapping("payok")
    public String payok(HttpSession session, Model model){
        /*if(session.getAttribute("ordersExt")!=null){
            OrdersExt ordersExt=(OrdersExt)session.getAttribute("ordersExt");
            model.addAttribute("ordersExt",ordersExt);
            for (OrderItemExt o:ordersExt.getItemExts()) {
                System.out.println("PayController:ordersExt"+o.getSubtotal());
            }
            return "payok";
        }*/
        if(session.getAttribute("ordersExt")!=null){
            OrdersExt ordersExt=(OrdersExt)session.getAttribute("ordersExt");
            Integer oid=ordersExt.getOid();
            OrderState orderState = new OrderState();
            orderState.setOid(oid);
            orderState.setState(2);
            iOrdersService.updateOrderState(orderState);
        }
        return "payok";
    }
}

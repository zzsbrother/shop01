package com.zz.controller;

import com.zz.po.Cart;
import com.zz.po.OrdersExt;
import com.zz.po.User;
import com.zz.service.IOrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrdersController {

    @Resource
    private IOrdersService ordersService;

    @RequestMapping("addorder")
    public String addorder(HttpSession session, HttpServletRequest request){
        if(session.getAttribute("users")==null){
            return "login";
        }
        User user=(User)session.getAttribute("users");
        Integer uid=user.getUid();
        if(session.getAttribute("cart")!=null){
            Cart cart=(Cart)session.getAttribute("cart");
            Integer oid=ordersService.addOrder(cart,uid);
            request.setAttribute("oid",oid);
            return "forward:/order/goorder.do";
        }
        return null;
    }

    @RequestMapping("goorder")
    public String goorder(HttpServletRequest request, Model model,HttpSession session){
        Integer oid=Integer.parseInt(request.getAttribute("oid").toString());
        System.out.println("OrdersController:oid="+oid);
        OrdersExt ordersExt=ordersService.findOrder(oid);
        session.setAttribute("ordersExt",ordersExt);
        model.addAttribute("ordersExt",ordersExt);
        return "order";
    }
}

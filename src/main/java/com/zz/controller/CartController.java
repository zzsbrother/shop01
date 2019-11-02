package com.zz.controller;


import com.zz.po.Cart;
import com.zz.po.CartItel;
import com.zz.po.Product;
import com.zz.service.IProductService;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Resource
    private IProductService productService;

    //修改商品个数
    @RequestMapping("updata")
    public void updata(Integer pid,Integer number,HttpSession session,HttpServletResponse response) throws IOException {
        Cart cart=(Cart)session.getAttribute("cart");
        if(cart==null){
            Cart cart1 = new Cart();
            session.setAttribute("cart",cart1);
        }
        cart.ChangeProNum(pid,number);
        Double total=cart.getTotalPrice();
        Integer numbers=cart.getNumbers();

        Map map = new HashMap();
        map.put("total",total);
        map.put("numbers",numbers);
        /*JSONArray jsonArray= JSONArray*/
        /*put.println(array.toString());*/
        response.getWriter().println(total);
    }
    //添加商品到购物车
    @RequestMapping("addProToCart")
    public String addProToCart(Integer pid,Integer number,HttpServletResponse response, HttpSession session) throws IOException {
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart==null){
            Cart cartnew =new Cart();
            session.setAttribute("cart",cartnew);
        }
        Product product=productService.getProductByPid(pid);

        CartItel cartItel = new CartItel();
        cartItel.setNumber(number);
        cartItel.setProduct(product);

        ((Cart) session.getAttribute("cart")).addProToCart(cartItel);
        System.out.println("Controller执行addProToCart");
        response.getWriter().println("ok");
        return null;
    }

    //删除某一个商品
    @RequestMapping("deleteone")
    public void deleteOne(HttpSession session,Integer pid,HttpServletResponse response) throws IOException {
        Cart cart=(Cart)session.getAttribute("cart");
        if(cart==null){
            Cart cart1 = new Cart();
            session.setAttribute("cart",cart1);
        }
        cart.deletePro(pid);
        Double total=cart.getTotalPrice();
        Integer numbers=cart.getNumbers();
        response.getWriter().println(total);
    }

    //清空购物车
    @RequestMapping("deleteall")
    public String deleteAll(HttpSession session){
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart==null){
            Cart cartnew =new Cart();
            session.setAttribute("cart",cartnew);
        }
        System.out.println("Controller:ClaerCart（）执行了");
        cart.ClearCart();
        return "cart";
    }

    //登录购物车页面
    @RequestMapping("cart")
    public String cart(){
        return "cart";
    }

}

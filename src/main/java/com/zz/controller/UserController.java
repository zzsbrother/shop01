package com.zz.controller;

import com.alibaba.fastjson.JSON;
import com.zz.po.*;
import com.zz.service.ICategoryService;
import com.zz.service.IOrdersService;
import com.zz.service.IUserService;
import com.zz.util.CateListUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
class UserController {
    @Resource
    private ICategoryService iCategoryService;
    @Resource
    private IUserService userService;
    @Resource
    private IOrdersService ordersService;

    @RequestMapping("/Test.do")
    public String Test(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "Test";
    }

    @RequestMapping("/showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text;html;charset=utf-8");
        long userId = Long.parseLong(request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        response.getWriter().write(JSON.toJSONString(user));
        response.getWriter().close();
    }

    @RequestMapping("/springmvcDemo.do")
    public String springmvcDemo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "user";
    }

    //注册页面
    @RequestMapping("/register.do")
    public String register(){
        return "register";
    }

    /*验证用户名的合法性*/
    @RequestMapping("check.do")
    public String findUserName(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String username=request.getParameter("username");
        System.out.println(username);
        User user = userService.findUserName(username);
        if(user!=null){
            response.getWriter().println("2");
        }else{
            response.getWriter().println("1");
        }
        return null;
    }

    /*校验手机号*/
    @RequestMapping("checkTel")
    public String CheckTel(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String tel = request.getParameter("tel");
        String regExp = "1[3|5|7|8|]\\d{9}";
        Pattern p = Pattern.compile(regExp);
        Matcher m= p.matcher(tel);
        if(m.find()){
            response.getWriter().println("1");
        }else{
            response.getWriter().println("2");
        }
        return null;
    }

    /*校验邮箱*/
    @RequestMapping("checkEmail")
    public String CheckEmail(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String regExp = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        Pattern p = Pattern.compile(regExp);
        Matcher m= p.matcher(email);
        if(m.find()){
            response.getWriter().println("1");
        }else{
            response.getWriter().println("2");
        }
        return null;
    }

    //判断注册信息是否合格完成跳转
    @RequestMapping("doRegister")
    public String doRegister(User user, Model model){
        Boolean flag = true;
        if(user.getUsername()==null ||"".equals(user.getUsername())){
            model.addAttribute("username","用户名不能为空");
            flag=false;
        }
        if(user.getPassword()==null ||"".equals(user.getPassword())){
            model.addAttribute("password","密码不能为空");
            flag=false;
        }
        if(user.getPhone()==null ||"".equals(user.getPhone())){
            model.addAttribute("phone","电话不能为空");
            flag=false;
        }
        if(user.getName()==null ||"".equals(user.getName())){
            model.addAttribute("name","真实姓名不能为空");
            flag=false;
        }
        if(user.getEmail()==null ||"".equals(user.getEmail())){
            model.addAttribute("email","邮箱不能为空");
            flag=false;
        }
        if(flag){
            userService.register(user);
            return "login";
        }else{
            return "register";
        }
    }

    //登录页面
    @RequestMapping("login")
    public String login(){return "login";}

    //判断登录条件实现跳转
    @RequestMapping("gologin")
    public String goLogin(User user, String remenber, Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session){
        if(user.getUsername()==null||"".equalsIgnoreCase(user.getUsername())){
            model.addAttribute("model","用户名不能为空");
            return "login";
        }
        System.out.println(remenber+"------------");
        System.out.println(user.getUsername()+"----------");
        System.out.println(user.getPassword()+"----------");
        User users =userService.login(user);
        System.out.println(users+"----------");
        if(users!=null){
            session.setAttribute("users",users);

            Cookie nameCookie = new Cookie("username",user.getUsername());
            Cookie passCookie = new Cookie("password",user.getPassword());

            if(remenber!=null){
                nameCookie.setMaxAge(60*60*24*7);
                passCookie.setMaxAge(60*60*24*7);
            }else{
                nameCookie.setMaxAge(0);
                passCookie.setMaxAge(0);
            }
            nameCookie.setPath("/");
            passCookie.setPath("/");

            response.addCookie(nameCookie);
            response.addCookie(passCookie);
            CateListUtil.cateListUtil.getCateList(request,iCategoryService);
            List<CategoryExt> cateList=(List<CategoryExt>)request.getServletContext().getAttribute("cateList");
            for (CategoryExt c :cateList) {
                System.out.println(c.getCname());
            }
            return "my";
        }else{
            model.addAttribute("model","用户名或密码错误");
            return "login";
        }
    }

    //访问个人页面
    @RequestMapping("my")
    public String my(HttpServletRequest request,HttpSession session){
        if(session.getAttribute("users")==null){
            return "login";
        }
        CateListUtil.cateListUtil.getCateList(request,iCategoryService);
        System.out.println("执行了my的登录");
        return "my";
    }

    @RequestMapping("changeMy")
    public String changeMy(HttpServletRequest request,HttpSession session){
        User user = new User();
        String username=request.getParameter("username");
        System.out.println(username);
        String password=request.getParameter("password");
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String addr=request.getParameter("addr");

        user.setAddr(addr);
        user.setEmail(email);
        user.setName(name);
        user.setPassword(password);
        user.setUsername(username);
        user.setPhone(phone);

        User users = (User)session.getAttribute("users");
        System.out.println(users.getUid());
        user.setUid(users.getUid());
        /*System.out.println(user.getUsername());*/
       /* return null;*/
        userService.changeMy(user);
        session.setAttribute("users",user);
        System.out.println("Controller执行了");
        return "my";
    }

    //我的订单
    @RequestMapping("myorder")
    public String myOrder(HttpSession session,Integer pagenow,Model model,Integer goPage){
        if(session.getAttribute("users")==null){
            return "login";
        }
        User user=(User)session.getAttribute("users");
        if(goPage!=null){
            pagenow=goPage;
        }
        Integer uid=user.getUid();
        OrdersPage ordersPage=ordersService.fingOrdersPage(uid,pagenow);
        /*for (OrdersExt i:ordersPage.getList()) {
            System.out.println("-----------------------");
            System.out.println("OrdersService:"+i.getName());
            for (OrderItemExt j:i.getItemExts()) {
                System.out.println("OrdersService:"+j.getItemid());
                System.out.println("OrdersService:"+j.getProduct().getPname());
            }
        }*/
        model.addAttribute("ordersPage",ordersPage);
        model.addAttribute("goPage",goPage);
        return "myorder";
    }
}
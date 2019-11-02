package com.zz.controller;

import cn.dsna.util.images.ValidateCode;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/")
public class YZMController {

    @RequestMapping("yzm")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        ValidateCode vcode = new ValidateCode(163,64,4,90);
        String code = vcode.getCode();
        session.setAttribute("scode",code);
        vcode.write(response.getOutputStream());
    }

    @RequestMapping("getyzm")
    public void getYZM(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String yzmID = request.getParameter("yzmID");
        String code = session.getAttribute("scode").toString();
        if(!yzmID.equalsIgnoreCase(code)){
            System.out.println("-----------code:"+code+",yzm:"+yzmID);
            response.getWriter().println("2");
        }else{
            System.out.println("-----------code:"+code+",yzm:"+yzmID);
            response.getWriter().println("1");
        }
    }
}

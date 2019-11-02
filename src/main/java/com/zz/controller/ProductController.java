package com.zz.controller;

import com.zz.po.Page;
import com.zz.po.Product;
import com.zz.service.ICategoryService;
import com.zz.service.IProductService;
import com.zz.util.CateListUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ICategoryService iCategoryService;
    @Resource
    private IProductService productService;

    //导航栏内一级类目，二级类目查询
    @RequestMapping("search")
    public String getProductById(HttpServletRequest request, Model model, HttpSession session){
        /*让Application中有caseList*/
        CateListUtil.cateListUtil.getCateList(request,iCategoryService);

        Integer cid = Integer.parseInt(request.getParameter("cid"));
        model.addAttribute("cid",cid);
        Integer csid=0;
        if(Integer.parseInt(request.getParameter("csid"))!=0){
            csid= Integer.parseInt(request.getParameter("csid"));
        }
        Integer pagenow = Integer.parseInt(request.getParameter("pagenow"));
        Page page=productService.getProductByid(cid,pagenow,csid);
        //热门商品
        if(session.getAttribute("productLists")==null){
            List<Product> productList = productService.hotProduct();
            session.setAttribute("productLists",productList);
        }

        model.addAttribute("page",page);
        /*int csid = Integer.parseInt(request.getParameter("csid"));
        model.addAttribute("csid",csid);*/
        /*System.out.println("cid:"+cid);*/
        return "search";
    }
    //类目查询跳转
    @RequestMapping("goPage2")
    public String goPage2(HttpServletRequest request,Model model,HttpSession session){
        /*让Application中有caseList*/
        CateListUtil.cateListUtil.getCateList(request,iCategoryService);

        Integer cid = Integer.parseInt(request.getParameter("cid1"));
        model.addAttribute("cid",cid);
        Integer csid=0;
        if(Integer.parseInt(request.getParameter("csid1"))!=0){
            csid= Integer.parseInt(request.getParameter("csid1"));
        }
        Integer pagenow = Integer.parseInt(request.getParameter("goPage"));
        Page page=productService.getProductByid(cid,pagenow,csid);
        //热门商品
        if(session.getAttribute("productLists")==null){
            List<Product> productList = productService.hotProduct();
            session.setAttribute("productLists",productList);
        }
        model.addAttribute("page",page);
        model.addAttribute("goPage",page.getPagenow());
        /*int csid = Integer.parseInt(request.getParameter("csid"));
        model.addAttribute("csid",csid);*/
        /*System.out.println("cid:"+cid);*/
        return "search";
    }

    //搜索栏查询
    @RequestMapping("query")
    public String query(HttpServletRequest request,Model model,HttpSession session) throws UnsupportedEncodingException {
        /*让Application中有caseList*/
        CateListUtil.cateListUtil.getCateList(request,iCategoryService);
        //get提交的信息，需要转码，要不然是iso-8859-1编码
        String pname=request.getParameter("pnames");
        pname=new String(pname.getBytes("iso-8859-1"),"utf-8");
        int cid = Integer.parseInt(request.getParameter("cid"));
        model.addAttribute("cid",cid);
        Integer csid=0;
        if(Integer.parseInt(request.getParameter("csid"))!=0){
            csid= Integer.parseInt(request.getParameter("csid"));
        }
        System.out.println("Controller:csid="+csid);
        System.out.println("Controller:cid="+cid);
        Integer pagenow = Integer.parseInt(request.getParameter("pagenow"));
        Page page=productService.getProductByPName(cid,pagenow,csid,pname);
        System.out.println("Controller:pname="+page.getPnames());
        model.addAttribute("page",page);
        //热门商品
        if(session.getAttribute("productLists")==null){
            List<Product> productList = productService.hotProduct();
            session.setAttribute("productLists",productList);
        }
        return "query";
    }

    //模糊查询跳转
    @RequestMapping("goPage")
    public String goPage(HttpServletRequest request,Model model,HttpSession session) throws UnsupportedEncodingException {
        /*让Application中有caseList*/
        CateListUtil.cateListUtil.getCateList(request,iCategoryService);
        //get提交的信息，需要转码，要不然是iso-8859-1编码
        String pname=request.getParameter("productName");
        System.out.println("Controller:productName="+pname);
        /*String pname=new String(pnames.getBytes("iso-8859-1"),"utf-8");*/
        int cid = Integer.parseInt(request.getParameter("cid1"));
        model.addAttribute("cid",cid);
        Integer csid=0;
        if(Integer.parseInt(request.getParameter("csid1"))!=0){
            csid= Integer.parseInt(request.getParameter("csid1"));
        }
        /*System.out.println("Controller:csid="+csid);
        System.out.println("Controller:cid="+cid);*/
        Integer pagenow = Integer.parseInt(request.getParameter("goPage"));
        Page page=productService.getProductByPName(cid,pagenow,csid,pname);
        System.out.println("Controller:pname="+page.getPnames());
        //热门商品
        if(session.getAttribute("productLists")==null){
            List<Product> productList = productService.hotProduct();
            session.setAttribute("productLists",productList);
        }
        model.addAttribute("page",page);
        model.addAttribute("goPage",page.getPagenow());
        return "query";
    }

    //每一个商品页面
    @RequestMapping("proDetails")
    public String proDetails(HttpServletRequest request,Model model){
        /*让Application中有caseList*/
        CateListUtil.cateListUtil.getCateList(request,iCategoryService);
        Integer pid=Integer.parseInt(request.getParameter("pid"));
        System.out.println("pid:"+pid);
        Product product=productService.getProductByPid(pid);
        model.addAttribute("product",product);
        return "proDetails";
    }
}

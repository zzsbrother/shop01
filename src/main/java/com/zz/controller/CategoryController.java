package com.zz.controller;

import com.zz.po.CategoryExt;
import com.zz.po.CategoryStyle;
import com.zz.service.ICategoryService;
import com.zz.service.ICategoryStyle;
import com.zz.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Resource
    private ICategoryService iCategoryService;
    @Resource
    private ICategoryStyle categoryStyle;
    @RequestMapping("index")
    public String getCategory(Model model, HttpServletRequest request){
        List<CategoryExt> displayList = iCategoryService.getDisplayCategoryAll();
      /*  for (CategoryExt c:displayList) {
            System.out.println("----------------------");
            System.out.println(c.getCname()+":");
            for (CategorySecondExt cs:c.getCslist()){
                for (Product p:cs.getProList()) {
                    System.out.println(p.getPname());
                }
            }
        }*/
        /*显示的一级类目，二级类目，商品信息*/
        model.addAttribute("displayList",displayList);
        /*首页一级类目的样式*/
        List<CategoryStyle> styleList=categoryStyle.getCategoryStyle();
        model.addAttribute("styleList",styleList);
        for (CategoryStyle c:styleList) {
            System.out.println(c.getCategorycolor());
        }
        /*所以一级类目和二级类目*/
        List<CategoryExt> cateList=null;
        if(request.getServletContext().getAttribute("cateList")==null){
            cateList=iCategoryService.getAllCategory();
            request.getServletContext().setAttribute("cateList",cateList);
            System.out.println("category的request.getServletContext().setAttribute(\"cateList\",cateList);执行了");
        }else{
            System.out.println("category：有了");
        }

        return "index";
    }
}

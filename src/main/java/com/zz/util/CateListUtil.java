package com.zz.util;

import com.zz.po.CategoryExt;
import com.zz.service.ICategoryService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Component
public class CateListUtil {
    public static CateListUtil cateListUtil;
    @PostConstruct
    public void get(){
        cateListUtil=this;
    }
    /*判断Application中是否已经有caseList，如果没有就获取存入*/
    public void getCateList(HttpServletRequest request, ICategoryService iCategoryService){
        List<CategoryExt> cateList=null;
        if(request.getServletContext().getAttribute("cateList")==null){
            cateList=iCategoryService.getAllCategory();
            request.getServletContext().setAttribute("cateList",cateList);
            System.out.println("product的request.getServletContext().setAttribute(\"cateList\",cateList);执行了");
        }else{
            System.out.println("导航栏里面的cateList有了");
        }
    }
}

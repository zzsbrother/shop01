package com.zz.service.impl;

import com.zz.dao.ICategoryDao;
import com.zz.dao.IProductDao;
import com.zz.po.*;
import com.zz.service.ICategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service("categoryService")
@Transactional
public class CategoryServicelmpl implements ICategoryService {
    @Resource
    private ICategoryDao categoryDao;
    @Resource
    private IProductDao productDao;

    @Override
    public List<CategoryExt> getAllCategory() {
       List<CategoryExt> list=categoryDao.getAllCategory();
        for (CategoryExt c:list){
            System.out.print(c.getCid()+":");
            System.out.println(c.getCname());
            System.out.println("-------------");
            for (CategorySecond cs:c.getCslist()) {
                System.out.println(cs.getCsname());
            }
        }
        return categoryDao.getAllCategory();
    }

    @Override
    public List<CategoryExt> getDisplayCategoryAll() {
        List<CategoryExt> list=categoryDao.getDisplayCategoryAll();
        for (CategoryExt c:list) {
            /*System.out.println("----------------------");
            System.out.println(c.getCname()+":");*/
            for (CategorySecondExt cs:c.getCslist()){
                List<Product> proList=productDao.getProductById(cs.getCsid());
                cs.setProList(proList);
                for (Product p:cs.getProList()) {
                    /*System.out.println(p.getPname());*/
                }
            }
        }
        return list;
    }

}

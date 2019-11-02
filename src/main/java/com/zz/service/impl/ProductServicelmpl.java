package com.zz.service.impl;

import com.zz.dao.ICategoryDao;
import com.zz.dao.IProductDao;
import com.zz.po.*;
import com.zz.service.IProductService;
import com.zz.util.PageUtil;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class ProductServicelmpl implements IProductService {

    @Resource
    private IProductDao productDao;
    @Resource
    private ICategoryDao categoryDao;

    @Override
    public Page getProductByid(Integer cid,Integer pagenow,Integer csid) {
        Page page = new Page();
        page.setCid(cid);
        page.setCsid(csid);
        page.setPagenow(pagenow);
        page.setPagesize(12);
        page.setPageall((page.getPagenow()-1)*page.getPagesize());
        List<Product> proList=null;
        Integer total = 0;
        /*判断是一级类目查询还是二级类目查询还是商品名字查询*/
        if(csid==0){
            proList=productDao.getProductAllByCid(page);
            total = productDao.getCidTotal(page);
        }else{
            proList=productDao.getProductAllByCsid(page);
            total = productDao.getCsidTotal(page);
        }
        page.setTotal(total);
        page.setProList(proList);
        Paging paging = PageUtil.pageUtil.getPaging(page);
        page.setPaging(paging);
        return page;
    }

    @Override
    public Page getProductByPName(Integer cid, Integer pagenow, Integer csid, String pname) {
        Page page = new Page();
        page.setCid(cid);
        page.setCsid(csid);
        /*if(pagenow>page.getTotalpage()){
            pagenow=page.getTotalpage();
        }*/
        page.setPagenow(pagenow);
        page.setPagesize(12);
        System.out.println("Service层：pname="+pname);
        page.setPnames(pname);
        page.setPageall((page.getPagenow()-1)*page.getPagesize());
        List<Product> proList=null;
        Integer total = 0;
        /*判断是一级类目查询还是二级类目查询还是商品名字查询*/
        if(csid==0&&cid==0){
            proList=productDao.getProductAllByCsid(page);
            total = productDao.getCsidTotal(page);
        } else if(csid==0){
            proList=productDao.getProductAllByCid(page);
            total = productDao.getCidTotal(page);
        }else{
            proList=productDao.getProductAllByCsid(page);
            total = productDao.getCsidTotal(page);
        }
        page.setTotal(total);
        page.setProList(proList);
        int totalpage = 0;

        if(total%page.getPagesize()==0){
            totalpage=total/page.getPagesize();
            page.setTotalpage(totalpage);
        }else{
            totalpage=(total/page.getPagesize())+1;
            page.setTotalpage(totalpage);
        }
        Paging paging = PageUtil.pageUtil.getPaging(page);
        page.setPaging(paging);
        return page;
    }

    public Product getProductByPid(Integer pid){
        return productDao.getProductByPid(pid);
    }

    @Override
    public List<Product> hotProduct() {
        return productDao.hotProduct();
    }

}

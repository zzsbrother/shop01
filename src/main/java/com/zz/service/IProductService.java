package com.zz.service;

import com.zz.po.CategoryExt;
import com.zz.po.Page;
import com.zz.po.Paging;
import com.zz.po.Product;

import java.util.List;

public interface IProductService {
    Page getProductByid(Integer cid, Integer pagenow, Integer csid);
    Page getProductByPName(Integer cid, Integer pagenow, Integer csid,String pname);
    Product getProductByPid(Integer pid);
    List<Product> hotProduct();
}

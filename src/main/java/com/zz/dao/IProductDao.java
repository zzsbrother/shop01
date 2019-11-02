package com.zz.dao;

import com.zz.po.Page;
import com.zz.po.Product;

import java.util.List;

public interface IProductDao {
    List<Product> getProductById(Integer id);
    List<Product> getProductAllByCid(Page page);
    int getCidTotal(Page page);
    List<Product> getProductAllByCsid(Page page);
    int getCsidTotal(Page page);
    Product getProductByPid(Integer pid);
    List<Product> hotProduct();
}

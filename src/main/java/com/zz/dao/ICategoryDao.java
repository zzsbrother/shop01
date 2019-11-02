package com.zz.dao;

import com.zz.po.CategoryExt;

import java.util.List;

public interface ICategoryDao {
    List<CategoryExt> getAllCategory();
    List<CategoryExt> getDisplayCategoryAll();
    List<Integer> getCsid(int cid);
}

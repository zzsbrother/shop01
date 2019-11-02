package com.zz.service;

import com.zz.po.CategoryExt;

import java.util.List;

public interface ICategoryService {
    List<CategoryExt> getAllCategory();
    List<CategoryExt> getDisplayCategoryAll();
}

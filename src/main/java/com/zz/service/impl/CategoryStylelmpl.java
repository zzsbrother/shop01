package com.zz.service.impl;

import com.zz.dao.ICategoryStyleDao;
import com.zz.po.CategoryStyle;
import com.zz.service.ICategoryStyle;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service("categoryStyle")
@Transactional
public class CategoryStylelmpl implements ICategoryStyle {
    @Resource
    private ICategoryStyleDao categoryStyleDao;

    @Override
    public List<CategoryStyle> getCategoryStyle() {
        return categoryStyleDao.getCategoryStyle();
    }
}

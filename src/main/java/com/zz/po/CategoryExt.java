package com.zz.po;

import java.util.List;

public class CategoryExt extends  Category{
    private List<CategorySecondExt> cslist;

    public List<CategorySecondExt> getCslist() {
        return cslist;
    }

    public void setCslist(List<CategorySecondExt> cslist) {
        this.cslist = cslist;
    }
}

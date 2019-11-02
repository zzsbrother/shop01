package com.zz.po;
import java.util.List;
import java.util.Map;

public class Paging {
    private Integer pagenow;    //当前页码
    private Integer next;       //接下来一组的第一个页码
    private Integer lastone;    //上一组的最后一个页码
    private Integer groupnow;   //当前页是第几组
    private Integer group;      //当前分页中一共多少组
    private List groupList;       //所有分组


    public Paging() {
    }

    public Integer getGroupnow() {
        return groupnow;
    }

    public void setGroupnow(Integer groupnow) {
        this.groupnow = groupnow;
    }

    public Integer getPagenow() {
        return pagenow;
    }

    public void setPagenow(Integer pagenow) {
        this.pagenow = pagenow;
    }

    public Integer getNext() {
        return next;
    }

    public void setNext(Integer next) {
        this.next = next;
    }

    public Integer getLastone() {
        return lastone;
    }

    public void setLastone(Integer lastone) {
        this.lastone = lastone;
    }

    public List getGroupList() {
        return groupList;
    }

    public void setGroupList(List groupList) {
        this.groupList = groupList;
    }

    public Integer getGroup() {
        return group;
    }

    public void setGroup(Integer group) {
        this.group = group;
    }
}

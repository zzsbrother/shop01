package com.zz.po;

public class PageSource {
    private Integer pagenow;  //当前页数
    private Integer pagesize; //一页多少个数据
    private Integer pageall; //当前查询从第几个开始，是(pagenow-1)*pagesize
    private Integer total;   //总的查询数据个数
    private Integer totalpage;  //总的页数
    private Paging paging;      //分页的相关内容

    public Integer getPagenow() {
        return pagenow;
    }

    public void setPagenow(Integer pagenow) {
        this.pagenow = pagenow;
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }

    public Integer getPageall() {
        return pageall;
    }

    public void setPageall(Integer pageall) {
        this.pageall = pageall;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(Integer totalpage) {
        this.totalpage = totalpage;
    }

    public Paging getPaging() {
        return paging;
    }

    public void setPaging(Paging paging) {
        this.paging = paging;
    }
}

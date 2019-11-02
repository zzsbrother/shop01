package com.zz.util;

import com.zz.po.Page;
import com.zz.po.PageSource;
import com.zz.po.Paging;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;
@Component
public class PageUtil {
    public static PageUtil pageUtil;

    @PostConstruct
    public void inti(){
        pageUtil=this;
    }
    public Paging getPaging(PageSource pageSource){
        Paging paging = new Paging();
        Integer total=pageSource.getTotal();
        Integer pagesize=pageSource.getPagesize();
        int pagenow=pageSource.getPagenow();
        System.out.println("...."+pageSource.getTotalpage());

        //计算一共有多少页
        if(total%pagesize==0){
            pageSource.setTotalpage(total/pagesize);
        }else{
            pageSource.setTotalpage(total/pagesize+1);
        }

        /*算一共查询的类目有多少组*/
        if(pageSource.getTotalpage()%5==0){
            paging.setGroup(pageSource.getTotalpage()/5);
        }else{
            paging.setGroup((pageSource.getTotalpage()/5)+1);
        }
       /* System.out.println("当前所查类目一共："+paging.getGroup()+"组");*/
        /*算当前页在第几组*/
        if(pagenow%5==0){
            paging.setGroupnow(pagenow/5);
        }else{
            paging.setGroupnow((pagenow/5)+1);
        }
        /*System.out.println("当前是页数属于第："+paging.getGroup()+"组");*/
        //计算当前分组内的所有页码
        List<Integer> list = new ArrayList<Integer>();
        if(paging.getGroupnow()==paging.getGroup()){
            for(int i=(paging.getGroupnow()-1)*5+1;i<=pageSource.getTotalpage();i++){
                list.add(i);
            }
        }else {
            for (int i = 1; i <= 5; i++) {
                list.add((paging.getGroupnow()-1)* 5 + i);
            }
        }/*
        for (int i:list) {
            System.out.println("遍历list"+i);
        }*/
        paging.setGroupList(list);

        int o=0;
        //上一组最后一个
        if(paging.getGroupnow()==1){
            System.out.println("执行的是setLastone");
            paging.setLastone(o);
        }else{
            paging.setLastone((paging.getGroupnow()-1)*5);
        }
        /*System.out.println("上一组最后一个是："+paging.getGroup()+"页");*/

        //下一组第一个
        if(paging.getGroupnow()!=paging.getGroup()){
            paging.setNext(paging.getGroupnow()*5+1);
        }else{
            /*System.out.println("执行的是else");*/
            paging.setNext(o);
        }
        /*System.out.println("下一组第一个是："+paging.getNext()+"页");*/
        return paging;
    }
}

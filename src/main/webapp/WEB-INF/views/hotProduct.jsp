<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="shop-pg-left f-l" style="width:215px">
    <div class="shop-left-buttom" style="margin-top:0;">
        <div class="sp-tit1">
            <h3>商品推荐</h3>
        </div>
        <ul class="shop-left-ul">
            <c:forEach items="${productLists}" var="p" varStatus="i">
                <li <c:if test="${i.count==3}">style="border-bottom:0;"</c:if>>
                    <div class="li-top">
                        <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}" class="li-top-tu"><img src="${pageContext.request.contextPath}/${p.image}" width="95"/></a>
                        <p class="jiage"><span class="sp1">￥${p.shopprice}</span><span class="sp2">￥${p.marketprice}</span></p>
                    </div>
                    <p class="miaoshu">${p.pname}</p>
                    <div class="li-md">
                        <div class="md-l f-l">
                            <p name="number" class="md-l-l f-l" ap="">1</p>
                            <div class="md-l-r f-l">
                                <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <div class="md-r f-l">
                            <button class="md-l-btn1">立即购买</button>
                            <button class="md-l-btn2" name="addcart">加入购物车</button>
                            <input type="hidden" value="${p.pid}"/>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <p class="pingjia">88888评价</p>
                    <p class="weike">微克宅购自营</p>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

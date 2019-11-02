<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8" />
    <title>搜索列表页(搜索商家)</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        //获取pname 判断pagenow是否超过接线
        function goPages(){
            var pname = $("[name='pnames']");
            var proname=$("#productName");
            proname.val(pname.val());
            var gopage=$("#goPage");
            if(gopage.val()>${page.totalpage}){
                gopage.val(${page.totalpage})
            }
            if(gopage.val()<1){
                gopage.val(1)
            }
        }
        $(function () {
            var addcart=$("[name='addcart']");
            addcart.click(function () {
                var pid=$(this).next().val();
                var number=$(this).parent().prev().children("[name='number']").text();
                /*alert(pid+"_"+number);*/
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/addProToCart.do",
                    data:{
                        "pid":pid,
                        "number":number
                    },
                    dataType:"text",
                    success:function (data) {
                        alert("添加成功");
                    }
                });
            });
        });
    </script>
</head>

<body>
<%@ include file="head.jsp"  %>
<!--nav-->
<%@ include file="nav.jsp"  %>
<!--内容开始-->
<div class="screening-results w1200">
    <p class="tiao">找到共 ${page.total} 条</p>
</div>
<!--内容↓↑-->
<div class="shop-page-con w1200">
    <%@include file="hotProduct.jsp"%>
    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:0;">
            <ul class="shop-cmp-l f-l">
                <li class="current"><a href="#">综合 ↓</a></li>
                <li><a href="#">销量 ↓</a></li>
                <li><a href="#">新品 ↓</a></li>
                <li><a href="#">评价 ↓</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="shop-cmp-m f-l">
                <span>价格</span><input type="text" /><span>-</span><input type="text" />
            </div>
            <div class="shop-cmp-r f-l">
                <ul class="f-l">
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>包邮</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>进口</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>仅显示有货</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满赠</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满减</span>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <button>确定</button>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="shop-right-con">
            <ul class="shop-ul-tu shop-ul-tu1">
                <c:forEach items="${page.proList}" var="p" varStatus="i">
                    <li <c:if test="${i.count%4==0}">
                        style="margin-right:0;"
                    </c:if>
                    >
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
                        <p class="pingjia">99999评价</p>
                        <p class="weike">星星自营</p>
                    </li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>

            <!--分页-->
            <c:if test="${page.total!=0}">
                <div class="paging">
                    <div class="pag-left f-l">
                        <a href="#" class="about left-r f-l"><</a>
                        <ul class="left-m f-l">
                            <c:if test="${page.paging.lastone!=0}">
                                <li><a href="${pageContext.request.contextPath}/product/query.do?cid=${page.cid}&csid=${page.csid}&pagenow=1&pnames=${page.pnames}">1</a></li>
                                <li><a href="${pageContext.request.contextPath}/product/query.do?cid=${page.cid}&csid=${page.csid}&pagenow=${page.paging.lastone}&pnames=${page.pnames}">...</a></li>
                            </c:if>
                            <c:forEach items="${page.paging.groupList}" var="i">
                                <li <c:if test="${i==page.pagenow}">
                                    class="current"
                                </c:if>>
                                    <a href="${pageContext.request.contextPath}/product/query.do?cid=${page.cid}&csid=${page.csid}&pagenow=${i}&pnames=${page.pnames}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${page.paging.next!=0}">
                                <li><a href="${pageContext.request.contextPath}/product/query.do?cid=${page.cid}&csid=${page.csid}&pagenow=${page.paging.next}&pnames=${page.pnames}">...</a></li>
                                <li><a href="${pageContext.request.contextPath}/product/query.do?cid=${page.cid}&csid=${page.csid}&pagenow=${page.totalpage}&pnames=${page.pnames}">${page.totalpage}</a></li>
                            </c:if>
                            <div style="clear:both;"></div>
                        </ul>
                        <a href="#" class="about left-l f-l">></a>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="pag-right f-l">
                        <form method="post" action="${pageContext.request.contextPath}/product/goPage.do">
                            <div class="jump-page f-l">
                                <input type="number" id="goPage" name="goPage" value="${goPage}"/>页
                            </div>
                            <input type="hidden" name="cid1" value="0">
                            <input type="hidden" name="csid1" value="0">
                            <input type="hidden" id="productName" name="productName">
                            <button type="submit" id="go" class="f-l" onclick="goPages()">确定</button>
                        </form>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </c:if>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@ include file="last.jsp"  %>

</body>
</html>


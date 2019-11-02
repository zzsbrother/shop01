<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        //删除某一个购物项
        function deleteone(pid){
            var total=$("#total");
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/deleteone.do",
                data:{
                    "pid":pid
                },
                dataType:"text",
                success:function (data) {
                    total.text(data);
                    $("#p"+pid).remove();
                }
            })
        }

        //增加商品个数或减少商品个数
        $(function () {

            $("[name='lefttn']").click(function () {
                var number=$(this).next().val();
                var pid=$(this).next().prop("id");
                var total=$("#total");
                /*alert(pid+"_"+number);*/
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/updata.do",
                    data:{
                        "number":number,
                        "pid":pid
                    },
                    dataType:"text",
                    success:function (data) {
                        /*alert(data)*/
                        total.text(data);
                    }
                })
            })

            $("[name='righttn']").click(function () {
                var number=$(this).prev().val();
                var pid=$(this).prev().prop("id");
                var total=$("#total");
                /*alert(pid+"_"+number);*/
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/updata.do",
                    data:{
                        "number":number,
                        "pid":pid
                    },
                    dataType:"text",
                    success:function (data) {
                       /* alert(data)*/
                        total.text(data);
                    }
                })
            })
        })
    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="head.jsp"%>


<!--内容开始-->
<div class="cart-content w1200">
    <ul class="cart-tit-nav">
        <li class="current"><a href="#">全部商品   21</a></li>
        <div style="clear:both;"></div>
    </ul>
    <div class="cart-con-tit">
        <p class="p1">
            <input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>
        </p>
        <p class="p2">商品信息</p>
        <p class="p3">规格</p>
        <p class="p4">数量</p>
        <p class="p5">单价（元）</p>
        <p class="p6">金额（元）</p>
        <p class="p7">操作</p>
    </div>

    <div id="deletediv">
        <c:forEach items="${cart.cartProList}" var="c">
                <div class="cart-con-info" id="p${c.product.pid}">
                    <div class="info-top">
                    </div>
                    <div class="info-mid">
                        <input type="checkbox" value="" name="hobby" class="mid-ipt f-l"></input>
                        <div class="mid-tu f-l">
                            <a href="#"><img src="${pageContext.request.contextPath}/${c.product.image}" width="70" /></a>
                        </div>
                        <div class="mid-font f-l">
                            <a href="#">${c.product.pname}</a>
                            <span>满赠</span>
                        </div>
                        <div class="mid-guige f-l">
                            <p>颜色：蓝色</p>
                            <p>尺码：XL</p>
                            <div class="guige-xiugai" xg-g="xg1">
                                <div class="xg-left f-l">
                                    <dl>
                                        <dt>颜  色</dt>
                                        <dd>
                                            <a href="JavaScript:;" class="current">黑色</a>
                                            <a href="JavaScript:;">白色</a>
                                        </dd>
                                        <div style="clear:both;"></div>
                                    </dl>
                                    <dl>
                                        <dt>尺  码</dt>
                                        <dd>
                                            <a href="JavaScript:;" class="current">M</a>
                                            <a href="JavaScript:;">L</a>
                                            <a href="JavaScript:;">XL</a>
                                        </dd>
                                        <div style="clear:both;"></div>
                                    </dl>
                                    <a href="JavaScript:;" class="qd">确定</a>
                                    <a href="JavaScript:;" class="qx" qx="xg1">取消</a>
                                </div>
                                <div class="xg-right f-l">
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/dai2.gif" /></a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                        <div class="mid-sl f-l">
                            <a href="JavaScript:;" name="lefttn" class="sl-left">-</a>
                            <input type="text" value="${c.number}" id="${c.product.pid}"/>
                            <a href="JavaScript:;" name="righttn" class="sl-right">+</a>
                        </div>
                        <p class="mid-dj f-l">¥ <span>${c.product.shopprice}</span></p>
                        <p class="mid-je f-l">¥ <span>${c.subtotal}</span></p>
                        <div class="mid-chaozuo f-l">
                            <a href="#" onclick="deleteone(${c.product.pid})">删除</a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
        </c:forEach>
    </div>



    <div class="cart-con-footer">
        <div class="quanxuan f-l">
            <span>删除</span>
            <c:if test="${cart.cartProList==null}">
                <a href="#" >清空购物购物车</a>
            </c:if>
            <c:if test="${cart.cartProList!=null}">
                <a href="${pageContext.request.contextPath}/cart/deleteall.do" >清空购物购物车</a>
            </c:if>
            <p>（此处始终在屏幕下方）</p>
        </div>
        <div class="jiesuan f-r">
            <div class="jshj f-l">
                <p>合计（不含运费）</p>
                <p class="jshj-p2">
                    ￥：<span id="total">${cart.totalPrice}</span>
                </p>
            </div>
            <c:if test="${cart.cartProList!=null}">
                <a href="${pageContext.request.contextPath}/order/addorder.do" class="js-a1 f-l">结算</a>
            </c:if>
            <c:if test="${cart.cartProList==null}">
                <a href="#" class="js-a1 f-l">结算</a>
            </c:if>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--底部一块-->
<%@include file="last.jsp"%>
</body>
</html>


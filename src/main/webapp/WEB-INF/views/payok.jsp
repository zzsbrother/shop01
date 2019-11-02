<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8" />
    <title>支付成功</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="head.jsp"%>

<!--内容开始-->
<div class="payment w1200">
    <div class="payment-hd">
        <h3 class="success">支付成功</h3>
    </div>
    <c:forEach items="${ordersExt.itemExts}" var="o">
        <div class="payment-bd">
            <dl class="dl-hd">
            <dt><a href="#"><img src="${pageContext.request.contextPath}/${o.product.image}" width="100" /></a></dt>
                <dd>
                   <h3><a href="#">${o.product.pname}</a></h3>
                    <P>重力出击，超强冲力，排污更流畅</P>
                    <p><span>送货至:</span>&nbsp;&nbsp;${ordersExt.addr}（包邮）</p>
                    <p><span>数量:</span>&nbsp;&nbsp;&nbsp;&nbsp;${o.count}</p>
                    <p><span>价格:</span>&nbsp;&nbsp;&nbsp;&nbsp;¥${o.product.shopprice}</p>
                    <p><span>总价</span>&nbsp;&nbsp;&nbsp;&nbsp;<i>¥<span style="color: red">${o.subtotal}</span></i></p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
        </div>
    </c:forEach>
    <div class="payment-bd">
        <ul class="ul-bd">
            <li><span>总价格</span><p><i>¥${ordersExt.total}</i></p></li>
            <li><span>收货信息</span><p>${ordersExt.addr}， ${ordersExt.name}， ${ordersExt.phone}</p></li>
            <li><span>成交时间</span><p>${ordersExt.ordertime}</p></li>
            <li><span>订单号</span><p>${ordersExt.ordernumber}</p></li>
        </ul>
    </div>
    <div class="payment-ft">
        <a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=1"><button class="btn2">我的订单</button></a>
    </div>
</div>

<!--底部一块-->
<%@include file="last.jsp"%>
</body>
</html>



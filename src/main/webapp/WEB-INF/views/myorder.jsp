<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html >
<head>
    <meta charset="utf-8" />
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        function goPages(){
            var gopage=$("#goPage");
            if(gopage.val()>${ordersPage.totalpage}){
                gopage.val(${ordersPage.totalpage})
            }
            if(gopage.val()<1){
                gopage.val(1)
            }
        }
    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="head.jsp"%>

<!--nav-->
<%@include file="nav.jsp"%>

<!--内容开始-->
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="order-right f-r">
        <div class="order-hd">
            <dl class="f-l">
                <dt>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/data-tu2.gif" /></a>
                </dt>
                <dd>
                    <h3><a href="#">${users.username}</a></h3>
                    <p>${users.name}</p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <div class="ord-dai f-l">
                <p>待付款<span>1</span></p>
                <p>待发货<span>1</span></p>
                <p>待收货<span>1</span></p>
                <p>待评价<span>1</span></p>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="order-md">
            <div class="md-tit">
                <h3>我的订单</h3>
            </div>
            <div class="md-hd">
                <P class="md-p1"><input type="checkbox" name="hobby" value=""></input><span>全选</span></P>
                <p class="md-p2">商品信息</p>
                <p class="md-p3">规格</p>
                <p class="md-p4">单价（元）</p>
                <p class="md-p5">金额（元）</p>
                <p class="md-p6">操作</p>
            </div>
                <div class="md-info">
                    <c:forEach items="${ordersPage.list}" var="o">
                        <div class="dai-con">
                            <div class="dai">
                                <span>订单号：${o.ordernumber}</span>
                                <span><br/>下单时间：${o.ordertime}<br />收货地点：${o.addr}<br />收货电话：${o.phone}</span>
                            </div>
                            <c:forEach items="${o.itemExts}" var="oi">
                                <div class="dai-con">
                                    <dl class="dl1">
                                        <dt>
                                            <a href="#" class="f-l"><img src="${pageContext.request.contextPath}/${oi.product.image}" width="90"/></a>
                                            <div style="clear:both;"></div>
                                        </dt>
                                        <dd>
                                            <p></p>
                                            <span>X ${oi.count}</span>
                                        </dd>
                                        <div style="clear:both;"></div>
                                    </dl>
                                    <div class="dai-right f-l">
                                        <P class="d-r-p1" style=" position:relative;top:-20px;">颜色：蓝色<br />尺码：XL</P>
                                        <p class="d-r-p2" style="top:-43px;">¥ ${oi.product.shopprice}</p>
                                        <p class="d-r-p3" style="top:-43px;">¥ ${oi.subtotal}</p>
                                        <p class="d-r-p4"><a href="#">移入收藏夹</a><br /><a href="#">删除</a><br /><a href="#">确认收货</a><br /><a href="JavaScript:;" ckwl="">查看物流</a></p>
                                    </div>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
            <!--分页-->
            <c:if test="${ordersPage.total!=0}">
                <div class="paging">
                    <div class="pag-left f-l">
                        <a href="#" class="about left-r f-l"><</a>
                        <ul class="left-m f-l">
                            <c:if test="${ordersPage.paging.lastone!=0}">
                                <li><a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=1">1</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=${ordersPage.paging.lastone}">...</a></li>
                            </c:if>
                            <c:forEach items="${ordersPage.paging.groupList}" var="i">
                                <li <c:if test="${i==ordersPage.pagenow}">
                                    class="current"
                                </c:if>>
                                    <a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${ordersPage.paging.next!=0}">
                                <li><a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=${ordersPage.paging.next}">...</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=${ordersPage.totalpage}">${ordersPage.totalpage}</a></li>
                            </c:if>
                            <div style="clear:both;"></div>
                        </ul>
                        <a href="#" class="about left-l f-l">></a>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="pag-right f-l">
                        <form action="${pageContext.request.contextPath}/user/myorder.do" method="post">
                            <div class="jump-page f-l">
                                第<input type="number" id="goPage" name="goPage" value="${goPage}"/>页
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
<%@include file="last.jsp"%>

<!--查看物流 弹窗-->
<div class="view-logistics">
    <div class="view-bg"></div>
    <div class="view-con">
        <div class="view-tit">
            <h3>物流信息</h3>
            <a href="JavaScript:;" guanbi="">
                <img src="${pageContext.request.contextPath}/images/close-select-city.gif" />
            </a>
            <div style="clear:both;"></div>
        </div>
        <div class="view-bd">
            <ul>
                <li class="bd-pdl-li after"><span>1</span>2015-08-06　周四　　14:06:53您的订单开始处理</li>
                <li class="after"><span>2</span>14:08:44您的订单待配货</li>
                <li><span>3</span>14:16:04您的包裹已出库</li>
                <li><span>4</span>14:16:03商家正通知快递公司揽件</li>
                <li><span>5</span>21:47:54【惠州市】圆通速递 广东省惠州市惠东县收件员 已揽件</li>
                <li class="bd-pdb-li"><span>6</span>22:13:51广东省惠州市惠东县公司 已发出</li>
                <li class="bd-pdl-li"><span>7</span>2015-08-07　周五　　04:57:33广州转运中心公司 已收入</li>
                <li><span>8</span>04:58:54广州转运中心公司 已发出</li>
                <li><span>9</span>2015-08-08周六22:46:43重庆转运中心公司 已收入</li>
                <li class="bd-pdb-li"><span>10</span>23:01:49【重庆市】重庆转运中心 已发出</li>
                <li class="bd-pdl-li"><span>11</span>2015-08-09　周日　　00:57:11【重庆市】快件已到达 重庆市南岸区</li>
                <li><span>12</span>11:14:52重庆市南岸区 已收入</li>
                <li><span>13</span>11:14:52【重庆市】重庆市南岸区派件员：李天生 13330284757正在为您派件</li>
                <li class="bd-bd-li"><span>14</span>15:53:14【重庆市】重庆市南岸区公司 已签收 签收人：保安，感谢使用圆通速递，期待再次为您服务</li>
            </ul>
            <p class="sign">您的包裹已被签收！</p>
        </div>
    </div>
</div>

</body>
</html>


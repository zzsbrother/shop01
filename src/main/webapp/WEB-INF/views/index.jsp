<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body id="top">
<%--head--%>
<%@ include file="head.jsp"  %>

<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box">
                <c:forEach items="${cateList}" var="c" begin="0" end="5">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=0&pagenow=1">${c.cname}</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=${c.cslist[0].csid}&pagenow=1">${c.cslist[0].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=${c.cslist[1].csid}&pagenow=1">${c.cslist[1].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=${c.cslist[2].csid}&pagenow=1">${c.cslist[2].csname}</a></span>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">

                            <dl class="kj-dl2" style="display:inline-block">
                                <dt><a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=0&pagenow=1">${c.cname}</a></dt>
                                    <dd>
                                        <c:forEach items="${c.cslist}" var="cs" varStatus="i">
                                            <a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=${cs.csid}&pagenow=1">${cs.csname}</a>
                                            <c:if test="${!i.last}">
                                                <span>|</span>
                                            </c:if>
                                        </c:forEach>
                                    </dd>
                            </dl>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <ul class="nav-font f-l">
            <c:forEach items="${cateList}" var="c" begin="0" end="7" varStatus="i">
                <li><a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=0&pagenow=1">${c.cname}</a>
                <c:if test="${i.last}">
                    <span> <img src="${pageContext.request.contextPath}/images/zl2-05.gif" /></span>
                </c:if>
                </li>
            </c:forEach>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>

<!--banner-->
<div class="banner">
    <ul class="ban-ul1">
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        <li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
    </ul>
    <div class="ban-box w1200">
        <ol class="ban-ol1">
            <li class="current"></li>
            <li></li>
            <li></li>
            <li></li>
            <div style="clear:both;"></div>
        </ol>
    </div>
</div>

<!--热门推荐-->
<div class="zl-tuijian w1200">
    <div class="tuijian-left f-l">
        <img src="${pageContext.request.contextPath}/images/zl2-14.png" />
    </div>
    <ul class="tuijian-right f-l">
        <li>
            <div class="li-box li-box1">
                <a href="JavaScript:;" class="li-a1">锦尚世家</a>
                <a href="JavaScript:;" class="li-a2">锦绣花苑　传承世家</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box2">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box3">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box4">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box5">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box6">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box7">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box8">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div style="clear:both;"></div>
</div>

<!--1F  在线商城-->
<!--2F  餐饮娱乐-->
<c:forEach items="${displayList}" var="c" varStatus="i">
    <c:if test="${c.order==1}">
        <div class="zl-info w1200">
            <div class="zl-title1">
                <h3 class="title1-h3 f-l">${c.order}F&nbsp;&nbsp;${c.cname}</h3>
                <ul class="title1-ul1 f-r">
                    <c:forEach items="${c.cslist}" var="cs" varStatus="j">
                        <li <c:if test="${j.count==1}">class="current"</c:if> ><a href="JavaScript:;">${cs.csname}</a></li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                <div style="clear:both;"></div>
            </div>
            <div class="zl-con">
                <div class="zl-con-left f-l">
                    <div class="zl-tu">
                        <c:forEach items="${styleList}" var="s">
                            <c:if test="${c.cid==s.cid}">
                                <img src="${pageContext.request.contextPath}/${s.categoryimage}" class="zl-img" />
                            </c:if>
                        </c:forEach>
                    </div>
                    <p class="zl-lp">
                        黑色星期五</br>
                        优惠力度大
                    </p>
                    <ul class="zl-lhover">
                        <c:forEach items="${cateList}" var="o" varStatus="x">
                            <c:if test="${x.count==i.count}">
                                <c:forEach items="${o.cslist}" var="u">
                                    <li><a href="${pageContext.request.contextPath}/product/search.do?cid=${o.cid}&csid=${u.csid}&pagenow=1">${u.csname}</a></li>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <div class="zl-con-right f-l">
                    <c:forEach items="${c.cslist}" var="cs">
                    <div class="zl-rbox lihover">
                        <div class="rbox-left f-l">
                            <div class="rbox-ltop"><a href="商品详情.html"><img src="${pageContext.request.contextPath}/images/zl2-48.png" /></a></div>
                            <ul class="rbox-lft">
                                <c:forEach items="${cs.proList}" var="p" begin="1" end="3">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}" class="a1">${p.pname}</a>
                                        <p>￥${p.shopprice}/袋</p>
                                        <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}" class="a2"><img src="${pageContext.request.contextPath}/${p.image}" width="135"/></a>
                                    </li>
                                </c:forEach>
                                <div style="clear:both;"></div>
                            </ul>
                        </div>
                        <ul class="rbox-right f-l">
                            <c:forEach items="${cs.proList}" var="p" begin="4" end="7">
                                <li>
                                    <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}" class="a1">${p.pname}</a>
                                    <p>￥${p.shopprice}/袋</p>
                                    <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}" class="a2"><img src="${pageContext.request.contextPath}/${p.image}" width="135"/></a>
                                </li>
                            </c:forEach>
                            <div style="clear:both;"></div>
                        </ul>
                        <div style="clear:both;"></div>
                    </div>
                    </c:forEach>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
    </c:if>

    <c:if test="${c.order!=1}">
        <c:forEach items="${styleList}" var="s">
            <c:if test="${s.cid==c.cid}">
                <div class="zl-info w1200">
                <div class="zl-title1" style="border-color:${s.categorytwocolor};">
                    <h3 class="title1-h3 f-l">${c.order}F&nbsp;&nbsp;${c.cname}</h3>
                    <ul class="title1-ul1 title1-ul2 f-r">
                        <c:forEach items="${c.cslist}" var="cs" varStatus="j">
                            <li <c:if test="${j.count==1}">class="current"</c:if> ><a href="${pageContext.request.contextPath}/product/search.do?cid=${c.cid}&csid=${cs.csid}&pagenow=1">${cs.csname}</a></li>
                        </c:forEach>
                        <div style="clear:both;"></div>
                    </ul>
                    <div style="clear:both;"></div>
                </div>
                <div class="zl-con">
                <div class="zl-con-left f-l" style="background:${s.categorycolor};">
                    <div class="zl-tu">
                        <img src="${pageContext.request.contextPath}/${s.categoryimage}" class="zl-img" />
                    </div>
                    <p class="zl-lp" style="color:${s.categorycolorbg};">
                        周末，嗨起来</br>
                        兄弟，躁起来
                    </p>
                    <ul class="zl-lhover" style=" background:${s.categorytwocolor}">
                        <c:forEach items="${cateList}" var="o" varStatus="x">
                            <c:if test="${x.count==i.count}">
                                <c:forEach items="${o.cslist}" var="u">
                                    <li><a href="${pageContext.request.contextPath}/product/search.do?cid=${o.cid}&csid=${u.csid}&pagenow=1">${u.csname}</a></li>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
            </c:if>
        </c:forEach>
        <div class="zl-con-right f-l">
            <c:forEach items="${c.cslist}" var="cs">
                <ul class="zl-rul1 lihover">
                    <c:forEach items="${cs.proList}" var="p">
                        <li>
                            <div class="sy-tu1">
                                <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}"><img src="${pageContext.request.contextPath}/${p.image}" width="110" /></a>
                            </div>
                            <div class="sy-tit1">
                                <a href="${pageContext.request.contextPath}/product/proDetails.do?pid=${p.pid}">${p.pname}</a>
                            </div>
                            <div class="sy-tit2">
                                <p><a href="商品详情（餐饮）.html">${p.pdesc}</a></p>
                                <p>地址：渝中区石油路174号龙湖时代天A馆L3-20</p>
                                <p>电话：023-63310530</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:forEach>
        </div>
        <div style="clear:both;"></div>
        </div>
        </div>
    </c:if>

</c:forEach>




<!--底部一块-->
<%@ include file="last.jsp"  %>

<!--固定右侧-->
<ul class="youce">
    <li class="li1">
        <a href="index.html" class="li1-tu1"><img src="${pageContext.request.contextPath}/images/zl2-94.png" /></a>
        <a href="index.html" class="li1-zi1">返回首页</a>
    </li>
    <li class="li2">
        <a href="购物车.html"><img src="${pageContext.request.contextPath}/images/zl2-95.png" />购</br>物</br>车</a>
    </li>
    <li class="li3">
        <a href="#" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-96.png" /></a>
        <a href="#" class="li1-zi2">我关注的品牌</a>
    </li>
    <li class="li3">
        <a href="浏览记录.html" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-97.png" /></a>
        <a href="浏览记录.html" class="li1-zi2">我看过的</a>
    </li>
    <li class="li4">
        <a href="JavaScript:;" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-98.gif" /></a>
        <div class="li4-ewm">
            <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-101.gif" /></a>
            <p>扫一扫</p>
        </div>
    </li>
    <li class="li3 li5">
        <a href="#top" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-99.gif" /></a>
        <a href="#top" class="li1-zi2">返回顶部</a>
    </li>
</ul>


</body>
</html>


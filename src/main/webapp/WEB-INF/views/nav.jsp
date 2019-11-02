<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">
                <c:forEach items="${cateList}" var="cl" begin="0" end="5">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/search.do?cid=${cl.cid}&csid=0&pagenow=1">${cl.cname}</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/product/search.do?cid=${cl.cid}&csid=${cl.cslist[0].csid}&pagenow=1">${cl.cslist[0].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/search.do?cid=${cl.cid}&csid=${cl.cslist[1].csid}&pagenow=1">${cl.cslist[1].csname}</a><span>|</span>
                                <a href="${pageContext.request.contextPath}/product/search.do?cid=${cl.cid}&csid=${cl.cslist[2].csid}&pagenow=1">${cl.cslist[2].csname}</a></span>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2" style="display:inline-block">
                                <dt><a href="${pageContext.request.contextPath}/product/search.do?cid=${cl.cid}&csid=0&pagenow=1">${cl.cname}</a></dt>
                                <dd>
                                    <c:forEach items="${cl.cslist}" var="cs" varStatus="i">
                                        <a href="${pageContext.request.contextPath}/product/search.do?cid=${cl.cid}&csid=${cs.csid}&pagenow=1">${cs.csname}</a>
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

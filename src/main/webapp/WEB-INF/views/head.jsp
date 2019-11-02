<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--header-->
<div class="zl-header">
    <div class="zl-hd w1200">
        <p class="hd-p1 f-l">
            您好
            <c:if test="${!empty users}">
                ${users.username}
            </c:if>
            ，欢迎来到宅客微购
            <c:if test="${empty users}">
                ，请登录  <a href="${pageContext.request.contextPath}/user/register.do">【免费注册】</a>
            </c:if>
        </p>
        <p class="hd-p2 f-r">
            <a href="${pageContext.request.contextPath}/user/my.do">返回首页 (个人中心)</a><span>|</span>
            <a href="${pageContext.request.contextPath}/cart/cart.do">我的购物车</a><span>|</span>
            <a href="${pageContext.request.contextPath}/user/myorder.do?pagenow=1">我的订单</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>

<!--logo search weweima-->
<div class="logo-search w1200">
    <div class="logo-box f-l">
        <div class="logo f-l">
            <a href="${pageContext.request.contextPath}/category/index.do" title="中林logo"><img src="${pageContext.request.contextPath}/images/zl2-01.gif" /></a>
        </div>
        <div class="shangjia f-l">
            <a href="JavaScript:;" class="shangjia-a1">[ 切换城市 ]</a>
            <a href="JavaScript:;" class="shangjia-a2">商家入口</a>
            <div class="select-city">
                <div class="sl-city-top">
                    <p class="f-l">切换城市</p>
                    <a class="close-select-city f-r" href="JavaScript:;">
                        <img src="${pageContext.request.contextPath}/images/close-select-city.gif" />
                    </a>
                </div>
                <div class="sl-city-con">
                    <p>西北</p>
                    <dl>
                        <dt>重庆市</dt>
                        <dd>
                            <a href="JavaScript:;">长寿区</a>
                            <a href="JavaScript:;">巴南区</a>
                            <a href="JavaScript:;">南岸区</a>
                            <a href="JavaScript:;">九龙坡区</a>
                            <a href="JavaScript:;">沙坪坝区</a>
                            <a href="JavaScript:;">北碚</a>
                            <a href="JavaScript:;">江北区</a>
                            <a href="JavaScript:;">渝北区</a>
                            <a href="JavaScript:;">大渡口区</a>
                            <a href="JavaScript:;">渝中区</a>
                            <a href="JavaScript:;">万州</a>
                            <a href="JavaScript:;">武隆</a>
                            <a href="JavaScript:;">晏家</a>
                            <a href="JavaScript:;">长寿湖</a>
                            <a href="JavaScript:;">云集</a>
                            <a href="JavaScript:;">华中</a>
                            <a href="JavaScript:;">林封</a>
                            <a href="JavaScript:;">双龙</a>
                            <a href="JavaScript:;">石回</a>
                            <a href="JavaScript:;">龙凤呈祥</a>
                            <a href="JavaScript:;">朝天门</a>
                            <a href="JavaScript:;">中华</a>
                            <a href="JavaScript:;">玉溪</a>
                            <a href="JavaScript:;">云烟</a>
                            <a href="JavaScript:;">红塔山</a>
                            <a href="JavaScript:;">真龙</a>
                            <a href="JavaScript:;">天子</a>
                            <a href="JavaScript:;">娇子</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>新疆</dt>
                        <dd>
                            <a href="JavaScript:;">齐乌鲁木</a>
                            <a href="JavaScript:;">昌吉</a>
                            <a href="JavaScript:;">巴音</a>
                            <a href="JavaScript:;">郭楞</a>
                            <a href="JavaScript:;">伊犁</a>
                            <a href="JavaScript:;">阿克苏</a>
                            <a href="JavaScript:;">喀什</a>
                            <a href="JavaScript:;">哈密</a>
                            <a href="JavaScript:;">克拉玛依</a>
                            <a href="JavaScript:;">博尔塔拉</a>
                            <a href="JavaScript:;">吐鲁番</a>
                            <a href="JavaScript:;">和田</a>
                            <a href="JavaScript:;">石河子</a>
                            <a href="JavaScript:;">克孜勒苏</a>
                            <a href="JavaScript:;">阿拉尔</a>
                            <a href="JavaScript:;">五家渠</a>
                            <a href="JavaScript:;">图木舒克</a>
                            <a href="JavaScript:;">库尔勒</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>甘肃</dt>
                        <dd>
                            <a href="JavaScript:;">兰州</a>
                            <a href="JavaScript:;">天水</a>
                            <a href="JavaScript:;">巴音</a>
                            <a href="JavaScript:;">白银</a>
                            <a href="JavaScript:;">庆阳</a>
                            <a href="JavaScript:;">平凉</a>
                            <a href="JavaScript:;">酒泉</a>
                            <a href="JavaScript:;">张掖</a>
                            <a href="JavaScript:;">武威</a>
                            <a href="JavaScript:;">定西</a>
                            <a href="JavaScript:;">金昌</a>
                            <a href="JavaScript:;">陇南</a>
                            <a href="JavaScript:;">临夏</a>
                            <a href="JavaScript:;">嘉峪关</a>
                            <a href="JavaScript:;">甘南</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>宁夏</dt>
                        <dd>
                            <a href="JavaScript:;">银川</a>
                            <a href="JavaScript:;">吴忠</a>
                            <a href="JavaScript:;">石嘴山</a>
                            <a href="JavaScript:;">中卫</a>
                            <a href="JavaScript:;">固原</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>青海</dt>
                        <dd>
                            <a href="JavaScript:;">西宁</a>
                            <a href="JavaScript:;">海西</a>
                            <a href="JavaScript:;">海北</a>
                            <a href="JavaScript:;">果洛</a>
                            <a href="JavaScript:;">海东</a>
                            <a href="JavaScript:;">黄南</a>
                            <a href="JavaScript:;">玉树</a>
                            <a href="JavaScript:;">海南</a>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="erweima f-r">
        <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-04.gif" /></a>
    </div>
    <div class="search f-r">
        <div class="search-info">
            <form method="get" action="${pageContext.request.contextPath}/product/query.do">
                <input type="text" name="pnames" placeholder="请输入商品名称" value="${page.pnames}"/>
                <input type="hidden" name="cid" value="0">
                <input type="hidden" name="csid" value="0">
                <input type="hidden" name="pagenow" value="1">
                <button type="submit">搜索</button>
            </form>
            <div style="clear:both;"></div>
        </div>
        <ul class="search-ul">
            <li><a href="JavaScript:;">绿豆</a></li>
            <li><a href="JavaScript:;">大米</a></li>
            <li><a href="JavaScript:;">驱蚊</a></li>
            <li><a href="JavaScript:;">洗面奶</a></li>
            <li><a href="JavaScript:;">格力空调</a></li>
            <li><a href="JavaScript:;">洗发</a></li>
            <li><a href="JavaScript:;">护发</a></li>
            <li><a href="JavaScript:;">葡萄</a></li>
            <li><a href="JavaScript:;">脉动</a></li>
            <li><a href="JavaScript:;">海鲜</a></li>
            <li><a href="JavaScript:;">水产</a></li>
            <div style="clear:both;"></div>
        </ul>
    </div>
    <div style="clear:both;"></div>
</div>


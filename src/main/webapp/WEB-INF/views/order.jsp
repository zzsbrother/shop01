<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8" />
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        //这个是地址上的修改按钮，让Session中用户信息加载到修改列表中
        function update() {
            var addr=$("#addr");
            var uname=$("#uname");
            var phone=$("#phone");
            /*alert(addr.text()+uname.text()+phone.text())*/
            var addr1=$("#addr1");
            var uname1=$("#uname1");
            var phone1=$("#phone1");
            addr1.val(addr.val().substring(5))
            uname1.val(uname.val().substring(4));
            phone1.val(phone.val().substring(5));
            /*alert(addr1.text()+uname1.text()+phone1.text())*/
        }
        function data() {
            var addr=$("#addr");
            var uname=$("#uname");
            var phone=$("#phone");
            var addr2=$("#addr2");
            var uname2=$("#uname2");
            var phone2=$("#phone2");

            addr2.val(addr.val().substring(5))
            uname2.val(uname.val().substring(4));
            phone2.val(phone.val().substring(5));
            alert(addr2+uname2+phone2);
        }
    </script>
    <script type="text/javascript">
        function two() {;
            var addr1=$("#addr1");
            var uname1=$("#uname1");
            var phone1=$("#phone1");
            alert(addr1.val()+uname1.val()+phone1.val())
            var addr=$("#addr");
            var uname=$("#uname");
            var phone=$("#phone");
            addr.val("收件地址："+addr1.val());
            uname.val("收件人："+uname1.val())
            phone.val("联系电话："+phone1.val())
        }
    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="head.jsp"%>


<!--内容开始-->
<div class="payment-interface w1200">
    <form method="post" action="${pageContext.request.contextPath}/pay/gopay.do">
        <input type="hidden" name="addr2" id="addr2">
        <input type="hidden" name="uname2" id="uname2">
        <input type="hidden" name="phone2" id="phone2">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择收货地址</h3>
        </div>
        <ul class="pay-dz">
            <li>
                <h3><input style="border: 0px;outline:none;cursor: pointer;width: 200px;height: 25px" disabled="disabled" id="addr" name="addr" value="收件地址：${users.addr}"></h3>
                <p><input style="border: 0px;outline:none;cursor: pointer;width: 200px;height: 25px" disabled="disabled" id="uname" name="uname" value="收件人：${users.name}"></p>
                <input style="border: 0px;outline:none;cursor: pointer;width: 200px;height: 25px" disabled="disabled" id="phone" name="phone" value="联系电话：${users.phone}">
                <a href="JavaScript:;" xiugai="" onclick="update()">修改</a>
            </li>
            <div style="clear:both;"></div>
        </ul>
        <P class="pay-xgdz">修改地址和使用新地址样式一样。</P>
        <button type="button" class="pay-xdz-btn">使用新地址</button>
    </div>
    <div class="pay-info">
        <div class="info-tit" style="border-bottom:0;">
            <h3>订单信息</h3>
        </div>
    </div>
    <div class="cart-con-info">
        <div class="cart-con-tit" style="margin:20px 0 5px;">
            <p class="p1" style="width:320px;">
                <input type="checkbox" value="" name="hobby"></input>
                <span>商家：向东服饰专卖店</span>
            </p>
            <p class="p3" style="width:130px;">规格</p>
            <p class="p4" style="width:110px;">数量</p>
            <p class="p8" style="width:100px;">运费</p>
            <p class="p5" style="width:150px;">单价（元）</p>
            <p class="p6" style="width:150px;">金额（元）</p>
            <p class="p7" style="width:200px;">配送方式</p>
        </div>
        <c:forEach items="${ordersExt.itemExts}" var="o">
            <div class="info-mid">
                <div class="mid-tu f-l">
                    <a href="#"><img src="${pageContext.request.contextPath}/${o.product.image}"  width="70"/></a>
                </div>
                <div class="mid-font f-l" style="margin-right:40px;">
                    <a href="#">${o.product.pname}<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                </div>
                <div class="mid-guige1 f-l" style="margin-right:40px;">
                    <p>颜色：蓝色</p>
                    <p>尺码：XL</p>
                </div>
                <div class="mid-sl f-l" style="margin:10px 54px 0px 0px;">
                    <a  >-</a>
                    <input type="text" value="${o.count}" disabled="disabled"/>
                    <a  >+</a>
                </div>
                <p class="mid-yunfei f-l">¥ 0.00</p>
                <p class="mid-dj f-l">¥ ${o.product.shopprice}</p>
                <p class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ ${o.subtotal}</p>
                <div class="mid-chaozuo f-l">
                    <select>
                        <option>送货上门</option>
                        <option>快递包邮</option>
                    </select>
                </div>
                <div style="clear:both;"></div>
            </div>
        </c:forEach>
        <div class="info-heji">
            <p class="f-r">店铺合计(含运费)：<span>¥${ordersExt.total}</span></p>
            <h3 class="f-r">订单号：${ordersExt.ordernumber}</h3>
        </div>
        <div class="info-tijiao">
            <p class="p1">实付款：<span>¥${ordersExt.total}</span></p>
            <button type="submit" class="btn" onclick="data()">提交订单</button>
        </div>
    </div>
    </form>
</div>

<!--底部一块-->
<%@include file="last.jsp"%>

<!--确认订单（新增地址）-->
<div class="confirmation-tanchuang" xgdz1="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif"/></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>

<!--修改地址-->
<div class="confirmation-tanchuang" xgdz2="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>修改地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <input type="text" id="addr1" style="width:500px;">
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input id="uname1" type="text"  />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input id="phone1" type="text"  />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button type="submit" class="btn-pst2" onclick="two()">保存</button>
    </div>
</div>
</body>
</html>


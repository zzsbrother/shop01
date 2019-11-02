<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
</head>

<body>

<div class="sign-logo w1200">
    <h1 class="zl-h11"><a href="index.html" title="宅客微购"><img src="${pageContext.request.contextPath}/images/zl2-01.gif" /></a></h1>
</div>

<form method="post" action="${pageContext.request.contextPath}/user/gologin.do">
    <div class="sign-con w1200">
        <img src="${pageContext.request.contextPath}/images/logn-tu.gif" class="sign-contu f-l" />
        <div class="sign-ipt f-l">
            <p>用户名</p>
            <input id="username" name="username" value="${cookie.username.value}" type="text" placeholder="用户名" />
            <span id="mrg1" class="${!empty model?"cuo":""}">${model}</span>
            <p>密码</p>
            <input id="password" name="password" value="${cookie.password.value}" type="password" placeholder="密码" /><br />
            <p>保存密码&nbsp;&nbsp;<input id="remenber" name="remenber" checked="checked" value="1" style="height: 17px;width: 17px" type="checkbox"/></p>
            <button class="slig-btn" type="submit">登录</button>
            <p>无账号？<a href="${pageContext.request.contextPath}/user/register.do">注册</a><a href="#" class="wj">忘记密码？</a></p>
            <div class="sign-qx">
                <a href="#" class="f-r"><img src="${pageContext.request.contextPath}/images/sign-xinlan.gif" /></a>
                <a href="#" class="qq f-r"><img src="${pageContext.request.contextPath}/images/sign-qq.gif" /></a>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
</form>


<!--底部一块-->
<%@ include file="last.jsp"  %>
</body>
</html>


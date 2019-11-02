<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>个人资料</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function () {
            /*密码*/
            var password=$("#password");
            var password1=$("#password1");
            var mrg2=$("#mrg2");
            password1.blur(function(){
                if(password.val()!= password1.val()){
                    mrg2.val("两次密码输入不一致");
                }else{
                    mrg2.val("");
                }
            })
            /*手机号*/
            var tel=$("#phone");
            var mrg3=$("#mrg3");
            tel.blur(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkTel.do",
                    type:"post",
                    data:{
                        "tel":tel.val()
                    },
                    dataTpey:"text",
                    success:function(result){
                        /*alert(result);*/
                        if(result==1){
                            mrg3.val("");
                        }else{
                            mrg3.val("电话号码不正确")
                        }
                    }
                })
            })
            /*邮箱*/
            var email =$("#email");
            var mrg4=$("#mrg4");
            email.blur(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkEmail.do",
                    type:"post",
                    data:{
                        "email":email.val()
                    },
                    dataTpey:"text",
                    success:function(result){
                        /*alert(result);*/
                        if(result==1){
                            mrg4.val("");
                        }else{
                            mrg4.val("邮箱不正确")
                        }
                    }
                })
            })
        })
        /*修改信息*/
        function go(){
            var mrg2=$("#mrg2");
            var mrg3=$("#mrg3");
            var mrg4=$("#mrg4");
            /*alert(mrg3.val());*/
            if(mrg2.val()!=""|| mrg3.val()!=""|| mrg4.val()!=""){
                alert("有信息错误，请修改正确！")
                return false;
            }
            var username=$("#username");
            var password=$("#password");
            var name=$("#name");
            var phone=$("#phone");
            var email=$("#email");
            var addr=$("#addr");
            $.ajax({
                url:"${pageContext.request.contextPath}/user/changeMy.do",
                type:"post",
                data:{
                    "username":username.val(),
                    "password":password.val(),
                    "name":name.val(),
                    "phone":phone.val(),
                    "email":email.val(),
                    "addr":addr.val()
                },
                dataTpey:"text",
                success:function(result){
                   /* alert(result);*/
                    window.location.href = "${pageContext.request.contextPath}/user/my.do"
                }
            })
        }
    </script>
</head>

<body style="position:relative;">

<%--head--%>
<%@ include file="head.jsp"  %>
<!--nav-->
<%@ include file="nav.jsp"%>

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
        <div class="personal-r f-r">
            <div class="personal-right">
                <div class="personal-r-tit">
                    <h3>个人资料</h3>
                </div>
                <div class="data-con">
                    <div class="dt1">
                        <p class="f-l">当前头像：</p>
                        <div class="touxiang f-l">
                            <div class="tu f-l">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/data-tu.gif" />
                                    <input type="file" name="" id="" class="img1" />
                                </a>
                            </div>
                            <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                            <div style="clear:both;"></div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">用户名：</p>
                        <input id="username" name="username" type="text" value="${sessionScope.users.username}" disabled="true "/>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">密码：</p>
                        <input id="password" name="password" type="password" value="${sessionScope.users.password}" />
                        <span id="mrg1" class=""></span>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">确认密码：</p>
                        <input id="password1" name="password1" type="password" value="${sessionScope.users.password}" />
                        &nbsp;&nbsp;&nbsp;<a><input type="text" style="border: 0px;outline:none;cursor: pointer;color: #F00;" id="mrg2"/></a>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">真实姓名：</p>
                        <input id="name" name="name" type="text" value="${sessionScope.users.name}" />
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">手机号：</p>
                        <input id="phone" name="phone" type="text" value="${sessionScope.users.phone}" />
                        &nbsp;&nbsp;&nbsp;<a><input type="text" style="border: 0px;outline:none;cursor: pointer;color: #F00;" id="mrg3"/></a>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">邮箱：</p>
                        <input id="email" name="email" type="text" value="${sessionScope.users.email}" />
                        &nbsp;&nbsp;&nbsp;<a><input type="text" style="border: 0px;outline:none;cursor: pointer;color: #F00;" id="mrg4"/></a>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="dt1">
                        <p class="dt-p f-l">地址：</p>
                        <input id="addr" name="addr" type="text" value="${sessionScope.users.addr}" />
                        <span id="mrg5"></span>
                        <div style="clear:both;"></div>
                    </div>
                    <input type="submit" class="btn-pst" name="submit" value="保存" onclick="go()"></input>

                </div>

            </div>
        </div>
        <div style="clear:both;"></div>
    </div>




<!--上传头像弹窗
<div class="tanchuang">
    <div class="t-c-bg"></div>
    <div class="t-c-con">
        <div class="tc-tit">
            <h3>上传头像</h3>
            <a href="JavaScript:;" delete=""><img src="${pageContext.request.contextPath}/images/t-c-del.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <div class="tc-con">
            <a href="#"><img src="${pageContext.request.contextPath}/images/tc-tu.gif" /></a>
            <button>保存头像</button>
        </div>
    </div>
</div>-->

<!--底部一块-->
<%@ include file="last.jsp"  %>
</body>
</html>


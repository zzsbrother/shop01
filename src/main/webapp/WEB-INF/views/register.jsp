<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function(){
            var username =$("#username");
            var ajaxmrg = $("#mrg1");
            /*用户名ajax验证*/
            username.blur(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/check.do",
                    type:"post",
                    data:{
                        "username":username.val()
                    },
                    dataTpey:"text",
                    success:function(result){
                        /*alert(result);*/
                        if(result==1){
                            ajaxmrg.attr("class","dui")
                            ajaxmrg.text("可以使用")
                        }else{
                            ajaxmrg.attr("class","cuo")
                            ajaxmrg.text("用户名重复，不可用")
                        }
                    }
                });
            });

            /*密码*/
            var password=$("#password");
            var password1=$("#password1");
            var mrg3=$("#mrg3");
            password1.blur(function(){
                if(password.val()!= password1.val()){
                    mrg3.attr("class","cuo");
                    mrg3.text("两次密码输入不一致");
                }else{
                    mrg3.attr("class","dui");
                    mrg3.text("密码正确");
                }
            })

            /*手机号*/
            var tel=$("#tel");
            var mrg5=$("#mrg5");
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
                            mrg5.attr("class","dui")
                            mrg5.text("")
                        }else{
                            mrg5.attr("class","cuo")
                            mrg5.text("电话格式不正确")
                        }
                    }
                })
            })

            /*邮箱*/
            var email =$("#email");
            var mrg6=$("#mrg6");
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
                            mrg6.attr("class","dui")
                            mrg6.text("")
                        }else{
                            mrg6.attr("class","cuo")
                            mrg6.text("邮箱格式不正确")
                        }
                    }
                })
            })

            /*验证码*/
            var yzm=$("#yzm");
            yzm.click(function(){
                yzm.attr("src","${pageContext.request.contextPath}/yzm.do?time="+new Date());

            })
            var mrg8 =$("#mrg8");
            var yzmid=$("#yzmID");
            yzmid.blur(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/getyzm.do",
                    type:"post",
                    data:{
                        "yzmID":yzmid.val()
                    },
                    dataTpey:"text",
                    success:function(result) {
                       /* alert(result);*/
                        if (result == 1) {
                            mrg8.attr("class", "dui")
                            mrg8.text("")
                        } else {
                            mrg8.attr("class", "cuo")
                            mrg8.text("验证码错误")
                            return false;
                        }
                    }
                })
            })



        })
        /*验证是否允许form跳转的条件*/
        function check(){
            var check = $("#checkid");
            yzmid=$("#yzmID");
            if(check.prop("checked")){
                var ajaxmrg = $("#mrg1");
                var mrg2=$("#mrg2");
                var mrg3=$("#mrg3");
                var mrg4=$("#mrg4");
                var mrg5=$("#mrg5");
                var mrg6=$("#mrg6");
                var mrg7=$("#mrg7");
                var mrg8=$("#mrg8");
                if(ajaxmrg.attr("class")=="cuo" || mrg2.attr("class")=="cuo"|| mrg3.attr("class")=="cuo"|| mrg4.attr("class")=="cuo"|| mrg5.attr("class")=="cuo"|| mrg6.attr("class")=="cuo"|| mrg8.attr("class")=="cuo"){
                    return false;
                }
                return true;
            }else{
                alert("请阅读《宅客微购网站服务协议》之后，勾取同意")
                return false;
            }
        }
        function changeYZM(){
            var yzm=$("#yzm");
            yzm.attr("src","${pageContext.request.contextPath}/yzm.do?time="+new Date());
        }
    </script>
</head>

<body>

<%--head--%>
<%@ include file="head.jsp"  %>

<!--内容开始-->
<form method="post" action="${pageContext.request.contextPath}/user/doRegister.do" onsubmit="return check()">
<div class="password-con registered">
    <div class="psw">
        <p class="psw-p1">用户名</p>
        <input type="text" placeholder="请输入用户名" id="username" name="username"/>
        <span id="mrg1" class="${!empty username?"cuo":""}">${username}</span>
    </div>
    <div class="psw">
        <p class="psw-p1">输入密码</p>
        <input id="password" name="password" type="password" placeholder="请输入密码" />
        <span id="mrg2" class="${!empty password?"cuo":""}">${password}</span>
    </div>
    <div class="psw">
        <p class="psw-p1">确认密码</p>
        <input id="password1" type="password" placeholder="请再次确认密码" />
        <span id="mrg3" class=""></span>
    </div>
    <div class="psw">
        <p class="psw-p1">真实姓名</p>
        <input type="text" name="name" placeholder="请输入真实姓名" id="names" />
        <span id="mrg4" class="${!empty name?"cuo":""}">${name}</span>
    </div>
    <div class="psw psw1">
        <p class="psw-p1">手机号</p>
        <input id="tel" type="tel" name="phone"pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}" placeholder="请输入手机号" />
        <span id="mrg5" class="${!empty phone?"cuo":""}">${phone}</span>
    </div>
    <div class="psw psw1">
        <p class="psw-p1">邮箱</p>
        <input id="email" type="email" name="email" placeholder="请输入邮箱号" />
        <span id="mrg6" class="${!empty email?"cuo":""}">${email}</span>
    </div>
    <div class="psw psw1">
        <p class="psw-p1">地址</p>
        <input id="place"type="text" placeholder="请输入地址" name="addr" />
        <span id="mrg7" class=""></span>
    </div>
    <div class="psw psw3">
        <p class="psw-p1">验证码</p>
        <input type="text" id="yzmID" name="yzmID" placeholder="请输入验证码" />
        <span id="mrg8" class=""></span>
    </div>
    <div class="yanzhentu">
        <div class="yz-tu f-l">
            <img id="yzm" src="${pageContext.request.contextPath}/yzm.do" />
        </div>
        <p class="f-l">看不清？<a href="javascript:" onclick="changeYZM()">换张图</a></p>
        <div style="clear:both;"></div>
    </div>
    <div class="agreement">
        <input type="checkbox" name="hobby" id="checkid"></input>
        <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
    </div>
    <button class="psw-btn">立即注册</button>
    <p class="sign-in">已有账号？请<a href="#">登录</a></p>
</div>
</form>

<!--底部一块-->
<%@ include file="last.jsp"  %>

</body>
</html>

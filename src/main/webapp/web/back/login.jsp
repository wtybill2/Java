<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<%@ include file="/web/header.jsp"%>
<%@ include file="/web/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/back/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/back/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/back/css/component.css" />
<!--[if IE]>
<script src="${ctx}/static/back/js/html5.js"></script>
<![endif]-->
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>欢迎登陆</h3>
					<form action="#" name="f" method="post" id="login_from">
						<div class="input_outer">
							<span class="u_user"></span> <input id="username" name="code"
								class="text" style="color: #FFFFFF !important" type="text"
								placeholder="请输入账户">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span> <input id="password" name="pass"
								class="text"
								style="color: #FFFFFF !important; position: absolute; z-index: 100;"
								value="" type="password" placeholder="请输入密码">
						</div>
						<!-- 验证码 -->
						<div class="input_outer" >
						<span class="us_uer"></span>
							<input type="text" name="AuthCode" class="text"
								style="color: #FFFFFF !important; position: absolute; z-index: 100;"
								placeholder="请输入验证码" autocomplete="off" class="layui-input">
							
						</div>
							 <img style="    left: 270px;    top: 235px;    position: absolute;"
								src="${pageContext.request.contextPath}/AuthCode"
								onclick="this.src='${pageContext.request.contextPath}/AuthCode?'+Math.random();">
						

					</form>
					<div class="mb2">
						<a class="act-but submit" href="javascript:;"
							onclick="submitFrom()" style="color: #FFFFFF">登录</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="${ctx}/static/back/js/TweenLite.min.js"></script>
	<script src="${ctx}/static/back/js/EasePack.min.js"></script>
	<script src="${ctx}/static/back/js/rAF.js"></script>
	<script src="${ctx}/static/back/js/demo-1.js"></script>
	<script type="text/javascript">
		function submitFrom() {
			$.ajax({
				type : "post",
				url : con.app + "/user/login.action",
				data : $("#login_from").serialize(),
				dataType : "text",
				success : function(data) {
					if (data == 0) {
						location.href = con.app + "/user/loginsuc.action";
					} else if(data == 2){
						layer.msg("验证码不正确");
					}else if(data == 3){
						layer.msg("您不是管理员")
					}else {
						layer.msg("登录失败");
					}
				}
			})
		}
	</script>

	

</body>
</html>
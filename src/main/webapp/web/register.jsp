<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"> -->
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-注册</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/main.css">
	<script type="text/javascript" src="${ctx}/static/front/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/front/js/register.js"></script>
</head>
<body>
	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="${ctx}/static/front/img/logo02.png"></a>
			<div class="reg_slogan">足不出户  ·  新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="#">登录</a>
			</div>
			<div class="reg_form clearfix">
				<form id="login_from">
				<input type="hidden" id="role" name="role" value="putong"/>
				<ul>
					<li>
						<label>姓名:</label>
						<input type="text" name="username" id="username"/>
						<span class="error_tip">提示信息</span>
					</li>					
					<li>
						<label>密码:</label>
						<input type="password" name="password" id="password"/>
						<span class="error_tip">提示信息</span>
					</li>
					<li>
						<label>确认密码:</label>
						<input type="password" name="cpassword" id="cpassword"/>
						<span class="error_tip">提示信息</span>
					</li>
					<li>
						<label>用户名:</label>
						<input type="text" name="usercode" id="usercode"/>
						<span >提示信息</span>
					</li>
					
					<li class="agreement">
						<input type="checkbox" name="allow" id="allow" checked="checked"/>
						<label>同意”天天生鲜用户使用协议“</label>
						<span class="error_tip2">提示信息</span>
					</li>
				</ul>				
				</form>
				<li class="reg_sub">
					<input type="submit" value="注 册" name="register" onclick="register()"/>
				</li>
			</div>

		</div>

	</div>

	<div class="footer no-mp">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	
	<script src="${ctx}/static/front/js/jquery.min.js"></script> 
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script type="text/javascript">
	layui.use(['layer'], function(){
		  var layer = layui.layer;
		});
	
		function register(){
			$.ajax({
				url : "${ctx}/user/reg1.action",
				type : "post",
				dataType : "json",
				data : $("#login_from").serialize(),
				success : function(data){
					if(data==1){
						layer.msg("注册成功")
						layer.openfirm("是否跳转主界面","${ctx}/frontindex/index.action")
					}else{
						layer.msg("注册失败")
					}
					
				}
			});
		}
	</script>
	
</body>
</html>
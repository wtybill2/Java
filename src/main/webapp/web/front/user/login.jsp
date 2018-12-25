<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/main.css" />
</head>
<body style="height:382px">
			    <div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="${ctx}/web/front/user/register.jsp">立即注册</a>
				</div>
				<div class="form_input">
					<form id="login_from">
						<input type="text" id="username" name="username" class="name_input" placeholder="请输入用户名"/>
						<input type="password" id="password" name="password" class="pass_input" placeholder="请输入密码"/>
						<div class="more_input clearfix">
							<input type="checkbox" name="" />
							<label>记住用户名</label>
							<a href="#">忘记密码</a>
						</div>
					</form>
						<input type="submit" onclick="submitFrom()" name="" value="登录" class="input_submit" />
				</div>
			
	<script src="${ctx}/static/front/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		//一般直接写在一个js文件中
		layui.use(['layer'], function(){
		  var layer = layui.layer;
		});
		
		function submitFrom(){
			var username = $("#username").val();
			var password = $("#password").val();
			
			//用户名不为空
			if(util.isNull(username)){
				mylayer.errorMsg("用户名不能为空");
				return;
			}
			//用户名格式
			var pattrn = /^[0-9a-zA-Z]{4,8}$/;
			if(!pattrn.test(username)){
				mylayer.errorMsg("用户名格式不正确，请输入4-8位数字或字母");
				return;
			}
			//密码不为空
			if(util.isNull(password)){
				mylayer.errorMsg("密码不能为空");
				return;
			}
			
			$.ajax({
				url : "${ctx}/frontindex/loginfront.action",
				type : "post",
				dataType : "json",
				data : $("#login_from").serialize(),
				traditional: true,
				success : function(resp){
					//console.log(resp);
					if(resp==1){//resp的状态==0
						layer.msg("登录成功");
						var index = parent.layer.getFrameIndex(window.name);
					    setTimeout(function(){
						parent.layer.close(index);
						window.parent.location.reload();
						parent.layer.closeAll('iframe');
					},1000); 
					}else{
						layer.msg("登录失败");
					}
				}
			});
		}
	</script>

</body>
</html>
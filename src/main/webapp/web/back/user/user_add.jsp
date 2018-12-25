<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/header.jsp"%>
<style type="text/css">
.main_div {
	margin: 15px;
}
</style>
</head>
<body>
	<div class="main_div">
		<form id="from_add" class="layui-form layui-form-pane" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="name" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="pass" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-inline">
					<select name="role" lay-verify="">
						<option value="">请选择角色</option>
						<option value="guanli">管理员</option>
						<option value="putong">普通用户</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit lay-filter="reg"
						value="添加"> <input type="button" class="layui-btn "
						value="取消" onclick="closeThis()">
				</div>

			</div>
		</form>
	</div>

	<script type="text/javascript">
		form.render();
		formSubmit('/user/reg.action', 'submit(reg)', 'text', function(data) {
			if (data == 0) {
				layer.msg("添加成功");
				closeThis(2000);
			} else if (data == 1) {
				layer.msg("账号已存在");
			} else {
				layer.msg("添加失败");
			}
		})

		
	</script>

</body>
</html>
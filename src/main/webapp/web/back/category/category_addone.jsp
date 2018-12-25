<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
<style type="text/css">
.main_div {
	margin: 15px;
}
</style>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 20px">
		<legend>商品信息添加</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<div class="layui-form-item">
					<label class="layui-form-label">上级编号</label>
					<div class="layui-input-inline">
						<select name="parentcode" lay-search></select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input type="text" name="code" required lay-verify="required"
							placeholder="请输入编号" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">名称</label>
					<div class="layui-input-inline">
						<input type="text" name="name" required lay-verify="required"
							placeholder="请输入名称" autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-inline">
						<input type="text" name="note" required lay-verify="required"
							placeholder="请输入描述" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit lay-filter="add22"
						value="添加"> <input type="button" class="layui-btn "
						value="取消" onclick="closeThis()">
				</div>

			</div>
			</div>
		</form>
	</fieldset>
<script type="text/javascript">
		ajax('/cate/getList.action', {}	
		, 'json', function(data) {
			var html = "<option value=''>无上级</option>";
			$.each(data, function(i, dom) {
				html += "<option value='"+dom.code+"'>" + dom.name
						+ "</option>"
			});

			$("select[name='parentcode']").html(html);
			form.render('select');
		});

		formSubmit('/cate/add.action', 'submit(add22)', 'text', function(data) {
			
			if (data == 1) {
				layer.msg("添加成功");
				closeThis(2000);
				refresh();
			} else if (data == 0) {
				layer.msg("编码已存在");
			} else {
				layer.msg("添加失败");
			}
		});

		
	</script>
	<script id="option" type="text/html">
	<option value='{{d.code}}'>{{d.name}}</option>
</script>
	
	

</body>
</html>
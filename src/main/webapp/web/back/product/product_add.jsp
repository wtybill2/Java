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
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
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
				<label class="layui-form-label">编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" placeholder="请输入编号"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">商品单价</label>
				<div class="layui-input-inline">
					<input type="text" name="cost" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-inline">
					<input type="text" name="sum" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="state" lay-search>
						<option value="上架" selected>上架</option>
						<option value="下架">下架</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">一级分类</label>
				<div class="layui-input-inline">
					<select name="parentcode" lay-filter="parentcode" lay-search></select>
				</div>
				<label class="layui-form-label">二级分类</label>
				<div class="layui-input-inline">
					<select name="parentcode2" lay-filter="parentcode2" lay-search></select>
				</div>
			</div>

		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="button" class="layui-btn" lay-submit lay-filter="add"
					value="添加"> <input type="button" class="layui-btn "
					value="取消" onclick="closeThis()">
			</div>
		</div>
		</form>
	</div>

	<script type="text/javascript">
		getAddr('parentcode', 'type1');
		function getAddr(parentcode, up) {
			ajax('/cate/getListup.action', {
				up : up
			}, 'json', function(data) {
				var html = "<option value=''>请选择</option>";
				$.each(data, function(i, dom) {
					html += "<option value='"+dom.code+"'>" + dom.name
							+ "</option>";
				});
				$("select[name='" + parentcode + "']").html(html);
				form.render('select'); //刷新select选择框渲染
			})
		}
		form.on('select(parentcode)', function(data) {

			$("select[name='parentcode2']").empty();
			form.render('select');
			getAddr('parentcode2', data.value);
		})
		form.on('select(parentcode2)', function(data) {
			form.render('select');
		});
		form.on('select(state)', function(data) {
			form.render('select');
		});
		formSubmit('/pro/add.action', 'submit(add)', 'text', function(data) {
			if (data == 0) {
				layer.msg('添加成功');
				closeThis(3000);
			} else if (data == 1) {
				layer.msg('已存在');
			} else {
				layer.msg('添加失败');
			}
		});
		
	</script>
</body>
</html>
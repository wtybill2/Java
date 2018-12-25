<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/web/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.main_div {
	margin: 15px;
}
</style>
</head>
<body>
	<div class="main_div">
		<form id="from_update" class="layui-form layui-form-pane" action="">
			<input type="hidden" name="id" value="${user.id}">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text"  name="name"
						lay-verify="required" placeholder="请输入" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" readonly
						lay-verify="required" placeholder="请输入" autocomplete="off"
						class="layui-input">
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
					<input type="button" class="layui-btn" lay-submit
						lay-filter="upduser" value="修改"> <input type="button"
						class="layui-btn " onclick="closeThis()" value="取消">
				</div>
			</div>
		</form>

	</div>


	
	<script type="text/javascript">
	ajax('/user/getListAll.action',{},'json',function(data){
		var html="<option value=''>无上级</option>";
		$.each(data,function(i,dom){
			html+="<option value='"+dom.code+"'>"+dom.name+"</option>"
			/* var data = {
					
					name : dom.name,
					code : dom.code,
					
				}
			var temp = $("#option").html();
			html += laytpl(temp).render(data); */
		});
		
		$("select[name='parentcode']").html(html);
		form.render('select');
		init();
	});//searchUser
		function init() {
			var code = '<%=request.getParameter("code")%>';
			$.ajax({
				url : con.app + '/user/getUser.action',
				data : {

					code : code
				},
				dataType : 'json',
				type : 'post',
				success : function(data) {
					
					$("input[name='code']").val(data.code), $(
							"input[name='name']").val(data.name), $(
							"option[value='" + data.role + "']").prop(
							'selected', 'selected');
					//$("select[name='parentcode']>option[value='"+data.role+"']").prop('selected','selected');
					form.render('select');
				}
			});

			formSubmit('/user/upduser.action', 'submit(upduser)', 'text',
					function(data) {
						if (data == 1) {
							layer.msg("修改成功");
							closeThis(3000);

						} else {
							layer.msg("修改失败");
						}
					})
		}
	
	</script>

</body>
</html>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
<style type="text/css">
.main_div{
	margin : 15px;
}
</style>
</head>
<body>
	<div class="main_div">
		<form id="from_add" class="layui-form layui-form-pane" action="">
		  <div class="layui-form-item">
		    <label class="layui-form-label">用户ID</label>
		    <div class="layui-input-inline">
		      <input type="text" name="userId" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">收获姓名</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverName lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">固定电话</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverPhone lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">移动电话</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverMobile lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">省份</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverProvince lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">城市</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverCity lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">区/县</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverDistrict lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">详细地址</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverAddress lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">邮编</label>
		    <div class="layui-input-inline">
		      <input type="text" name=receiverZip lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		</form>
		   <button class="layui-btn"  onclick="submitForm()">添加</button> 
	</div>
	
	
	<script src="${ctx}/static/back/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script src="${ctx}/static/lib/kindeditor/kindeditor.js"></script>
	<script src="${ctx}/static/lib/kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript">
	 	layui.use('layer', function(){
		 var layer = layui.layer;
	 	});
		//ajax提交表单
			function submitForm(){
				$.ajax({
					url : "${ctx}/shipping/insert.action",
					data : $('#from_add').serialize(),
					type : "post",
					dataType : "json",	
					success : function(resp){
						if(resp.code == util.SUCCESS){
							mylayer.success(resp.msg);
							//加载刷新父类页面并关闭弹窗
							//window.parent.location.reload();
							//
							var index = parent.layer.getFrameIndex(window.name);
							    setTimeout(function(){
								parent.layer.close(index);
								window.parent.location.reload();
								parent.layer.closeAll('iframe');
							},1000); 
						} else {
							mylayer.errorMsg(resp.msg);
						}
					}
					
				});
			}
		 
		

	</script>
	
</body>
</html>
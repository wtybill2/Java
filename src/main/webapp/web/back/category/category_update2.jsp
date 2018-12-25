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
		<input type="hidden" name="id" value="${category.id}">
		 <div class="layui-form-item">
		    <label class="layui-form-label">一级分类</label>
		    <div class="layui-input-inline">
		    <!-- 隐藏的类别id，二级分类的类别parentId为一级分类的id,这里的目的就是拿到parentId，
		  	  一级分类里面已经有了，只需在这拿出来就行，其实就是把value写在下面了-->
		      <select id="topCategory"  lay-filter="topCategoryFilter" type="hidden" name="parentId">
		      </select>
		    </div>
		  </div>
		   
		  <div class="layui-form-item">
		    <label class="layui-form-label">二级分类</label>
		    <div class="layui-input-inline">
		      <input type="text" value="${category.name}" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		   <div class="layui-form-item">
	  	  	  <label class="layui-form-label">类别状态</label>
			  <div class="layui-input-inline">
				  <select name="status"  lay-verify="">
					  <option value="">请选择状态</option>
					  <option value="1">上架</option>
					  <option value="0">下架</option>
				  </select>  
			  </div>   
		 </div>
		 <div class="layui-form-item">
		    <label class="layui-form-label">排序编号</label>
		    <div class="layui-input-inline">
		      <input type="text" value="${category.sortOrder}" name="sortOrder" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		</form>
		  <button class="layui-btn" onclick="submitForm()">修改</button>
	</div>
	
	
	<script src="${ctx}/static/back/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script src="${ctx}/static/lib/kindeditor/kindeditor.js"></script>
	<script src="${ctx}/static/lib/kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript">
		//ajax请求的数据返回时，页面已经加载了，此时就无法展示ajax加载的内容，要局部刷新表单.layui模块化
		 layui.use(['layer','form'], function(){
			var layer = layui.layer; 
	        var form = layui.form; 
	        form.render('select'); //刷新select选择框渲染
	   }); 
	
		//ajax提交表单
		function submitForm(){
			$.ajax({
				url : "${ctx}/category/update2.action",
				data : $('#from_add').serialize(),
				//data : parentId,
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
		
		
		
		 
					
		//不在监听器内，加载页面即加载这里
		$(function(){
			$.ajax({
			//加载一级分类，
			url : "${ctx}/category/selectTopCategory.action",
			type : "post",
			dataType : "json",
			success : function(resp){
				console.log(resp);
				if(resp.code == util.SUCCESS){
					var html = "<option value=''>请选择一级分类</option>";
					var data = resp.data;
					for(var i = 0; i< data.length;i++){
						html += "<option value='"+ data[i].id +"'>"+ data[i].name +"</option>"
					}
					$("#topCategory").html(html);
				} else {
					mylayer.errorMsg(resp.msg);
				}
			}
			});
		});
	</script>
	
</body>
</html>
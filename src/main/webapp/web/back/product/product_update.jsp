<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/header.jsp"%>
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
					<select name="state"  lay-search>
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
				<input type="button" class="layui-btn" lay-submit lay-filter="upd"
					value="修改"> <input type="button" class="layui-btn "
					value="取消" onclick="closeThis()">
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
	getAddr('parentcode','type1',init);
	function getAddr(addr,up,func){
		ajax('/cate/getListup.action', {up:up}, 'json', function(data){
	        var html = "<option value=''>请选择</option>" ;
	        $.each(data,function(i, dom) {
	            html += "<option value='"+dom.code+"'>"+dom.name+"</option>" ;
	        });
	        $("select[name='"+addr+"']").html(html);
	        form.render('select'); //刷新select选择框渲染
	        func();
	    })
	}
	
	function init(){
	    var code = '<%=request.getParameter("code")%>';
	    
	    ajax('/pro/getModel.action', {code:code}, 'json', function(data){
	    	console.log(data)
	        $("input[name='code']").val(data.code);
	        $("input[name='name']").val(data.name);
	        $("input[name='cost']").val(data.cost);
	        $("input[name='sum']").val(data.sum);
	    	$("select[name='state']>option[value='"+data.state+"']").prop('selected','selected');
	        $("select[name='parentcode']>option[value='"+data.product_type1+"']").prop('selected','selected');
	        
	        getAddr('parentcode2',data.product_type1,function(){
	        	
	            $("select[name='parentcode2']>option[value='"+data.product_type+"']").prop('selected','selected');
	            form.render('select');
	        });
	    })
	}
	form.on('select(parentcode)', function(data){
	    $("select[name='parentcode2']").empty();
	    
	    form.render('select');
		getAddr('parentcode2',data.value,function(){});
	}); 
	form.on('select(parentcode2)', function(data){
	    form.render('select');
	}); 
	form.on('select(state)', function(data){
		
		form.render('select');
		});
	var a=$('select[name="state"]').val();
	console.log(a)
	formSubmit('/pro/upd.action', 'submit(upd)', 'text', function(data) {
	    if (data == 1) {
	        layer.msg('修改成功');
	        closeThis(2000);
	     } else {
	        layer.msg('修改失败');
	    }
	});
	</script>
	
</body>
</html>
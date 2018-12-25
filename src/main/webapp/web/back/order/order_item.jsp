<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/web/header.jsp"%>
</head>
<body>
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title">商品信息</h2>
			<div class="layui-colla-content layui-show">
				<!-- <label class="layui-form-label"></label> <span> <input
					class="layui-btn" type="button" lay-submit lay-filter="search"
					id="add"
					value="添加" />
				</span> -->
				<button class="layui-btn" id="add">添加</button>
			</div>
		</div>
	</div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%" />
				<col width="20%" />
				<col width="10%" />
				<col width="20%" />

			</colgroup>
			<thead>
				<tr>
					<th>订单</th>
					<th>商品</th>
					<th>数量</th>
					<th>金额</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>

	</div>
		<script type="text/javascript" 
	 		src="/Java/web/common/layui/layui.all.js"></script> 
	<script type="text/javascript">
	
	var code='<%=request.getParameter("code")%>';
		ajax('/order/getlist.action', {code:code}, 'json', function(data) {
			//console.log(data)
			var html = "";
			$.each(data, function(i, dom) {
				 
				var data = {
					id:dom.id,
					code :dom.order_code ,
					user:dom.pro_code,
					
					addr : dom.amount,
					status: dom.price
					
				}
			var temp = $("#tradd").html();
			html += laytpl(temp).render(data);
			})

			$("#user_tbody").html(html);
		});
		 function testDelete(id) {
			 
			openConfirm(function(index) {
				console.log(id)
				ajax('/order/delOrderbyId.action', {
					id : id
				}, 'text', function(data) {
					if (data == 1) {
						layer.msg("删除成功");
						location.reload();
					} else {
						
						layer.msg("删除失败");
					}
				})
			})
		}; 
		 $("#add").click(function(){
			
			var html = "";
			html += "<tr><td>"+code+"</td>"
			html +="<td><select name = 'select'></select></td>"
			html +="<td><input type = 'text' name='sum' class = 'layui-input' placeholder='数量'/></td>"
			html +="<td><input type = 'text' name='cost' class = 'layui-input' placeholder='金额'/></td>"
			html +="<td><button id='save' class='layui-btn' onclick='save(this)'>保存</button><button id='cancel' class='layui-btn'onclick='can(this)' >取消</button></td></tr>"
			$("#user_tbody").append(html);
			ajax("/pro/getName.action", {}, "json", function(data){
				
				var html = "";
				$.each(data, function(i, dom){
					html += "<option value ='"+dom.code+"'>"+dom.name+"</option>"
				})
				$("select[name = 'select']").html(html);
				form.render('select');
			})
		}); 
		
	 function can(obj){
			var tr = obj.parentNode.parentNode;
	        tr.parentNode.removeChild(tr);
		} 
		function save(obj){
			var tr = $(obj).parent().parent();
			var select=tr.find("select").val();
			var sum=tr.find("input[name='sum']").val();
			var cost=tr.find("input[name='cost']").val();
			ajax('/order/add.action',
					{pro_code:select,order_code:code,amount:sum,price:cost},'text',
					function(data){
				if(data==1){
					layer.msg("添加成功");
					location.reload();
				}else{
					layer.msg("失败");
				}
			});
			
		} 
	</script>
	<script id="tradd" type="text/html">
		<tr>
			
			<td>{{d.code}}</td>
			<td>{{d.user}}</td>
			<td>{{d.addr}}</td>
			
			<td>{{d.status}}</td>

			<td>
				
				<a href="javascript:testDelete('{{d.id}}')" class="layui-btn layui-btn-xs" >
				<i class="layui-icon layui-icon-delete"></i></a>
				
			</td>
		</tr>
	
	</script>

</body>
</html>
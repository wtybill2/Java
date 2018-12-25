<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title">订单信息</h2>
			<div class="layui-colla-content layui-show">
				<fieldset class="layui-elem-field layui-field-title" >
					<legend>订单信息管理</legend>
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">编号</label>
							<div class="layui-input-inline">
								<input type="text" name="code" 
								 placeholder="请输入账号" autocomplete="off"
									class="layui-input">
							</div>
							
							<label class="layui-form-label"></label> <span> <input
								class="layui-btn" type="button" lay-submit lay-filter="search" value="查询" /> <input type="reset"
								class="layui-btn" value="重置" /> 
							</span>
						</div>
						<input type="hidden" name="action" value="list" /> <input
							type="hidden" name="pageIndex" value="1" /> <input type="hidden"
							name="pageLimit" value="10" />
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>编号</th>
					<th>用户</th>
					<th>时间</th>
					<th>总价</th>
					<th>地址</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	</div>
	<script type="text/javascript" src="/Java/web/common/layui/layui.all.js" charset="utf-8"></script>
	<script type="text/javascript">
	formSubmit('/order/getList.action', 'submit(search)', 'json',
			function(data) {
			
				var curr = $("input[name='pageIndex']").val();
				var limit = $("input[name='pageLimit']").val();
				/* laypage.render({
					elem:'pageInfoUser',//哪一个标签-id
					count:data.count,//数据总数
					curr:curr,//当前页
					limit:limit,//每页显示的条数--以上三条初始化分页
					layout:['count','prev','page','next','limit','skip'],
					jump:function(obj,first){}
				});  */
				   setPageInfo('pageInfoUser', data.count, curr, limit,
						function(obj, first) {
							$("input[name='pageIndex']").val(obj.curr);
							$("input[name='pageLimit']").val(obj.limit);
							if (!first) {
								refresh();
							}
						})  
				var html = "";
				 $.each(data.list, function(i, dom) {
					 
					var data = {
						i : (i + 1 + (curr - 1) * limit),
						code : dom.code,
						user : dom.user,
						addr : dom.addr,
						time : dom.time,
						status: dom.status,
						pricesum : dom.pricesum
					}
					var temp = $("#tradd").html();
					html += layui.laytpl(temp).render(data);
				}); 
				$("#user_tbody").html(html);
				
			})
				
				function openproPic(code) {
					openLayer('/web/back/order/order_item.jsp?code='+ code, refresh)
				}
				refresh();
				function refresh() {
					$("input[value='查询']").click();
					};
					
					function testDelete(code){
						openConfirm(function (index){
							ajax('/order/delOrder.action',{code:code},'text',function(data){
								if(data!=null&&data!=0){
									layer.msg("删除成功");
									refresh();
								}else{
									layer.msg("删除失败");
								}
							})
						})
					}
</script>
<script id="tradd" type="text/html">
		<tr>
			<td>{{d.i}}</td>
			<td>{{d.code}}</td>
			<td>{{d.user}}</td>
			<td>{{d.time}}</td>
            <td>{{d.pricesum}}</td>
			<td>{{d.addr}}</td>
			<td>{{d.status}}</td>

			<td>
				
				<a href="javascript:testDelete('{{d.code}}')" class="layui-btn layui-btn-xs" >
				<i class="layui-icon layui-icon-delete"></i></a>
				<input type="button" class="layui-btn" onclick="openproPic('{{d.code}}')" value="订单详情" />
			</td>
		</tr>
	
	</script>
</body>
</html>
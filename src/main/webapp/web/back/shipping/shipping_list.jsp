<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
</head>
<body>

	<!-- 上侧栏 -->
	<div class="demoTable">
		收获姓名：
		<div class="layui-inline">
			<input class="layui-input" id="searchReceiverName"/>
		</div>
		省份：
		<div class="layui-inline">
			<input class="layui-input" id="searchReceiverProvince"/>
		</div>
	  <button class="layui-btn" data-type="search">搜索</button>	
	  <button class="layui-btn" data-type="deleteAll">批量删除</button>
	  <button class="layui-btn" data-type="add">添加</button>
	</div>

	<!-- 加右侧工具条别忘记加 lay-filter="tableFilter" -->
	<table id="tableId" lay-filter="tableFilter"></table>

	<!-- 右侧栏 -->
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	
	
	<script src="${ctx}/static/back/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
			    elem: '#tableId'
			    ,url: '${ctx}/shipping/pageList.action' //数据接口
			    ,page: true //开启分页
			    ,id : "layUITableId" //设定容器唯一ID，id值是对表格的数据操作方法上是必要的传递条件，它是表格容器的索引
			    ,cols: [[ //表头
			       {type:'checkbox', fixed: 'left'}//加选择框               
			      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
			      ,{field: 'userId', title: '用户id', width:110}
			      ,{field: 'receiverName', title: '收货姓名', width:90, sort: true}
			      ,{field: 'receiverPhone', title: '收货固定电话', width:140} 
			      ,{field: 'receiverMobile', title: '收货移动电话', width: 140}
			      ,{field: 'receiverProvince', title: '省份', width: 80, sort: true}
			      ,{field: 'receiverCity', title: '城市', width: 80}
			      ,{field: 'receiverDistrict', title: '区/县', width: 80, sort: true}
			      ,{field: 'receiverAddress', title: '详细地址', width: 135, sort: true}
			      ,{field: 'receiverZip', title: '邮编', width: 100, sort: true}
			      ,{field: 'createTime', title: '创建时间', width: 135, sort: true}
			      ,{field: 'updateTime', title: '更新时间', width: 135, sort: true}
			      ,{fixed: 'right', width: 178, toolbar : "#barDemo"}//添加右侧栏
			    ]]
			  });
			
			//监听工具条
			  //tool是工具条事件名，tableFilter是table容器属性lay-filter="tableFilter"对应的值
			  table.on('tool(tableFilter)', function(obj){
			    var data = obj.data;//获得当前行数据,json格式对象
			    var layEvent = obj.event;//获得lay-event对应的值
			    if(layEvent === 'detail'){
			      layer.msg('ID：'+ data.id + ' 的查看操作');
			    } else if(layEvent === 'del'){
			      layer.confirm('确定删除吗', function(index){
			    	$.ajax({
			    		url:"${ctx}/shipping/deleteById.action",
			    		data:{"id":data.id},//后台拿到id进行删除操作
			    		dataType:"json",
			    		success:function(resp) {
			    			if(resp.code == util.SUCCESS){
			    				mylayer.success(resp.msg);
			    				table.reload("layUITableId"); //加上容器唯一ID，删除后刷新页面
			    			} else {
			    				mylayer.errorMsg(resp.msg);
			    			}
				        layer.close(index);
			    		}
			    	});
			      });
			    } else if(layEvent === 'edit'){
			      update(data);
			    }
			});
			
			var active = {
				//批量删除
				deleteAll : function(){ //获取选中数据
					var checkStatus = table.checkStatus('layUITableId')
				       var data = checkStatus.data;
				       console.log(data);//选中行的数据
				       console.log(checkStatus.data.length);//获取选中行的数量
				       console.log(checkStatus.isAll);//表格是否全选
				       var ids = util.getSelectedIds(data); //封装了工具类转换成字符串"1,2,3"
				       console.log(ids);
				       layer.confirm('确认删除吗？',function(index){
				    	   $.ajax({
				    		   url : "${ctx}/shipping/deleteAll.action",
				    		   data : {"ids":ids},
				    		   dataType : "json",
				    		   success : function(resp){
				    			   if(resp.code == util.SUCCESS){
				    				   mylayer.success(resp.msg);
				    				   table.reload("layUITableId");
				    			   } else {
				    				   mylayer.success(resp.msg);
				    			   }
				    			   layer.close(index);
				    		   }
				    	   });
				       });
				},
				//搜索
				search : function(){
					table.reload('layUITableId',{
						where : { //设定异步数据接口的额外参数，任意设置
							receiverName : $("#searchReceiverName").val(),
							receiverProvince : $("#searchReceiverProvince").val()
						}
						,page : {
							curr : 1 //从第一页开始
						}
					});
				},
				add : function(){
					insert();
				}
			};
			
			
			  $('.demoTable .layui-btn').on('click', function(){
				   var type = $(this).data('type');
				   active[type] ? active[type].call(this) : '';
			   });	
			  
			  //添加
			  function insert(){
				  layer.open({
						type : 2,
						title : "添加收货地址",
						area : ["400px","600px"],
						offset : "1px", //定义top坐标，左右居中
						//弹出框里面的内容，转发(拿到Insert的页面)
						content : "${ctx}/shipping/getAddPage.action"
					})
			  }
			  
			  //修改
			  function update(data){
				  var id = data.id;
				  layer.open({
						type : 2,
						title : "修改收货地址",
						area : ["400px","600px"],
						offset : "1px", //定义top坐标，左右居中
						//弹出框里面的内容，转发(拿到Insert的页面)
						content : "${ctx}/shipping/getToUpdatePage.action?id=" + id
					})
			  }
		});
	</script>
</body>
</html>
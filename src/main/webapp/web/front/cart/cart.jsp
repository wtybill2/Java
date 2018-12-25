<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>靓淘网</title>
	<%@ include file="/web/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/main.css"/>
	
</head>
<body>
	<!-----------------------1.top-------------------->
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">
						欢迎来到靓淘！
					</span>
				</div>
				<div class="right">
					<ul>
						<li><a class="login" href="javaScript:;" target="_blank" id="user" onclick="userLogin()"></a></li>
						<li><a href="${ctx}/web/register.jsp" target="_blank">快速注册</a></li>
						<li><a class="collect" href="">我的收藏</a></li>
						<li><a class="indent" href="javaScript:;" onclick="getOrderPage()">我的订单</a></li>
						<li><a class="phone" href="">手机靓淘</a></li>
						<li><a href="">我的积分</a></li>
						<li><a href="">我的评价</a></li>
						<li><a href="${ctx}/frontindex/loginOut.action">退出登陆</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	<div class="search_bar clearfix">
		<a href="${ctx}/frontindex/index.action" class="logo fl"><img class="logo_img" src="${ctx}/static/front/img/LOGO.png" /></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
	</div>

	<div class="total_count">全部商品</div>	
	<ul class="cart_list_th clearfix">
		<li class="col01" style="width:10%"></li>
		<li class="col02" style="width:24%">商品信息</li>
		<li class="col03" style="width:13%">商品价格</li>
		<li class="col04" style="width:12%">数量</li>
		<li class="col05" style="width:15%">小计</li>
		<li class="col06" style="width:17%">操作</li>
	</ul>
	
	<c:forEach items="${cartVO}" var="cartItemVO">
		<ul class="cart_list_td clearfix">
		
			<%-- 因为是循环遍历，所以拿到的id不是唯一的，所以要在id后面加上${cartItemVO.product.id}确保id是唯一的 --%>
			<li class="col01" style="width:10%;height:100px">
			<!-- 刷新页面如果是==1，就打上勾，不是就不打勾 -->
			<c:if test="${cartItemVO.ischecked == 1}">
				<input class="checx" name="selectCheckbox" onclick="updateStatus(${cartItemVO.id})" id="checkbox${cartItemVO.id}" type="checkbox"  checked value="${cartItemVO.id}"/></li>
			</c:if>
			<c:if test="${cartItemVO.ischecked == 0}">
				<input class="checx" name="selectCheckbox" onclick="updateStatus(${cartItemVO.id})" id="checkbox${cartItemVO.id}" type="checkbox" value="${cartItemVO.id}"/>
				
			</c:if></li>
			<li class="col02" style="width:24%;height:100px"><img src="/image/${cartItemVO.url}" style="display:inline" /><span style="margin-top:45px">${cartItemVO.name}</span></li>
			
			
			<li class="col03" style="width:13%;height:100px;text-align:center" id="price${cartItemVO.id}" value="${cartItemVO.cost}">￥ ${cartItemVO.cost}</li>
			<li class="col04" style="width:12%;height:100px">
				<div class="num_add" style="width:13%;height:100px;display: inline">
					<!-- 点击+号或-号，启动方法，把id,价格，+1或-1传向后台 -->
					<%-- <a href="javascript:;" style="width:40px;height:100px" class="add fl" onclick="updateAmount(${cartItemVO.id},${cartItemVO.cost},-1)"/>-</a>
					<input id="num${cartItemVO.id}" style="width:50px;height:30px;margin-top: 45px;" type="text" class="num_show fl" value="${cartItemVO.amount}"/>	
					<a href="javascript:;" style="width:40px;height:100px" class="minus fl" onclick="updateAmount(${cartItemVO.id},${cartItemVO.cost},1)"/>+</a> --%>
					<input type="number" id="num${cartItemVO.id}"  style="width:40px;height:30px" value="${cartItemVO.amount}" onchange="sumchange(this,${cartItemVO.id},${cartItemVO.cost})" ></input>	
				</div>
			</li>
			<li class="col05" style="width:15%;height:100px" id="cartItemTotalPrice${cartItemVO.id}" >${cartItemVO.amount*cartItemVO.cost}</li>
			<li class="col06" style="width:18%;height:100px"><a href="javascript:;" onclick="deleteById(${cartItemVO.id})">删除</a></li>
		</ul>
	</c:forEach>

	<ul class="settlements">
			<li class="col01"><input type="checkbox" id="checkAll"  /></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em id="totalPrice"></em><br>共计<b id="count"></b>件商品</li>
		<li class="col04"><a href="javascript:;" onclick="getPlaseOrderPage()">去结算</a></li>
	</ul>

	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>

	<script src="${ctx}/static/front/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use(['layer'], function(){
			var layer = layui.layer; 
	   }); 
		function getValue(amount,cost){
			return new Number(parseFloat(cost)*parseFloat(amount)).toFixed(2);
		}
		function sumchange(obj,id,cost){
			var v=obj.value;
			ajax('/frontindex/sum.action',{id:id,sum:v},'text',function(data){
				if(data==1){
					obj.value=v;
					var sum=${cart1.sum}
					$("#cartItemTotalPrice"+id).html(getValue(v,cost));
					//location.reload();
				}
			})
		}
		
		
		/* 删除购物车某一项 */
		function deleteById(id){
			layer.confirm("确定删除吗？",function(){
				ajax('/frontindex/deleteById.action',{id:id},'json',function(data){
						if(data==1){
							
							/* 从定义的checkbox往上找，找到包裹最大的div然后remove掉 */
							//$("#checkbox" + id).parent().parent().remove();
							refreshTotalPrice();//刷新全部总价格
							refreshTotalCountAmount();//刷新总件数
							location.reload();
						} 
					})
					
				});
			
		}
		
		//checkbox
		function updateStatus(id){
			//拿到选择的状态
			var isChecked = $("#checkbox" + id).prop("checked");
			if(isChecked){
				isChecked = 1;
			} else {
				isChecked = 0;
			}
			$.ajax({
				url : "${ctx}/frontindex/UpdateCart1.action",
				data : {productId : id,ischecked : isChecked},
				type : "POSt",
				dataType : "json",
				success : function(a){
					if(a==1){
						//mylayer.success(resp.msg);
						refreshTotalPrice();//刷新全部总价格
						refreshTotalCountAmount();//刷新总件数
					} else {
						mylayer.success(resp.msg);
					}
				}
			});
		}
		
		
		//刷新页面即刷新合计的钱数和商品的总件数
		$(function(){
			refreshTotalPrice();
			refreshTotalCountAmount();
		});
		
		//把刷新页面写到这方便调用
		function refreshTotalPrice(){
			/* 拿到打勾的checkbox选项 */
			var checkboxs = $("input[name = selectCheckbox]:checked");//input#checkbox271
			var totalPrice = 0.00;
			for(i = 0;i<checkboxs.length;i++){
				var checkboxId = checkboxs[i].getAttribute("id");// checkbox271
				//截取掉checkbox，留下271，这里的id就是确定唯一checkbox框
				var id = checkboxId.substr("checkbox".length);
				
				//得到每一个CartItemVO的总价
				var cartItemTotalPrice = $("#cartItemTotalPrice" + id).html();
				//2999是字符串类型，用parseFloat转换
				totalPrice += parseFloat(cartItemTotalPrice);
			}
			//在页面展示出来
			$("#totalPrice").html(totalPrice);
		}
		
		//统计商品的数量
		function refreshTotalCountAmount(num){
			 var countAmount = 0;
			/* 拿到打勾的checkbox选项 */
			var checkboxs = $("input[name = selectCheckbox]:checked");//input#checkbox271
			for(i = 0;i<checkboxs.length;i++){
				var checkboxId = checkboxs[i].getAttribute("id");// checkbox271
				//截取掉checkbox，留下271，这里的id就是确定唯一checkbox框
				var id = checkboxId.substr("checkbox".length);
				//拿到每件商品的数量
				var cartItemTotalAmount = $("#num" + id).val();
				countAmount += parseInt(cartItemTotalAmount);
				//count += 1;
			}	
			//页面展示总数量
			$("#count").html(countAmount);
		}
		
		
		
		//全选按钮改变状态
		$("#checkAll").click(function(num,id){//给全选按钮加上点击事件
	        var check = $(this).prop("checked");//判断全选按钮的选中状态
	        var ck = $(".checx").prop("checked",check);  //让class名为checx的选项的选中状态和全选按钮的选中状态一致。
	       
	       
	        /* 拿到打勾的checkbox选项 */
			/* var checkboxs = $("input[name = selectCheckbox]:checked");//input#checkbox271
			var totalPrice = 0.00;
			for(i = 0;i<checkboxs.length;i++){
				var checkboxId = checkboxs[i].getAttribute("id");// checkbox271
				//截取掉checkbox，留下271，这里的id就是确定唯一checkbox框
				var id = checkboxId.substr("checkbox".length);
			} */
	       
	        var isChecked ;
			var t=$("input[type='checkbox']").is(':checked')
	        //拿到选择的状态
			if(t){
				isChecked = 1;
			} else {
				isChecked = 0;
			}
			var id = [];
			$('input[name="selectCheckbox"]').each(function() {
				id.push($(this).val());
			});
			refreshTotalPrice();//刷新全部总价格
			refreshTotalCountAmount();//刷新总件数
			
			$.ajax({
				url : "${ctx}/frontindex/UpdateCart.action",
				data : {id:id,isChecked:isChecked},
				type : "POSt",
				traditional: true,
				dataType : "json",
				success : function(data){
					if(data==3){
						//mylayer.success(resp.msg);
						refreshTotalPrice();//刷新全部总价格
						refreshTotalCountAmount();//刷新总件数
						
					} 
				}
			});
	    });
		
		/* 购物车结算、登陆 */
		function getPlaseOrderPage(){
			//拿到session域中的user信息，如果不存在就登陆，存在就进入确如订单界面
			var user = "${userpom}";
			var userId = "${userpom.id}";
			if(user == ""){
				layer.open({
					type : 2,
					title : "用户登陆",
					area : ["400px","500px"],
					offset : "40px", //定义top坐标，左右居中
					//弹出框里面的内容，转发(拿到Insert的页面)
					content : "${ctx}/frontindex/getLoginPage.action"
				});
			} else { //user存在进入确认订单界面
				window.location.href = "${ctx}/frontindex/getOrderPage.action";
				
			}
		}
		
		//获得订单详情页面
		function getOrderPage(){
			var user = "${userpom}";
			var userId = "${userpom.id}"
			if(user == ""){
				layer.open({
					type : 2,
					title : "用户登陆",
					area : ["400px","500px"],
					offset : "40px", //定义top坐标，左右居中
					//弹出框里面的内容，转发(拿到Insert的页面)
					content : "${ctx}/frontindex/getLoginPage.action"
				});
			} else { //登陆了跳转
				window.location.href="${ctx}/frontindex/getUserOrderPage.action";
			}
		}
		
		/* 登陆功能,一进入页面就显示 */
		$(function(){
			var user = "${userpom}";
			var userId = "${userpom.id}"
			var userName = "${userpom.name}";
			console.log(userName);
			if(user == ""){ //没有登陆显示登陆
				$("#user").html("请登录");
			} else {
				$("#user").html(userName);
			}
		});
		
		//登陆
		function userLogin(){
			layer.open({
				type : 2,
				title : "用户登陆",
				area : ["400px","500px"],
				offset : "40px", //定义top坐标，左右居中
				//弹出框里面的内容，转发(拿到Insert的页面)
				content : "${ctx}/frontindex/getLoginPage.action"
			});
		}
	</script>
</body>
</html>
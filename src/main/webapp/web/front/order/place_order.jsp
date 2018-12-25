<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>靓淘网</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/main.css"/>
</head>
<body>
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
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
	</div>
	
	<h3 class="common_title">确认收货地址</h3>

	<!-- 收获地址start-->
		<div class="common_list_con clearfix">
		<dt style="margin-left: 10px;margin-top: 10px">寄送到：</dt>
		
		</div>
	<!-- 收获地址end-->
	
	<h3 class="common_title">支付方式</h3>	
	<div class="common_list_con clearfix">
		<div class="pay_style_con clearfix">
			<input type="radio" name="pay_style" checked>
			<label class="cash">货到付款</label>
			<input type="radio" name="pay_style">
			<label class="weixin">微信支付</label>
			<input type="radio" name="pay_style">
			<label class="zhifubao"></label>
			<input type="radio" name="pay_style">
			<label class="bank">银行卡支付</label>
		</div>
	</div>

	<h3 class="common_title">商品列表</h3>
	
	<div class="common_list_con clearfix">
		<ul class="goods_list_th clearfix">
			<li class="col01">商品名称</li>
			<li class="col02">商品单位</li>
			<li class="col03">商品价格</li>
			<li class="col04">数量</li>
			<li class="col05">小计</li>		
		</ul>
		<c:forEach items="${cartVO}" var="cartItemVO" varStatus="i">
		<c:if test="${cartItemVO.ischecked == 1}">
				<input type="hidden" id="productId${cartItemVO.id}" name="productId" value="${cartItemVO.id}" />
				<ul class="goods_list_td clearfix">
					<li class="col01">${i.count}</li>			
					<li class="col02"><img src="/image/${cartItemVO.url}"/></li>
					<li class="col03" style="height:80px">${cartItemVO.name}</li>
					<li class="col04">件</li>
					<li class="col05">${cartItemVO.cost}元</li>
					<li class="col06" id="amount${cartItemVO.id}">${cartItemVO.amount}</li>
					<li class="col07" id="price${cartItemVO.id}">${cartItemVO.amount * cartItemVO.cost}元</li>	
				</ul>
				</c:if>
		</c:forEach>
	</div>

	<h3 class="common_title">总金额结算</h3>

	<div class="common_list_con clearfix">
		<div class="settle_con">
			<div class="total_goods_count">共<em id="count"></em>件商品，总金额<b id="totalPrice"></b><b>元</b></div>
			<div class="transit">运费：<b>0 元</b></div>
			<div class="total_pay">实付款：<b id="totalEndPrice"></b><b>元</b></div>
		</div>
	</div>

	<div class="order_submit clearfix">
		<a href="javaScript:;" id="order_btn" onclick="addOrder()">提交订单</a>
	</div>	

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

	<div class="popup_con">
		<div class="popup">
			<p>订单提交成功！</p>
		</div>
		
		<div class="mask"></div>
	</div>
	
	<script src="${ctx}/static/front/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript">
	 layui.use(['layer'], function(){
			var layer = layui.layer; 
	   }); 
		/* 选择收获地址 */
		/* function radio(shippingId){
			var radio = $("#radio" + shippingId).val();
			if(radio == 0){
				$("#radio" + shippingId).prop("radion",true); 
				
			}
			console.log(radio);
		}  */
		
		//刷新页面即刷新商品的件数和金额
		$(function(){
			refreshTotalPrice(); //页面总金额
			refreshTotalCountAmount();//总件数
		});
		
		//总件数
		function refreshTotalCountAmount(){
			var countAmount = 0;
			//var productId = $("#productId").val();
			//拿到所有的id，input#productId271
			var productIds = $("[name = productId]");
			for(i = 0;i < productIds.length; i++ ){
				//productId271
				var productId = productIds[i].getAttribute("id");
				//271
				var id = productId.substr("productId".length);
				
				//拿到每件商品的数量
				var cartItemTotalAmount = $("#amount" + id).html();
				/* 总数量 */
				countAmount += parseInt(cartItemTotalAmount);
			}
			$("#count").html(countAmount);
			
		}
		
		//页面总金额
		function refreshTotalPrice(){
			var totalPrice = 0.00;
			//拿到所有的id，input#productId271
			var productIds = $("[name = productId]");
			for(i = 0;i < productIds.length; i++ ){
				//productId271
				var productId = productIds[i].getAttribute("id");
				//271
				var id = productId.substr("productId".length);
				
				//拿到每件商品的价格
				var price = $("#price" + id).html();
				//总数量 
				totalPrice += parseFloat(price);
			}
			$("#totalPrice").html(totalPrice);
			$("#totalEndPrice").html(totalPrice);
		} 
		
		
		//提交订单，填充数据库order，order_item表
		function addOrder(){
			
			//拿到实付款的总金额
			var payment = $("#totalEndPrice").html();
			//拿到每一项的金额
			var totalPrice = $("price").val();
			
			$.ajax({
				url : "${ctx}/frontindex/addOrder.action",
				type : "POST",
				data : {payment : payment},
				dataType : "json",
				success : function(data){
					if(data!=0){
						location.href = "${ctx}/frontindex/getUserOrderPage.action";
						
					} else {
						layer.msg("请选择商品")
					}
				}
			});
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
				window.location.href="${ctx}/frontindex/getOrderPage.action";
			}
		}
		
		/* 登陆功能,一进入页面就显示用户名 */
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
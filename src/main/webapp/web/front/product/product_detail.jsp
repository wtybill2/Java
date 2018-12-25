<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>靓淘网</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/main.css">
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
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品" />
			<input type="button" class="input_btn fr" name="" value="搜索" />
		</div>
		<div class="guest_cart fr">
			<a href="${ctx}/frontindex/getCartPage.action" class="cart_name fl" >我的购物车</a>
			<div class="goods_count fl">1</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
			</div>
			<ul class="navlist fl">
				<li><a href="${ctx}/frontindex/index.action">首页</a></li>
				<li class="interval">|</li>
				<li><a href="${ctx}/static/front/">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">新鲜水果</a>
		<span>></span>
		<a href="#">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl" ><img src="/image/${product.url}" width="300px" height="300px"/></div>

		<div class="goods_detail_list fr">
			<h3>${product.name}</h3>
			
			<div class="prize_bar">
				<span class="show_pirze">¥<em>${product.cost}</em></span>
				<!-- <span class="show_unit">单  位：500g</span> -->
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<a href="javascript:;"  class="add fr" onclick="update(1)">+</a>
					<input id="amount"  type="text" class="num_show fl" value="1"/>
					<a href="javascript:;"  class="minus fr" onclick="update(-1)">-</a>	
				</div> 
			</div>
			<div class="total">总价：<em>${product.cost}</em></div>
			<div class="operate_btn">
				<a href="javascript:;" class="buy_btn">立即购买</a>
				<!-- <a >加入购物车</a>	 -->
				<button class="add_cart" id="add_cart" onclick="getCartPage('${product.code}')">加入购物车</button>			
			</div>
		</div>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="${ctx}/static/front/img/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="${ctx}/static/front/img/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					本商品属于123432
				</dl>
			</div>

		</div>
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
	<div class="add_jump"></div>

	<script src="${ctx}/static/front/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript">
	 layui.use(['layer'], function(){
			var layer = layui.layer; 
	   }); 
	
		function getCartPage(code){
			var user = "${userpom}";
			var userId = "${userpom.id}"
			var userName = "${userpom.name}";
			var amount=$("#amount").val();
			if(user == ""){ 
			layer.open({
				type : 2,
				title : "用户登陆",
				area : ["400px","500px"],
				offset : "40px", //定义top坐标，左右居中
				//弹出框里面的内容，转发(拿到Insert的页面)
				content : "${ctx}/frontindex/getLoginPage.action"
			});
			}else{
			$.ajax({
				url : "${ctx}/frontindex/addCart.action",
				data : {user:userName,code : code,amount : amount},
				type : "POST",
				dataType : "json",
				success : function(data){
					if(data == 1){
						mylayer.confirm("添加成功，是否跳转到购物车?","${ctx}/frontindex/getCartPage.action");
					} else {
						mylayer.errorMsg(resp.msg);
					}
				}
			});
		}
		}
		
		//点击+、-号value的值更新
		 function update(num){
			var amount = $("#amount").val();
			amount = parseInt(amount) + num;
			if(amount >= 0){
			$("#amount").val(amount);
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
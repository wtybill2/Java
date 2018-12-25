<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>靓淘网</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/main.css">
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
						<li><a href="user/register.shtml" target="_blank">快速注册</a></li>
						<li><a class="collect" href="">我的收藏</a></li>
						<li><a class="indent" href="javaScript:;" onclick="getOrderPage()">我的订单</a></li>
						<li><a class="phone" href="">手机靓淘</a></li>
						<li><a href="">我的积分</a></li>
						<li><a href="">我的评价</a></li>
						<li><a href="${ctx}/user/loginOut.shtml">退出登陆</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	<div class="main_con clearfix">
		<div class="search_bar clearfix">
			<a href="${ctx}/index.shtml" class="logo fl"><img class="logo_img" src="${ctx}/static/front/img/LOGO.png" /></a>
			<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;全部订单</div>
		</div>
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="user_center_order.html" class="active">· 全部订单</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<table class="layui-table">
			<colgroup>
				<col width="530px" />
				<col width="150px" />
				<col width="150px" />
				<col width="150px" />
			</colgroup>
			<thead>
				<tr>
					<th>订单商品信息</th>
					<th>总金额</th>
					<th>商品状态</th>
					<th>查看操作</th>
					
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
				 <c:forEach items="${order}" var="orderw"> 
					<ul class="order_list_th w978 clearfix">
						
						<li class="col02" style="width:50%">订单号：${orderw.code}</li>
						<li class="col02">时间：${orderw.time}</li>	
						<li class="col02 stress">已支付</li>			
					</ul>
					<table class="order_list_table w980">
						<tbody>
							<tr>
								<td width="55%">
									<ul class="order_goods_list clearfix">					
										<c:forEach items="${order1}" var="orderItems">
											<c:if test="${orderItems.order_code == orderw.code}">
												<li class="col01" style="width:25%"><img src="/image/${orderItems.url}"/></li>
												<li class="col02" style="width:30%">编号：${orderItems.pro_code}</li>	
												
												<li class="col03" style="width:20%">数量：${orderItems.amount}</li>
												<li class="col04" style="width:25%" >价格:${orderItems.price}元</li>	
											</c:if>
										</c:forEach>
									</ul>
								</td>
								<td width="15%">${orderw.pricesum}元</td>
								<td width="15%">已付款</td>
								<td width="15%"><a href="#" class="oper_btn">查看物流</a></td>
							</tr>
						</tbody>
					</table>
				 </c:forEach> 
				

				<!-- <div class="pagenation">
					<a href="#">上一页</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">下一页></a>
				</div> -->
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
	
	<script src="${ctx}/static/front/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/common/mylayer.js"></script>
	<script src="${ctx}/static/common/util.js"></script>
	<script src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript">
	 layui.use(['layer'], function(){
			var layer = layui.layer; 
	   }); 
	 
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
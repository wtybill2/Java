<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<script src="${ctx}/static/front/js/jquery.js" type="text/javascript" charset="utf-8"></script>

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
			<input type="text" class="input_text fl" name="" placeholder="搜索商品"/>
			<input type="button" class="input_btn fr" name="" value="搜索" id="select"/>
		</div>
		<div class="guest_cart fr">
			<a href="${ctx}/frontindex/getCartPage.action" class="cart_name fl">我的购物车</a>
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
		<a href="${ctx}/static/front/#">全部分类</a>
		<span>></span>
		<a href="${ctx}/static/front/#">新鲜水果</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="${ctx}/static/front/img/goods001.jpg"></a>
						<h4><a href="${ctx}/static/front/#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="${ctx}/static/front/img/goods002.jpg"></a>
						<h4><a href="${ctx}/static/front/#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a href="${ctx}/static/front/#" class="active">默认</a>
				<a href="${ctx}/static/front/#">价格</a>
				<a href="${ctx}/static/front/#">人气</a>
			</div>
			<form action="">
			<ul class="goods_type_list clearfix" id="productList">
					<c:forEach items="${productList}" var="list">
					<li>
						<a href="${ctx}/frontindex/getProductDetailPage.action?id=${list.code}"><img src="/image/${list.url}"/></a>
						<h4><a href="${ctx}/frontindex/getProductDetailPage.action?id=${list.code}">${list.name}</a></h4>
						<div class="operate">
							<span class="prize">￥${list.cost}</span>
							<!-- <span class="unit">16.80/500g</span> -->
							<a href="#" class="add_goods" title="加入购物车" onclick="getCartPage('${list.code}')"></a>
						</div>
					</li>
					</c:forEach>
					
			</ul>
			 <input
							type="hidden" name="pageIndex" value="1" /> <input type="hidden"
							name="pageLimit" value="10" />
			</form>
		</div>
	</div>
			<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>

	<div class="footer">
		<div class="foot_link">
			<a href="${ctx}/static/front/#">关于我们</a>
			<span>|</span>
			<a href="${ctx}/static/front/#">联系我们</a>
			<span>|</span>
			<a href="${ctx}/static/front/#">招聘人才</a>
			<span>|</span>
			<a href="${ctx}/static/front/#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	
		<script src="${ctx}/static/front/js/jquery.min.js?v=2.1.4"></script>
		<script src="${ctx}/static/common/mylayer.js"></script>
		<script src="${ctx}/static/common/util.js"></script>
		<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript">
			layui.use('layer', function(){
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
		
		/* 点击购物车按钮加入购物车 */
		function getCartPage(code){
			var user = "${userpom}";
			var userId = "${userpom.id}"
			var userName = "${userpom.name}";
			
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
				data : {user:userName,code : code,amount : 1},
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
		
		
		/* 登陆功能,一进入页面就显示 */
		$(function(){
			var user = "${userpom}";
			var userId = "${userpom.id}"
			var userName = "${userpom.name}";
			if(user == ""){ //没有登陆显示登陆
				$("#user").html("请登录");
			} else {
				$("#user").html(userName);
			}
			
				ss();
		});
		function ss(){
			
			var code='<%=request.getParameter("code") %>';
			
			if(code=="null"){
				code="";
			}
			
			var curr = $("input[name='pageIndex']").val();
			var limit = $("input[name='pageLimit']").val();
		
	ajax('/frontindex/getCount.action',{code:code,pageIndex:curr,pageLimit:limit},'text',function(data){
		var curr = $("input[name='pageIndex']").val();
		var limit = $("input[name='pageLimit']").val();
		
			 setPageInfo('pageInfoUser', data, curr, limit,
						function(obj, first) {
				 
							$("input[name='pageIndex']").val(obj.curr);
							$("input[name='pageLimit']").val(obj.limit);
							
							if (!first) {
			                   location.href="${ctx}/frontindex/getProductListPage.action?pageIndex="+obj.curr+"&pageLimit="+obj.limit;
								//ss();
								
							}
						})  
						
	})
		}
		
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
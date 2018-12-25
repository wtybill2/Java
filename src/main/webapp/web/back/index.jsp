<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/web/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>商城管理系统</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="${ctx}/static/back/favicon.ico">
    <link href="${ctx}/static/back/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx}/static/back/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/static/back/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/static/back/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu" >
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${ctx}/static/back/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${user.code }</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="${ctx}/static/back/form_avatar.html">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="${ctx}/static/back/profile.html">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="${ctx}/static/back/contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="${ctx}/static/back/mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li> <a href="${ctx}/user/logout.action">安全退出</a> 
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                   
                    <!-- 主页下拉 -->
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${ctx}/web/back/index_v3.jsp" data-index="0">财务报表</a>
                            </li>
                        </ul>
                    </li>
                   
                    <!-- 商品分类 -->
                    <li>
                       <a class="J_menuItem" href="${ctx}/web/back/category/category_list.jsp" data-index="0">
                    	 	<i class="fa fa-building-o"></i>
                    	  	<span class="nav-label">商品分类</span>
                       </a>
                    </li>
                    
                    <!-- 商品分页 -->
                    <li>
                       <a class="J_menuItem" href="${ctx}/web/back/product/product_list.jsp">
                    	 	<i class="fa fa-space-shuttle"></i>
                    	  	<span class="nav-label">商品管理</span>
                       </a>
                    </li>
                    
					<!-- 用户管理-->
					<li>
                       <a class="J_menuItem" href="${ctx}/web/back/user/user_list.jsp" data-index="0">
                       <!-- /Java/src/main/webapp/web/back/user/user_list.jsp -->
                    	 	<i class="fa fa-user-plus"></i>
                    	  	<span class="nav-label">用户管理</span>
                       </a>
                    </li>
                    
					<!-- 收获地址管理 -->
					<li>
                       <a class="J_menuItem" href="${ctx}/web/back/shipping/shipping_list.jsp" data-index="0">
                    	 	<i class="fa fa-truck"></i>
                    	  	<span class="nav-label">收获地址管理</span>
                       </a>
                    </li>
                    
					<!-- 收获地址管理 -->
					<li>
                       <a class="J_menuItem" href="${ctx}/web/back/category/category_count.jsp" data-index="0">
                    	 	<i class="fa fa-bar-chart-o"></i>
                    	  	<span class="nav-label">商品数量统计</span>
                       </a>
                    </li>
                    
					<!-- 订单详情 -->
					<li>
                       <a class="J_menuItem" href="${ctx}/web/back/order/order.jsp" data-index="0">
                    	 	<i class="fa fa-shopping-cart"></i>
                    	  	<span class="nav-label">订单详情</span>
                       </a>
                    </li>
					
                    <li>
                        <a href="${ctx}/static/back/mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${ctx}/static/back/mailbox.html">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="${ctx}/static/back/mail_detail.html">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="${ctx}/static/back/mail_compose.html">写信</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="${ctx}/static/back/profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${ctx}/static/back/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="${ctx}/static/back/mailbox.html">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="${ctx}/static/back/mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="${ctx}/static/back/profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="${ctx}/static/back/notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a href="${ctx}/frontindex/index.action" class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i> 购买</a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="/Java/web/back/index_v3.jsp">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/user/logout.action" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/web/back/index_v3.jsp" frameborder="0" data-id="${ctx}/web/back/index_v3.jsp" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 <a href="${ctx}/static/back/http://www.zi-han.net/" target="_blank">zihan's blog</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>


            </div>
        </div>
        <!--右侧边栏结束-->
        
        <div id="small-chat">
            <span class="badge badge-warning pull-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
    </div>
    <script src="/Java/static/back/js/jquery.min.js"></script>
    <script src="${ctx}/static/back/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/back/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/static/back/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx}/static/back/js/plugins/layer/layer.min.js" charset="utf-8"></script>
    <script src="${ctx}/static/back/js/hplus.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/back/js/contabs.min.js"></script>
    <script src="${ctx}/static/back/js/plugins/pace/pace.min.js"></script>
</body>

</html>
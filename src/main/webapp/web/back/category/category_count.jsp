<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/web/common/taglibs.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
   
    <script src="${ctx}/static/back/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/lib/echarts/echarts.min.js"></script>
    <script type="text/javascript">
       $(function(){
	    	// 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));
			$.ajax({
				url : "${ctx}/category/getCategoryCount.action",
				type : "POST",
				dataType : "json",
				success : function(resp){
					console.log(resp);
					var data = resp.data;
					console.log(data);
					//x数据，存放分类的名字
					var xArray = new Array();
					//y数据，存放分类的数量
					var yArray = new Array();
					
					for(var i = 0;i < data.length;i++){
						xArray.push(data[i].name);
						yArray.push(data[i].count);
					}
					// 指定图表的配置项和数据
			        var option = {
			            title: {
			                text: '商品数量统计'
			            },
			            tooltip: {},
			            legend: {
			                data:['数量']
			            },
			            xAxis: {
			                data: xArray
			            },
			            yAxis: {},
			            series: [{
			                name: '数量',
			                type: 'bar',
			                data: yArray
			            }]
			        };
			       
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
				}
				
			});
	    	
	       
       }); 
    </script>
</body>
</html>
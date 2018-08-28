<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../model/list_header.jsp" %>
<%@ include file="../model/Orders.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all">  
	<link rel="stylesheet" href="../build/css/doc.css" media="all">
<style type="text/css">
        .layui-table-cell {
            height: auto;
            line-height: 45px;
        }

</style>
<script type="text/javascript">
	function fresh() {
		location.href="index";
	}
	function openwin() {
		show("edit",650,500);
	}
	function openwina(id) {
		show("edit?id="+id,400,250);
	}
	function openwin(id) {
		location.href="edit?id="+id
	}
</script>

</head>
<body>
	<div class="demoTable">
		<div class="layui-form" >
		    <div class="layui-form-item" style="margin-top: 20px"> 	 	
	          <div class="layui-inline">
	                <div class="layui-input-inline">
	                	<label class="layui-form-label">查询分类：</label>
	                	<div class="layui-input-block" style="width:100px">
	                    	<select id="sd" class="sselect" lay-filter="test" name="select" >
								<option value="0">状态类型</option>
								<option value="1">日期查询</option>
							</select>
						</div>
	                </div>
	                
	                 <div class="layui-input-inline">
	                 	<label class="layui-form-label">具体条件</label>
	               		<div class="layui-input-block" style="width:100px">
			            	<select name="txt" class="sinput as" id="as"></select>
						</div>
	           		</div>
	           	
	           		<div class="layui-input-inline" style="width:20px;height:20px"></div>
	           		<div class="layui-input-inline" style="width:300px">
	           			<button  class="layui-btn" data-type="reload" id="er">查询</button>	           
	           		</div>
	            </div>
	        </div>
     	</div>
	</div>	
    <table class="layui-table" id="userList" lay-filter="userList"></table>		

</body>
</html>

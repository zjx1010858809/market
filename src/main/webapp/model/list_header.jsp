<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link href="../plugins/layui/css/layui.css" rel="stylesheet">
  
<script type="text/javascript" src="../src/js/jquery-3.3.1.min.js"></script>
   <script src="../plugins/layui/layui.js"></script>
<script type="text/javascript" src="../plugins/layui/layui.all.js"></script>
<script type="text/javascript" src="../src/js/utils.js"></script>
<script type="text/javascript" >
var login = "${requestScope.login}"+"d";
if(login == "logind"){
	window.parent.location.href="../login.jsp";
}

	function show(url,h,w) {
		layer.open({
			  type: 2,
			  area: [h+'px', w+'px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content:url,
			});
	}
	 

</script>
 <style type="text/css">
 /*
    tbody tr td{
    height: 28px;
    line-height: 28px !important;
    padding: 0 15px !important; 
    position: relative !important;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    box-sizing: border-box !important;
    }
    
    thead tr th{
    height: 28px;
    line-height: 28px !important;
    padding: 0 15px !important;
    position: relative !important;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    box-sizing: border-box !important;
    } 
    .demoTable{
    margin-left: 20px;
    margin-top: 5px;
    }
    .demoTable input{ height: 30px;}
    .demoTable button{ height: 30px;line-height:30px;}
    
    [type=checkbox]{
		display:block !important;
	}
	a{color:red}
	a:hover{
		color:blue
	}
   */
    </style>
    
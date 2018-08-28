<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all">
	<script type="text/javascript" src="../src/js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css" media="all" />
	<script type="text/javascript" src="../fileupload/js/piclist.js"></script>
	<style type="text/css">
		.layui-input-block{
			margin-right: 50px
	}
	</style>
</head>

<body>
    <form class="layui-form" action="" >
    	
				<input style="display:none" class="inputinput" name="id" value="${requestScope.id}">
		
        <div class="layui-form-item" style="margin-top: 20px">
            <label class="layui-form-label">运单号</label>
            <div class="layui-input-block">
                <input value="" type="text" name="info" lay-verify="info" autocomplete="off" placeholder="请输运单号（大于2字符）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px">
            <label class="layui-form-label">快递公司</label>
            <div class="layui-input-block">
                <input value="" type="text" name="comments" lay-verify="comments" autocomplete="off" placeholder="请输快递公司（大于2字符）" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">

            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>

        </div>
        </form>
    
    <script src="../plugins/layui/layui.js"></script>
   
    <script>
        layui.use(['form', 'layedit', 'laydate','layer'], function() {
            var form = layui.form,
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate;

            //自定义验证规则
            form.verify({
            	info: function(value) {
                    if (value.length < 2) {
                        return '运单号至少得2个字符啊'
                    }
                },
                comments: function(value) {
                    if (value.length < 2) {
                        return '快递公司至少得2个字符啊'
                    }
                },
               
            });

            //监听提交
            form.on('submit(demo1)', function(data) {
         
            	
            	save(data.field);
                return false;
            });
            
            
        });
        
        function save(data) {
			$.post("save",data,function(json){
				if(json.c>0){
					parent.fresh();
					var index=parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			},"json");
		}
    </script>

</body>

</html>
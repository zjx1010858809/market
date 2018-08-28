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
	<script type="text/javascript">
		
	</script>
</head>

<body>
    <form class="layui-form" action="" >
    	<c:if test="${requestScope.operator.id != null}">
				<input style="display:none" class="inputinput" name="id" value="${requestScope.operator.id}">
		</c:if>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input value="${requestScope.operator.nike}" type="text" name="nike" lay-verify="nike" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        
        <c:if test="${requestScope.operator.id != null}">
         <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input value="${requestScope.operator.password}" type="text" name="password" lay-verify="pass" placeholder="请输入密码" onfocus="this.blur();" autocomplete="off" class="layui-input layui-disabled">
            </div>
          
        </div>
        </c:if>
        
         <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input value="${requestScope.operator.name}" type="text" name="name" lay-verify="name" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
            	<c:if test="${requestScope.operator.sex != 1}">
            		 <input type="radio" name="sex" value="0" title="男" checked="">
            		 <input type="radio" name="sex" value="1" title="女">
            	</c:if>
               <c:if test="${requestScope.operator.sex == 1}">
               		<input type="radio" name="sex" value="0" title="男" >
               		<input type="radio" name="sex" value="1" title="女" checked="">
               </c:if>
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                    <input value="${requestScope.operator.tel}" type="tel" name="tel" lay-verify="phone" autocomplete="off" class="layui-input">
                </div>
            </div>
            </div>
            
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
            	<c:if test="${requestScope.operator.status != 1}">
            		 <input type="radio" name="status" value="0" title="在职" checked="">
            		 <input type="radio" name="status" value="1" title="离职">
            	</c:if>
               <c:if test="${requestScope.operator.status == 1}">
               		<input type="radio" name="status" value="0" title="在职" >
               		<input type="radio" name="status" value="1" title="离职" checked="">
               </c:if>
            </div>
        </div>
        
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <textarea name="comments"  placeholder="请输入内容" class="layui-textarea">${requestScope.operator.comments}</textarea>
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
            	nike: function(value) {
                    if (value.length < 3) {
                        return '昵称至少得3个字符啊'
                    }
                },
                name: function(value){
                	if (value.length < 2) {
                        return '名字至少得2个字符啊'
                    }
                },
  //              pass: [/(.+){6,12}$/, '密码必须6到12位'],
  //              content: function(value) {
   //                 layedit.sync(editIndex);
   //             }
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
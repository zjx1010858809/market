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
</head>

<body>
    <form class="layui-form" action="" >
    	<c:if test="${requestScope.product.id != null}">
				<input style="display:none" class="inputinput" name="id" value="${requestScope.product.id}">
		</c:if>
        <div class="layui-form-item">
            <label class="layui-form-label">全名</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.fullname}" type="text" name="fullname" lay-verify="fullname" autocomplete="off" placeholder="请输全名（大于2字符）" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block">
                <select name="type_id" lay-filter="aihao">
			       <c:forEach items="${requestScope.type}" var="r">
            			<c:if test="${requestScope.product.type_id == r.id}">
            		 		   <option value="${ r.id}" selected="">${r.name}</option>
            			</c:if>
            			<c:if test="${requestScope.product.type_id != r.id}">
            		 		   <option value="${ r.id}" >${r.name}</option>
            			</c:if>
            		</c:forEach>
      			</select>
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">活动</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.activity}" type="text" name="activity" lay-verify="activity" autocomplete="off" placeholder="请输活动（大于2字符）" class="layui-input">
            </div>
        </div>
        
         <div class="layui-form-item">
            <label class="layui-form-label">提示信息</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.tip}" type="text" name="tip" lay-verify="tip" autocomplete="off" placeholder="请输入提示信息（大于2字符）" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">促销信息</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.sale}" type="text" name="sale" lay-verify="sale" autocomplete="off" placeholder="请输入促销信息（大于2字符）" class="layui-input">
            </div>
        </div>
        
         <div class="layui-form-item">
            <label class="layui-form-label">商品详情</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.info}" type="text" name="info" lay-verify="info" autocomplete="off" placeholder="请输入商品详情（大于2字符）" class="layui-input">
            </div>
        </div>
        
          <div class="layui-form-item">
            <label class="layui-form-label">原价格</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.price}" type="number" name="price" lay-verify="price" autocomplete="off" placeholder="请输入原价格" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">现价格</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.nowprice}" type="number" name="nowprice" lay-verify="nowprice" autocomplete="off" placeholder="请输入现价格" class="layui-input">
            </div>
        </div>
        
        
        <div class="layui-form-item">
            <label class="layui-form-label">销售数</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.salecount}" type="number" name="salecount" lay-verify="salecount" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        
         <div class="layui-form-item">
            <label class="layui-form-label">收藏数</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.collectcount}" type="number" name="collectcount" lay-verify="collectcount" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">优先级</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.priority}" type="number" name="priority" lay-verify="priority" autocomplete="off" placeholder="请输入优先级" class="layui-input">
            </div>
        </div>
        
         <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
            	<c:if test="${requestScope.product.status != 1}">
            		 <input type="radio" name="status" value="0" title="有货" checked="">
            		 <input type="radio" name="status" value="1" title="无货">
            	</c:if>
               <c:if test="${requestScope.product.status == 1}">
               		<input type="radio" name="status" value="0" title="有货" >
               		<input type="radio" name="status" value="1" title="无货" checked="">
               </c:if>
            </div>
        </div>
        
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <textarea name="comments"  placeholder="请输入内容" class="layui-textarea">${requestScope.product.comments}</textarea>
            </div>
        </div>       
         
        
        <div class="layui-form-item">
         <div class="layui-input-block">
        	<div class="picList"  name="pics"  width="300"  height="200+" rows="2" cols="5" >
					<c:forEach items="${requestScope.product.piclist}" var="p">
					<item url="${p}" >
					</c:forEach>
				</div>
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
            	fullname: function(value) {
                    if (value.length < 2) {
                        return '全名至少得2个字符啊'
                    }
                },
                activity: function(value){
                	if (value.length < 2) {
                        return '活动至少得2个字符啊'
                    }
                },
                tip: function(value){
                	if (value.length < 2) {
                        return '提示至少得2个字符啊'
                    }
                },
                sale: function(value){
                	if (value.length < 2) {
                        return '促销至少得2个字符啊'
                    }
                },
                info:function(value){
                	if (value.length < 2) {
                        return '详情至少得2个字符啊'
                    }
                },
                price:function(value){
                	if (value < 0 || value.length < 1) {
                        return '不能为空和负数'
                    }
                },
                nowprice:function(value){
                	if (value < 0 || value.length < 1) {
                        return '不能为空和负数'
                    }
                },
                priority:function(value){
                	if ( value.length < 1) {
                        return '不能为空'
                    }
                },
            });

            //监听提交
            form.on('submit(demo1)', function(data) {
            	var pics='';
            	$("input[name='pics']").each(function(j,item){
            		if(item.value != '')
            	     pics +=item.value+",";
            	});
            	if(pics !=''){
            		pics=pics.substring(0,pics.length-1);
            	}
            	alert(pics);
            	
            	save(data.field,pics);
                return false;
            });
            
            
        });
        
        function save(data,pics) {
			$.post("save?pics="+pics,data,function(json){
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
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
	<script type="text/javascript" charset="utf-8" src="../utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	
</head>

<body>
    <form class="layui-form" action="" style="margin-top:20px; overflow:auto"  >
    	<c:if test="${requestScope.product.id != null}">
				<input style="display:none" id="prodectid" class="inputinput" name="id" value="${requestScope.product.id}">
		</c:if>
		<input style="display:none" id="selectinput" name="type_id" value="1">
        <div class="layui-form-item">
            <label class="layui-form-label">全名</label>
            <div class="layui-input-block">
                <input value="${requestScope.product.fullname}" type="text" name="fullname" lay-verify="fullname" autocomplete="off" placeholder="请输全名（大于2字符）" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>         
             <div class="layui-input-inline">
                <select id="sel"  lay-filter="aihao">
			     
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
               <!--  <div id="editor" name="info" >${requestScope.product.info}</div>-->
                <div class="field">      
          			<script id="editor" type="text/plain" style="width:1000px;height:500px;"></script>   
           			<script type="text/javascript">
           			var ue = UE.getEditor('editor');
           			ue.ready(function() {
        	   		 ue.setContent('${ requestScope.product.info }');
        			});
         		</script>
          <div class="tips"></div>
        </div>
               
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
                <input  value="${requestScope.product.salecount}" onfocus="this.blur();" name="salecount" lay-verify="salecount" autocomplete="off" placeholder="请输入标题" class="layui-input layui-disabled" >
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
					<%-- <img alt="" src="${p}"> --%>
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
     <script type="text/javascript" src="../plugins/wangEditor/wangEditor.min.js"></script>
    
    <script src="../plugins/layui/layui.js"></script>
   
    <script>
   
        layui.use(['form', 'layedit', 'laydate','layer'], function() {
            var form = layui.form,
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate;
			
            var types = ${requestScope.types}
            var typeid= 1;
            var typess = ${requestScope.newtype}
            var typeg = "${requestScope.typeg}"
           
            if($("#prodectid").length==0){
            	 for(var i =0;i<types.length;i++){
 	            	$("#sel").prepend("<option index='"+i+"' value='"+types[i].id+"' parentid='0'>"+types[i].name+"</option>")
 	            	form.render('select'); 
 	            	$("#selectinput").val(1)
 	         }
            }else{
            	var typegs = typeg.split(",")
            
            	for(var j =0 ;j<typegs.length;j++){
            		if(j==0){
            			for(var i =0;i<typess[typegs[j]].length;i++){
            				if(typess[typegs[j]][i].id==typegs[0]){
            					$("#sel").prepend("<option selected='selected' index='"+i+"' value='"+typess[typegs[j]][i].id+"' parentid='0'>"+typess[typegs[j]][i].name+"</option>")
            				}else
         	            	$("#sel").prepend("<option index='"+i+"' value='"+typess[typegs[j]][i].id+"' parentid='0'>"+typess[typegs[j]][i].name+"</option>")
         	            	form.render('select'); 
         	         	}
            		}else{
            			var s =$("#sel").parent()
            			s.after("<div class='layui-input-inline'></div>");
                 		var s1=s.next();
                 		s1.append("<select name='type_id' lay-filter='aihao'></select>")
                 		var s2 = s1.children();
                 		for(var i =0;i<typess[typegs[j]].length;i++){
                 			if(typess[typegs[j]][i].id==types[j]){
                 				s2.prepend("<option selected='selected' index='"+i+"' value='"+typess[typegs[j]][i].id+"' parentid='0'>"+typess[typegs[j]][i].name+"</option>")
            				}else
            					s2.prepend("<option index='"+i+"' value='"+typess[typegs[j]][i].id+"' parentid='0'>"+typess[typegs[j]][i].name+"</option>")
         	            	
                        	form.render('select'); 
                        }
            		}
            	}
            }
            
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
            	
            	save(data.field,pics);
                return false;
            });
            
           
            
            form.on('select(aihao)', function (data) {
            	typeid=data.value;
            	$("#selectinput").val(typeid)
            	var s =$(event.target).parent().parent().parent()
            	s.nextAll().remove();
            	$.post("selecttypes?id="+data.value,"",function(json){
            		if(json.length>0){
            			typeid = json[0].id
                 		s.after("<div class='layui-input-inline'></div>");
                 		var s1=s.next();
                 		s1.append("<select name='type_id' lay-filter='aihao'></select>")
                 		var s2 = s1.children();
                 		for(var i =0;i<json.length;i++){
                        	s2.prepend("<option index='"+i+"' value='"+json[i].id+"' parentid='0'>"+json[i].name+"</option>")
                        	form.render('select'); 
                        }
                 		$("#selectinput").val(typeid)
            		}
            	},"json")
            	form.render('select'); 
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
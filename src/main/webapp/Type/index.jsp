<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../model/list_header.jsp" %>
<%@ include file="../model/product.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all">  
	<link rel="stylesheet" href="../build/css/doc.css" media="all">
	<link rel="stylesheet" type="text/css" href="../plugins/layui/css/layui.css" media="all"> 
	<script type="text/javascript" src="../src/js/jquery-3.3.1.min.js"></script>
	
<style>  
.panel {  
    margin-bottom: 0;  
}  
 i{  
    
    cursor: pointer !important ;   
    cursor: hand !important;  
 }   
 body{  
  
 }  
  
  a:hover{  
    background-color:#E6E6E6 ;  
 }   
  
.active{  
    background:#E6E6E6;  
}  
.hide{  
    display:none;  
}  
.layui-table-cell {
            height: auto;
            line-height: 45px;
        }
.layui-table-cell {
            height: 50px;    
        }

</style>

</head>
<body>
	<div style="height:70%;width:19%;position: relative;float: left;margin-top: 14px;" >  
		<div class="panel panel-default" style="border:solid black 1px; position:fixed;   width: 250px; height:450px;   overflow:auto;">  
			<div class="panel-body"  style=" ">  
                 <button class="layui-btn layui-btn-fluid">分类管理</button> 
                 <ul unselectable="on" id="demo"  style="margin-top: 30px; -moz-user-select: none; -webkit-user-select: none;"  onselectstart="return false;"  ></ul>                        
                 <button  id="addcate" class="layui-btn  layui-btn-primary"  style="margin-bottom:10px;bormargin-top:20px; margin-left:28px; width:70%;">添加主分类</button>  
            </div>  
		</div>  
    </div >
    
    <div style="width:76%;position: relative;float:right;margin-right: 10px;margin-top: -10px;">
    	<div class="demoTable">
		<div class="layui-form" >
		    <div class="layui-form-item" > 	 	
	         
	        </div>
     	</div>
	</div>	
    <table class="layui-table" id="userList" lay-filter="userList"></table>		   
    </div>  
  
<script src="../plugins/layui/layui.js"></script>
<script type="text/javascript">

var table;
var form
layui.use(['jquery','layer','element','form','tree','table'],function(){  
    window.jQuery = window.$ = layui.jquery;  
    window.layer = layui.layer;  
    form  =  layui.form;  
    var elem = layui.element;  
    table =layui.table;

	var listss=eval("("+'${types}'+")");
	
	for(var i=0;i<listss.length;i++){
    	$("#demo").append("<li  pid='"+0+"' id="+listss[i].id+">"+  
                "<a ><cite>"+listss[i].name+"</cite> </a>"+  
                "</li>");  
    	if(listss[i].children != null)
    	add($("#"+listss[i].id+""),listss[i].children)
    }
	
    layui.tree({
        elem: '#demo' ,
        nodes:[]
        
    });


window.onload=function(){
	 $("i.layui-tree-branch").remove();  
     $("i.layui-tree-leaf").remove();  
     $("ul#demo").find("a").after("<i class='layui-icon add select hide ' )'></i>"+  
             "<i class='layui-icon edit select hide'></i>");  
             //"<i class='layui-icon del select hide'></i>"
	}

//添加顶级分类  
$("#addcate").on("click",function(){  
    layer.prompt({title: '输入分类名称，并确认', formType:0}, function(text, index){  
          layer.close(index);  
       //TODO 可以ajax到后台操作，这里只做模拟  
       layer.load(2);  
       setTimeout(function(){     
       layer.closeAll("loading");  
       var myid;
       $.post("save?parentid=0&name="+text,"",function(json){
    	   myid=json.c;
       },"json")
       //删除
        $("ul#demo").append("<li  pid='0' id="+myid+">"+  
                           "<a ><cite>"+text+"</cite> </a>"+  
                           "<i class='layui-icon select hide add'></i>"+  
                           "<i class='layui-icon edit select hide'></i>"+  
                           "</li>");  
       },1000)  
        });   
})  
  
//显示/隐藏 分类的操作栏  
$("ul#demo").on({  
mouseover: function(event) {  
  event.stopPropagation();  
  
  $(this).children(".select").removeClass("hide")  
},  
  
mouseout: function(event) {   
 event.stopPropagation();   
 $(this).children(".select").addClass("hide")  
},   

},"li","a")  

$("cite").on("click",function(){
	$('#userList tbody').empty();
	var tableIns = table.render({
	       elem: '#userList',
	       url : 'selectall?id='+$(event.target).parent().parent().attr("id"),
	       cellMinWidth: 100,
	       height:450,
	       page : true,
	       limits : [5,10,25,20],
	       limit : 5,
	       id : "testReload",
	       cols : [[
	    	   {field: 'pics', title: '图片', align:'center',templet:function(d){
	               return "<img src="+d.pic+" style='width:30px;height:45px' />";
	           }},
	           {field: 'fullname', title: '全名' ,align:"center"},
	           {field: 'type_name', title: '类型',  align:'center'},
	           {field: 'activity', title: '活动',align:'center'},
	          
	           {field: 'tip', title: '提示信息',align:'center'},
	           {field: 'sale', title: '促销信息',align:'center'},
	           {field: 'info', title: '商品详情', align:'center'},
	           {field: 'price', title: '原价格', align:'center'},
	           {field: 'nowprice', title: '现价格', align:'center'},
	           {field: 'salecount', title: '销售数', align:'center'},
	           {field: 'collectcount', title: '收藏数', align:'center'},
	           {field: 'priority', title: '优先级', align:'center'},
	           {field: 'status', title: '状态', align:'center',templet:function(d){
	               return  d.statuss;
	           }},
	           {field: 'comments', title: '备注', align:'center'},
//	           {field: '', title: '功能一', align:'center',templet:function(d){
//	           	 return "<button class='layui-btn layui-btn-normal' onclick='openwina("+d.id+")' >修改</button>";
//	           }},
	       ]]
	}); 
})

//添加子分类  
$("ul#demo ").on("click","li .add",function(){  
  
 var pid = $(this).closest("li").attr("id");//将父级类目的id作为父类id  
 var that= $(this).closest("li");  
layer.prompt({title: '输入子分类名称，并确认', formType:0}, function(text, index){  
      layer.close(index);  
        var myid;
       $.post("save?parentid="+pid+"&name="+text,"",function(json){
    	   myid=json.c;
       },"json")
       layer.load(2);  
       setTimeout(function(){     
       layer.closeAll("loading");    
       if(that.children("ul").length == 0){  
                     //表示要新增   i 以及 ul 标签  ////删除
                     that.prepend('<i class="layui-icon layui-tree-spread"></i>')  
                     that.append("<ul class='layui-show'><li  pid="+pid+"   id="+myid+"><a    ><cite>"+text+"</cite> </a><i  class='layui-icon select hide add' )'></i> <i    class='layui-icon edit select hide'></i> </li></ul>")  
                 }else{  
                    that.children("ul").append("<li pid="+pid+"    id="+myid+"><a  ><cite>"+text+"</cite> </a><i  class='layui-icon select hide add' )'></i> <i    class='layui-icon edit select hide'></i> </li>");  
                 }  
       },1000)  
        });     

          
})  
//重命名  
$("ul#demo ").on("click","li .edit",function(){  
var node=$(this).parent().children("a").children("cite");  
var pid=$(this).parent().attr("pid")  
var id=$(this).parent().attr("id") 
var that= $(this).closest("li");  
layer.prompt({title: '输入新的分类名称，并确认',value:node.text(), formType:0}, function(text, index){  
      layer.close(index);  
      $.post("save?parentid="+pid+"&name="+text+"&id="+id,"",function(json){
   	   myid=json.c;
      },"json")
       layer.load(2);  
       setTimeout(function(){     
       layer.closeAll("loading");  
        node.text(text);  
       },1000)  
        });   
        
      
})  

//打开/关闭菜单  
  
$("ul#demo").on({  
click:function(event){  
    event.stopPropagation();  
    event.preventDefault();  
    if( $(this).parent().children("ul").hasClass("layui-show")){        
          $(this).html("");  
          $(this).parent().children("ul").removeClass("layui-show");  
          return;  
    }else{              
     	$(this).html("");  
     	$(this).parent().children("ul").addClass("layui-show");   
    	return;  
    }   
   return;  
}     
},  'i.layui-tree-spread');    

 /*       
删除分类  
$("ul#demo ").on("click","li .del",function(){  
      
      var that= $(this).closest("li");  
    if(that.children("ul").length > 0){  
        layer.msg("该分类下含有子分类不能删除")  
        return;  
    }  
   var id=$(this).parent().attr("id")  
  
 layer.confirm('确定要删除？该分类下的课程亦将删除！', {  
  btn: ['删除','取消']   
}, function(){  
      
         //TODO 可以ajax到后台操作，这里只做模拟  
          layer.load(2);  
          setTimeout(function(){     
           layer.closeAll("loading");  
            if((that.parent("ul").children("li").length == 1)&&(that.parent("ul").parent("li").children("i.layui-tree-spread").length=1)){  
                   //要把分类名前的三角符号和ul标签删除  
                    that.parent("ul").parent("li").children("i.layui-tree-spread").remove();             
               }  
              that.remove()  
           },1000)  
            });   
  
  
})  
*/  
   
   getshu(0);
   
   var category = 0;
   var categoryName = '';  
   
   form.on('select(test)', function (data) {
       category = data.value;
       getshu(category);
       form.render('select'); 
   });   

   var tableIns = table.render({
       elem: '#userList',
       url : '../Product/select',
       cellMinWidth: 100,
       height:450,
       page : true,
       limits : [5,10,25,20],
       limit : 5,
       id : "testReload",
       cols : [[
    	   {field: 'pics', title: '图片', align:'center',templet:function(d){
               return "<img src="+d.pic+" style='width:30px;height:45px' />";
           }},
           {field: 'fullname', title: '全名' ,align:"center"},
           {field: 'type_name', title: '类型',  align:'center'},
           {field: 'activity', title: '活动',align:'center'},
          
           {field: 'tip', title: '提示信息',align:'center'},
           {field: 'sale', title: '促销信息',align:'center'},
           {field: 'info', title: '商品详情', align:'center'},
           {field: 'price', title: '原价格', align:'center'},
           {field: 'nowprice', title: '现价格', align:'center'},
           {field: 'salecount', title: '销售数', align:'center'},
           {field: 'collectcount', title: '收藏数', align:'center'},
           {field: 'priority', title: '优先级', align:'center'},
           {field: 'status', title: '状态', align:'center',templet:function(d){
               return  d.statuss;
           }},
           {field: 'comments', title: '备注', align:'center'},
          
//           {field: '', title: '功能一', align:'center',templet:function(d){
//           	 return "<button class='layui-btn layui-btn-normal' onclick='openwina("+d.id+")' >修改</button>";
//           }},
       ]]
}); 
});

	function add(f,k) {
		for(var i=0;i<k.length;i++){
			if(f.children("ul").length == 0){  
                //表示要新增   i 以及 ul 标签  
                f.prepend('<i class="layui-icon layui-tree-spread"></i>')  
                f.append("<ul class='layui-show'><li  pid="+f.attr("id")+"   id="+k[i].id+"><a    ><cite>"+k[i].name+"</cite> </a>")  
            }else{  
               f.children("ul").append("<li pid="+f.attr("id")+"    id="+k[i].id+"><a  ><cite>"+k[i].name+"</cite> </a>");  
            }  
			
			if(k[i].children != null){
				add($("#"+k[i].id+""),k[i].children)
			}
		}
	
		
	}
	
	function getshu(select){
    	$("#as").empty();
    	$("#as").append("<option></option>");
    	if(select == 0){
    	 	$.ajax({
        		type:'Get',
        		sasync:false,
        		url:'../Product/selectname',
        		success:function(date){
        			for(var i=0;i<date.length;i++){
        				$("#as").append("<option value='"+date[i].id+"'>"+date[i].name+"</option>")
        				form.render('select')
        			}
        		},
        		datatype:'json'
        	});
    	}
    }
	
	
	
	
</script>
</body>

</html>

<%@ page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>KIT ADMIN</title>
  <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="src/css/app.css" media="all" />
  <link rel="stylesheet" href="src/css/themes/default.css" media="all" id="skin" kit-skin />
	<style type="text/css">
		body .aux-self{padding: 20px;}
		body .aux-self .layui-input-block{float: left;margin-left: 0;}
		body .aux-self .layui-form-label{width: 90px;}
		.aux-self-word{padding: 8px 10px;float: left; margin-left: 20px; border: 1px solid #e6e6e6;width: 220px;color: #ff1010;
    		display: none;}
		
	</style>
	<script type="text/javascript" src="src/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="fileupload/js/piclist.js"></script>
	<script type="text/javascript">
		var login2 = "${requestScope.login}"+"d";
		if(login2 == "logind"){
			window.location.href="login.jsp";
		}
	</script>
</head>

<body class="kit-theme">
  <div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
      <div class="layui-logo">购物商场后台</div>
      <div class="layui-logo kit-logo-mobile">K</div>
      <ul class="layui-nav layui-layout-right kit-nav">
        <li class="layui-nav-item">
          <a href="javascript:;">
            <i class="layui-icon">&#xe63f;</i> 皮肤
          </a>
          <dl class="layui-nav-child skin">
            <dd><a href="javascript:;" data-skin="default" style="color:#393D49;"><i class="layui-icon">&#xe658;</i> 默认</a></dd>
            <dd><a href="javascript:;" data-skin="orange" style="color:#ff6700;"><i class="layui-icon">&#xe658;</i> 橘子橙</a></dd>
            <dd><a href="javascript:;" data-skin="green" style="color:#00a65a;"><i class="layui-icon">&#xe658;</i> 原谅绿</a></dd>
            <dd><a href="javascript:;" data-skin="pink" style="color:#FA6086;"><i class="layui-icon">&#xe658;</i> 少女粉</a></dd>
            <dd><a href="javascript:;" data-skin="blue.1" style="color:#00c0ef;"><i class="layui-icon">&#xe658;</i> 天空蓝</a></dd>
            <dd><a href="javascript:;" data-skin="red" style="color:#dd4b39;"><i class="layui-icon">&#xe658;</i> 枫叶红</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">
            <img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img"> Van
          </a>
          <dl class="layui-nav-child">
            <dd><a id="asd" data-options="{icon:'&#xe658;'}"><span>修改密码</span></a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black kit-side" >
      <div class="layui-side-scroll">
        <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test" lay-shrink="all">

		  <li class="layui-nav-item ">
		    <a class="mainbutton" href="javascript:;">基本管理</a>
		    <dl class="layui-nav-child">
		    <c:if test="${sessionScope.user.power == 0}">
              <dd>
                <a href="javascript:;" data-url="Operator/index" data-icon="fa-user" data-title="操作员" kit-target data-id='1'><i class="fa fa-user" aria-hidden="true"></i><span> 操作员</span></a>
              </dd>
             </c:if>
              <dd>
                <a href="javascript:;" data-url="Type/index" data-icon="&#xe628;" data-title="类型管理" kit-target data-id='2'><i class="layui-icon">&#xe628;</i><span>类型管理</span></a>
              </dd>
              <dd>
                <a href="javascript:;" data-url="Product/index" data-icon="&#xe614;" data-title="商品" kit-target data-id='3'><i class="layui-icon">&#xe614;</i><span>商品</span></a>
              </dd>
               <dd>
                <a href="javascript:;" data-url="Orders/index" data-icon="&#xe614;" data-title="订单" kit-target data-id='4'><i class="layui-icon">&#xe614;</i><span>订单</span></a>
              </dd>
              <dd>
                <a href="javascript:;" data-url="Shopcar/index" data-icon="&#xe614;" data-title="购物车" kit-target data-id='5'><i class="layui-icon">&#xe614;</i><span>购物车</span></a>
              </dd>
		    </dl>
		  </li>
		 
			</ul>
      </div>
    </div>
    <div class="layui-body" id="container">
      <!-- 内容主体区域 -->
      <div style="padding: 15px;"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63e;</i> 请稍等...</div>
    </div>
    
        <!--修改密码-->
    <div class="modify-pwd-layer aux-self" id="modifypwdlayer" style="display: none">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">原密码</label>
                <div class="layui-input-block">
                    <input lay-verify="mopwd" name="mopwd" id="mopwd" type="password"  autofocus placeholder="请输入原密码" autocomplete="off" class="layui-input">
                </div>
                <div id="mopwd-aux" class="aux-self-word"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-block">
                    <input lay-verify="newpwd1" id="newpwd1" type="password" name="title"    placeholder="请输入原密码" autocomplete="off" class="layui-input">
                </div>
                <div id="newpwd1-aux" class="aux-self-word"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">再次输入</label>
                <div class="layui-input-block">
                    <input lay-verify="newpwd2" id="newpwd2" type="password" name="title" required   placeholder="请输入原密码" autocomplete="off" class="layui-input">
                </div>
                <div id="newpwd2-aux" class="aux-self-word"></div>
            </div>
        </form>
    </div>
    

    <div class="layui-footer">
      <a href="#">Fzzwow</a> 
    </div>
  </div>
  <script src="plugins/layui/layui.js"></script>
  <script>
    var message;
    layui.config({
      base: 'src/js/',
      version: '1.0.1'
    }).use(['app', 'message',"form"], function() {
      var app = layui.app,
        $ = layui.jquery,
        form = layui.form,
        layer = layui.layer;
      	
      //将message设置为全局以便子页面调用
      message = layui.message;
      //主入口
      app.set({
        type: 'iframe'
      }).init();
      $('#pay').on('click', function() {
        layer.open({
          title: false,
          type: 1,
          content: '<img src="/src/images/pay.png" />',
          area: ['500px', '250px'],
          shadeClose: true
        });
      });
      $('dl.skin > dd').on('click', function() {
        var $that = $(this);
        var skin = $that.children('a').data('skin');
        switchSkin(skin);
      });
      var setSkin = function(value) {
          layui.data('kit_skin', {
            key: 'skin',
            value: value
          });
        },
        getSkinName = function() {
          return layui.data('kit_skin').skin;
        },
        switchSkin = function(value) {
          var _target = $('link[kit-skin]')[0];
          _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
          setSkin(value);

        },
        initSkin = function() {
          var skin = getSkinName();
          switchSkin(skin === undefined ? 'default' : skin);
        }();
        
        $(".layui-side").find("dd").css("display","none");
		$(".mainbutton").click(function(){
			if($(event.target).next("dl").children("dd").css("display")== "none"){
				$(".layui-side").find("dd").animate({
				height:'hide'
				 });
			$(event.target).next("dl").children("dd").animate({
				height:'show'
				});	
			}else{
				 $(".layui-side").find("dd").animate({
					height:'hide'
				 });
				
			}
		});
		
		$("#asd").on("click",function(){
			showModifyLayer()
		})
        
		
		function showModifyLayer() {
		    let index = layer.open({
		        type: 1,
		        btn: ['取消','确定'],
		        title: "修改密码",
		        area: ["500px", "320px"],
		        content: $("#modifypwdlayer"),
		        //++enter
		        success: function(layero, index){
		        	
		        },
		        cancel: function(index, layero){
		            star()
		        },
		        yes: function (index) {
		            layer.close(index);
		            star()
		        },btn2: function (index) {
		        	alertp(index)
		            return false
		        }
		    });
		}
		
		function alertp(index){
			var oldp=$("#mopwd").val();
			var newp=$("#newpwd1").val();
			var newp2=$("#newpwd2").val();
			if(newp.length<3){
				layer.alert("新密码密码不能少于3位", { icon: 5, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
			}
			else if(newp2 != newp){
				layer.alert("两次密码不一致", { icon: 5, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
			}
			else{
				var JsonData = {old:oldp , password: newp};
				$.post("alertpasseord",JsonData,function(json){
					if(json.c ==1){
						layer.alert("修改成功", { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
						layer.close(index);
						star()
					}
					else{
						layer.alert("原密码不正确", { icon: 5, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
					}
				},"json")
				
			}
		}
		
		function star(){
			$("#mopwd").val("")
            $("#mopwd-aux").css("display", "none")
            $("#newpwd1").val("")
            $("#newpwd1-aux").css("display", "none")
            $("#newpwd2").val("")
            $("#newpwd2-aux").css("display", "none")
		}


    });
  </script>
</body>

</html>
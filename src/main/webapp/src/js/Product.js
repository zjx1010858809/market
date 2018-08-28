		var form;
		var table;
        layui.use(['table','layer'], function() {
             form = layui.form,
             table = layui.table;     
            layer = layui.layer;
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
                url : 'select',
                cellMinWidth: 100,
                page : true,
                limits : [5,10,25,20],
                limit : 5,
                id : "testReload",
                cols : [[
                	 {field: '', title: '功能一', align:'center',templet:function(d){
                     	 return "<button class='layui-btn layui-btn-normal' onclick='openwina("+d.id+")' >修改</button>";
                     }},
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
                 
                  
                ]]
            });
 			
            var $ = layui.$, active = {
            	    reload: function(){
            	      var demoReload = $('#as');
            	      //执行重载
            	      table.reload('testReload', {
            	        page: {
            	          curr: 1 //重新从第 1 页开始
            	        }
            	        ,where: {
            	            txt: $("#as").val(),
            	            select:$("#sd").val()
            	        }
            	      });
            	    }
            	  };
            	  
            $('#er').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
              });
        	
        });
        
      
        
     
        function getshu(select){
        	$("#as").empty();
        	$("#as").append("<option></option>");
        	if(select == 0){
        	 	$.ajax({
	        		type:'Get',
	        		sasync:false,
	        		url:'selectname',
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
      
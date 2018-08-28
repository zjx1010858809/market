		var form;
		var table;
        layui.use(['table'], function() {
             form = layui.form,
             table = layui.table;     
            
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
                cellMinWidth: 50,
                page : true,
                limits : [5,10,25,20],
                limit : 5,
                id : "testReload",
                cols : [[
                    {field: 'code', title: '订单号' ,align:"center"},
                    {field: 'date', title: '时间',  align:'center'},
                    {field: 'dest_status', title: '状态',align:'center',templet:function(d){
                        return  d.dest_statuss;
                    }},
                   
                    {field: 'info', title: '状态文本',align:'center'},
                    {field: 'num', title: '状态数字',align:'center'},
                    {field: 'amount', title: '状态金额', align:'center'},
                    {field: 'comments', title: '备注', align:'center'},
                    {field: 'assessstatus', title: '评价', align:'center',templet:function(d){
                        return  d.assessstatuss;
                    }},
                    {field: 'salecount', title: '销售数', align:'center'},
                    {field: 'collectcount', title: '收藏数', align:'center'},
                    {field: 'priority', title: '优先级', align:'center'},
                    {field: 'status', title: '状态', align:'center',templet:function(d){
                        return  d.statuss;
                    }},
                    {field: '', title: '功能一', align:'center',templet:function(d){
                    	 return "<button class='layui-btn layui-btn-normal' onclick='openwina("+d.id+")' >修改</button>";
                    }},
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
        		$("#as").append("<option value='0'>未支付</option>")
        		$("#as").append("<option value='1'>已支付</option>")
        		$("#as").append("<option value='2'>已发货</option>")
        		$("#as").append("<option value='3'>已收货</option>")
        		$("#as").append("<option value='4'>已退货</option>")
        		$("#as").append("<option value='5'>取消</option>")
        	}
        	if(select == 1){
        		$("#as").append("<option value='0'>1天内</option>")
        		$("#as").append("<option value='1'>3天内</option>")
        		$("#as").append("<option value='2'>一周内</option>")
        		$("#as").append("<option value='3'>一月内</option>")
        	}
        }
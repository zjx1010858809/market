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
                    {field: 'user_id', title: '邮箱' ,align:"center",templet:function(d){
                        return  d.email;
                    }},
                    {field: 'product_id', title: '产品',  align:'center',templet:function(d){
                        return  d.fullname;
                    }},
                    {field: 'count', title: '数量',align:'center'},
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
	        		url:'selectuser',
	        		success:function(date){
	        			for(var i=0;i<date.length;i++){
	        				$("#as").append("<option value='"+date[i].id+"'>"+date[i].email+"</option>")
	        				form.render('select')
	        			}
	        		},
	        		datatype:'json'
	        	});
        	}
        	if(select == 1){
        		$.ajax({
	        		type:'Get',
	        		sasync:false,
	        		url:'selectproduct',
	        		success:function(date){
	        			for(var i=0;i<date.length;i++){
	        				$("#as").append("<option value='"+date[i].id+"'>"+date[i].fullname+"</option>")
	        				form.render('select')
	        			}
	        		},
	        		datatype:'json'
	        	});
        	}
        }
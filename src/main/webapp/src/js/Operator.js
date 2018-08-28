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
                    {field: 'nike', title: '昵称' ,align:"center"},
                    {field: 'password', title: '密码',  align:'center'},
                    {field: 'name', title: '姓名',align:'center'},
                    {field: 'sex', title: '性别', align:'center',templet:function(d){
                        return  d.sex == '0' ? "男":"女";
                    }},
                    {field: 'tel', title: '电话',align:'center'},
                    {field: 'statuss', title: '状态',align:'center'},
                    {field: 'comments', title: '备注', align:'center'},
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
        	 	$.ajax({
	        		type:'Get',
	        		sasync:false,
	        		url:'selectname',
	        		success:function(date){
	        			for(var i=0;i<date.length;i++){
	        				$("#as").append("<option value='"+date[i].name+"'>"+date[i].name+"</option>")
	        				form.render('select')
	        			}
	        		},
	        		datatype:'json'
	        	});
        	}
        	if(select == 1){
        		$("#as").append("<option value='0'>男</option>")
        		$("#as").append("<option value='1'>女</option>")
        	}
        }
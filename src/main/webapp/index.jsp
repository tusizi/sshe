<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>SSHE DEMO</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="jslib/jquery-easyui-1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="jslib/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jslib/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="jslib/jquery-easyui-1.4.2/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="jslib/jquery-easyui-1.4.2/themes/icon.css" type="text/css"></link>
    <script type="text/javascript" src="jslib/syUtil.js"></script>
    <script type="text/javascript">
    	$(function(){
    		
    	});
    	function regUser(){
    		/*$('#index_regForm').form('submit',{
    		    url:'${pageContext.request.contextPath}/userAction!reg.action',   
    		    success:function(r){	
    		    	var obj = jQuery.parseJSON(r);
    		    	if (obj.success){
    		    		$('#index_regDialog').dialog('close');
    		    	}
    		    	$.messager.show({
    		    		title : '提示',
    		    		msg : obj.msg,
    		    	});
    		    }
    		    
    		});*/
    		$.ajax({
    		    url:'${pageContext.request.contextPath}/userAction!reg.action',   
				data:$('#index_regForm').serialize(),
				dataType : 'json',
				success:function(obj,textStatus, jqXHR){
					
    		    	if (obj.success){
    		    		$('#index_regDialog').dialog('close');
    		    	}
    		    	$.messager.show({
    		    		title : '提示',
    		    		msg : obj.msg,
    		    	});
				}
    		});
    	}
    		
    </script>
   </head> 
  <body class="easyui-layout">
    <div data-options="region:'north'" style="height:60px;"></div>
    <div data-options="region:'south'" style="height:20px;"></div>
    <div data-options="region:'west',split:true" style="width:200px;">
    	<div class="easyui-panel" data-options="title:'ssss',border:false,fit:true"></div>
    </div>
    <div data-options="region:'east',title:'east'" style="width:200px;"></div>
    <div data-options="region:'center',title:'center'"></div>
    
   <div class="easyui-dialog" data-options="title:'登录',modal:true,closable:false,buttons:[{
				text:'注册',
				iconCls:'icon-edit',
				handler:function(){
					$('#index_regForm input').val('');
					$('#index_regDialog').dialog('open');
				}
			},{
				text:'登录',
				iconCls:'icon-help',
				handler:function(){}
			}]">
    	<table>
    		<tr>
    			<th>登录名</th>
    			<td><input /></td>
    		</tr>
    		<tr>
    			<th>密码</th>
    			<td><input /></td>
    		</tr>
    	</table>
    </div>
     <div id="index_regDialog" class="easyui-dialog" style="width:250px;" data-options="title:'注册',modal:true,closed:true,buttons:[{
				text:'注册',
				iconCls:'icon-edit',
				handler:function(){
					regUser();
	    		    }
			}]">
		<form id="index_regForm" method="post">
	    	<table>
	    		<tr>
	    			<th>登录名</th>
	    			<td><input name="name" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<th>密码</th>
	    			<td><input name="pwd" type="password" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<th>重复密码</th>
	    			<td><input name="repwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'eqPwd[\'#index_regForm input[name=pwd]\']'"/></td>
	    		</tr>
	    	</table>
    	</form>
    </div>
  </body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function(){
		$('#user_reg_regForm').form({
			url:'${pageContext.request.contextPath}/userAction!reg.action',   
		    success:function(r){	
		    	var obj = jQuery.parseJSON(r);
		    	if (obj.success){
		    		$('#user_reg_regDialog').dialog('close');
		    	}
		    	$.messager.show({
		    		title : '提示',
		    		msg : obj.msg,
		    	});
		    }
		});
		$('#user_reg_regForm input').bind('keyup', function(event){    /*增加回车提交功能*/
			  if (event.keyCode =='13'){
				  $('#user_reg_regForm').submit();
			  }
		});
	});
</script>
<div id="user_reg_regDialog" class="easyui-dialog" style="width:250px;" data-options="title:'注册',modal:true,closed:true,buttons:[{
				text:'注册',
				iconCls:'icon-edit',
				handler:function(){
						$('#user_reg_regForm').submit();
	    		    }
			}]">
		<form id="user_reg_regForm" method="post">
	    	<table>
	    		<tr>
	    			<th>登录名</th>
	    			<td><input name="name" class="easyui-validatebox" data-options="required:true,missingMessage:'登录名必填'"/></td>
	    		</tr>
	    		<tr>
	    			<th>密码</th>
	    			<td><input name="pwd" type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'密码必填'"/></td>
	    		</tr>
	    		<tr>
	    			<th>重复密码</th>
	    			<td><input name="repwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'eqPwd[\'#user_reg_regForm input[name=pwd]\']'"/></td>
	    		</tr>
	    	</table>
    	</form>
    </div>
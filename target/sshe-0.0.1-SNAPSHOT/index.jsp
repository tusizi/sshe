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
   </head> 
  <body class="easyui-layout">
    <div data-options="region:'north'" style="height:60px;"></div>
    <div data-options="region:'south'" style="height:20px;"></div>
    <div data-options="region:'west',title:'west'" style="width:200px;"></div>
    <div data-options="region:'east',title:'east'" style="width:200px;"></div>
    <div data-options="region:'center',title:'center'"></div>
    
    <div class="easyui-dialog" data-options="title:'登录',modal:true,closable:false,
    	botton[{
				text:'登录',
				iconCls:'icon-edit',
				handler:function(){}
			},{
				text:'注册',
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
  </body>
</html>

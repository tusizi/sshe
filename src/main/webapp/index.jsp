<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(function() {

	});
	function addTab(opts) {
		var t = $('#index_centerTabs');
		if (t.tabs('exists', opts.title)) {
			t.tabs('select', opts.title);
		} else {
			t.tabs('add', opts);

		}
	}
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north'" style="height:60px;"></div>
	<div data-options="region:'south'" style="height:20px;"></div>
	<div data-options="region:'west'" style="width:200px;">
		<div class="easyui-panel" data-options="title:'功能树',border:false,fit:true">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="系统菜单" data-options="iconCls:'icon-save'">
					<ul class="easyui-tree" data-options="
					url:'${pageContext.request.contextPath}/menuAction!getTreeNode.action',
					parentField:'pid',
					lines:true,
					onClick: function(node){
					//if(node.attributes.url){
						//var url = '${pageContext.request.contextPath}'+node.attributes.url;
						addTab({title:node.text,closable:true});
						//}
		 			}"></ul>
				</div>
				<div title="Title2" data-options="iconCls:'icon-reload'"></div>
			</div>
		</div>
	</div>
	<div data-options="region:'east',title:'east',split:true" style="width:200px;"></div>
	<div data-options="region:'center',title:'欢迎使用SSHE示例'">
		<div id="index_centerTabs" class="easyui-tabs" data-options="fit:true,border:false">
			<div title="首页"></div>
		</div>
	</div>

	<jsp:include page="user/login.jsp"></jsp:include>

	<jsp:include page="user/reg.jsp"></jsp:include>
</body>
</html>

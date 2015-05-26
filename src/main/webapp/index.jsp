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
</head>

<body class="easyui-layout">
	<div data-options="region:'north'" style="height:60px;"></div>
	<div data-options="region:'south'" style="height:20px;"></div>
	<div data-options="region:'west'" style="width:200px;">
		<div class="easyui-panel" data-options="title:'ssss',border:false,fit:true"></div>
	</div>
	<div data-options="region:'east',title:'east',split:true" style="width:200px;"></div>
	<div data-options="region:'center',title:'center'"></div>

	<jsp:include page="user/login.jsp"></jsp:include>

	<jsp:include page="user/reg.jsp"></jsp:include>
</body>
</html>

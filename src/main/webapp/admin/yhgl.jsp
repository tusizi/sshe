<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		$('#admin_yhgl_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/userAction!datagrid.action',
			fit:true,
			border:false,
			pagination:true,
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : 150
			}, {
				field : 'name',
				title : '登录名称',
				width : 150
			}, {
				field : 'pwd',
				title : '密码',
				width : 150
			} , {
				field : 'createtime',
				title : '创建时间',
				width : 150
			}, {
				field : 'modifytime',
				title : '最后修改时间',
				width : 150
			}] ]
		});
	});
</script>
<table id="admin_yhgl_datagrid">

</table>

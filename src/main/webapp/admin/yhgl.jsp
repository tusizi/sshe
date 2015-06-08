<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		$('#admin_yhgl_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/userAction!datagrid.action',
			fit : true,
			fitColumns : true,
			border : false,
			pagination : true,
			idField : 'id',
			pageSize : 10,
			pageList : [10, 20, 30, 40, 50 ],
			rownumbers : true,
			sortName : 'name',
			sortOrder : 'asc',
			pagePosition:'both',
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : 160,
				hidden : true
			}, {
				field : 'name',
				title : '登录名称',
				width : 160,
				sortable : true
			} ] ],
			columns : [ [ {
				field : 'pwd',
				title : '密码',
				width : 160
			}, {
				field : 'createtime',
				title : '创建时间',
				width : 160,
				sortable : true
			}, {
				field : 'modifytime',
				title : '最后修改时间',
				width : 160,
				sortable : true
			} ] ]
		});
	});
</script>
<table id="admin_yhgl_datagrid">

</table>

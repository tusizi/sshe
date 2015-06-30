<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		$('#admin_yhgl_datagrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/userAction!datagrid.action',
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : 'id',
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							rownumbers : true,
							//sortName : 'createtime',
							//sortOrder : 'asc',
							//pagePosition:'both',
							remoteSort : false,
							checkOnSelect : false,
							selectOnCheck : false,
							frozenColumns : [ [ {
								field : 'id',
								title : '编号',
								width : 160,
								checkbox : true
							}, {
								field : 'name',
								title : '登录名称',
								width : 160,
								sortable : true
							} ] ],
							columns : [ [ {
								field : 'pwd',
								title : '密码',
								width : 160,
								formatter : function(value, row, index) {
									return '******';
								}
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
							} ] ],
							toolbar : [ {
								text : '增加',
								iconCls : 'icon-add',
								handler : function() {
									append();
								}
							}, '-', {
								text : '删除',
								iconCls : 'icon-remove',
								handler : function() {
									remove();
								}
							}, '-', {
								text : '修改',
								iconCls : 'icon-edit',
								handler : function() {
									editFun();
								}
							} ]
						});
	});
	function editFun() {
		var rows = $('#admin_yhgl_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 500,
				height : 200,
				href : '${pageContext.request.contextPath}/admin/yhglEdit.jsp',
				modal : true,
				title : "用户编辑",
				buttons : [ {
					text : "编辑",
					handler : function() {
						$('#admin_yhglEdite_form').form('submit',{
						url:'${pageContext.request.contextPath}/userAction!edit.action',   
	    					success:function(r){	
	    					var obj = jQuery.parseJSON(r);
	    					if (obj.success){
	    						d.dialog('close');
	    						$('#admin_yhgl_datagrid').datagrid('updateRow',{
									index: $('#admin_yhgl_datagrid').datagrid('getRowIndex',rows[0].id),
									row: obj.obj
								});
	    					}
					    	$.messager.show({
					    		title : '提示',
					    		msg : obj.msg
										});
										}
						});
						
									}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onOpen : function() {
				},
				onLoad : function() {

					$('#admin_yhglEdite_form').form('load', rows[0]);
				}
			});
		} else {
			$.messager.alert('提示', '请选择编辑项');
		}
	}

	function searchFun() {
		$('#admin_yhgl_datagrid').datagrid('load', {
			name : $('#admin_yhgl_layout input[name=name]').val()
		});
	}
	function cleanFun() {
		$('#admin_yhgl_layout input[name=name]').val('');
		$('#admin_yhgl_datagrid').datagrid('load', {});
	}
	function append() {
		$('#admin_yhgl_addForm input').val('');
		$('#admin_yhgl_addDialog').dialog('open');
	}
	function remove() {
		var rows = $('#admin_yhgl_datagrid').datagrid('getChecked');
		//var rows = $('#admin_yhgl_datagrid').datagrid('getSelected');
		var ids = [];
		if (rows.length > 0) {
			$.messager
					.confirm(
							'确认',
							'您是否要删除这条记录?',
							function(r) {
								if (r) {
									for ( var i = 0; i < rows.length; i++) {
										ids.push(rows[i].id);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/userAction!remove.action',
												data : {
													ids : ids.join(',')
												},
												dataType : 'json',
												success : function(r) {
													$('#admin_yhgl_datagrid')
															.datagrid('load');
													$('#admin_yhgl_datagrid')
															.datagrid(
																	'unselectAll');
													$.messager.show({
														title : '提示',
														msg : r.msg
													});
												}
											});
								}
							});
		} else {
			$.messager.show({
				title : '提示',
				msg : '勾选要删除的记录！'
			});
		}
	}
</script>
<div id="admin_yhgl_layout" class="easyui-layout"
	data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false"
		style="height:100px;">
		检索用户：<input name="name" /> <a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="searchFun();">查询</a> <a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel',plain:true" onclick="cleanFun();">清空</a>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_yhgl_datagrid">
		</table>
	</div>
</div>
<div id="admin_yhgl_addDialog" class="easyui-dialog"
	data-options="closed:true,modal:true,title:'添加用户', buttons:[{
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					$('#admin_yhgl_addForm').form('submit',{
					url:'${pageContext.request.contextPath}/userAction!add.action',
					success:function(r){
					var obj = jQuery.parseJSON(r);
		    		if (obj.success){
		    		/*$('#admin_yhgl_datagrid').datagrid('load');*/
		    		/*$('#admin_yhgl_datagrid').datagrid('appendRow',obj.obj);*/
		    		$('#admin_yhgl_datagrid').datagrid('insertRow',{
						index: 0,
						row: obj.obj
					});
		    		$('#admin_yhgl_addDialog').dialog('close');
		    		}
		    		$.messager.show({
		    			title : '提示',
		    			msg : obj.msg
		    	});
					}});
				}
			}]"
	style="height:200px;width:500px;" align="center">
	<form id="admin_yhgl_addForm" method="post">
		<table>
			<tr>
				<th>编号</th>
				<td><input name="id" readonly="readonly" /></td>
				<th>登录名称</th>
				<td><input name="name" class="easyui-validatebox"
					data-options="required:true" /></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input name="pwd" type="password"
					class="easyui-validatebox" data-options="required:true" /></td>
				<th>创建时间</th>
				<td><input name="creattime" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>最后修改时间</th>
				<td><input name="modifytime" readonly="readonly" /></td>
			</tr>
		</table>
	</form>
</div>


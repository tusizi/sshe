<%@ page language="java" pageEncoding="UTF-8"%>

	<form id="admin_yhglEdite_form" method="post">
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



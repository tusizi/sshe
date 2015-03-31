package sy.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;

import sy.service.UserServiceI;

@ParentPackage("basePackage")
@Namespace("/")
@Action(value= "userAction")
public class UserAction {
	
	private static final Logger logger = Logger.getLogger(UserAction.class);
	
	private UserServiceI userService;
	
	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired         //自动注入userService方法
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
	
	public void reg(){
		String name=ServletActionContext.getRequest().getParameter("name");
		String pwd=ServletActionContext.getRequest().getParameter("pwd");
		Map<String,Object> m = new HashMap<String,Object>();
		try {
			userService.save(name,pwd);
			m.put("success", true);
			m.put("msg", "注册成功！");
			//json="{\"success\":true,\"msg\":'注册成功'}";
		} catch (Exception e) {		
			e.printStackTrace();
			m.put("success", false);
			m.put("msg", "注册失败！");

			//json="{\"success\":true,\"msg\":'注册失败'}";
		}
		
		try {
			//ServletActionContext.getResponse().setCharacterEncoding("text/html;charset=utf-8");
			ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
			ServletActionContext.getResponse().getWriter().write(JSON.toJSONString(m));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

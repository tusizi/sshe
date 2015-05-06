package sy.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import sy.pageModel.User;
import sy.service.UserServiceI;

import com.opensymphony.xwork2.ModelDriven;


@Namespace("/")
@Action(value= "userAction")
public class UserAction extends BaseAction implements ModelDriven<User> {
	
	 private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	
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
		
		Map<String,Object> m = new HashMap<String,Object>();
		try {
			userService.save(user);
			m.put("success", true);
			m.put("msg", "注册成功！");
			//json="{\"success\":true,\"msg\":'注册成功'}";
		} catch (Exception e) {		
			e.printStackTrace();
			m.put("success", false);
			m.put("msg", e.getMessage());

			//json="{\"success\":true,\"msg\":'注册失败'}";
		}
		
		super.writeJson(m);
		
	}
	
	public void login(){
		userService.login(user);
	}

	
}

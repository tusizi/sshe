package sy.test;

import java.util.Date;
import java.util.UUID;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import sy.model.Tuser;
import sy.service.UserServiceI;

public class TestHibernate {
	
	@Test
	public void test(){
		
//		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"classpath:spring.xml","classpath:spring-hibernate.xml"});
//		UserServiceI userService = (UserServiceI) ac.getBean("userService");
//		User user=new User();
//		user.setId(UUID.randomUUID().toString());//随机id
//		user.setName("孙宇");
//		user.setPwd("12345");
//		user.setCreatetime(new Date());	
//		userService.save(user);
		
	}
}

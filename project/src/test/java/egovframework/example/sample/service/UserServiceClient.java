package egovframework.example.sample.service;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import egovframework.sample.service.impl.UserServiceImpl;

public class UserServiceClient {

	public static void main(String[] args) throws Exception{
		AbstractApplicationContext container = new GenericXmlApplicationContext(
				"sqlmap/spring/context-common.xml");
		
		UserServiceImpl userService = (UserServiceImpl) container.getBean("userService");
		userService.selectUser(null);
		userService.selectUserList(null);
		
		container.close();

	}

}

package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.sample.service.UserDAO;
import egovframework.sample.service.UserVO;

@Repository("userdaoMyBatis")
public class UserDAOMyBatis implements UserDAO{
	
    @Resource(name="userMapper")
	private UserMapper mybatis;
    
	public UserDAOMyBatis() {
		System.out.println("==>UserDAOMyBatis 생성");
	}
    
	public void insertUser(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 insertUser() 기능 처리");
		mybatis.insertUser(vo);		
	}

	public void updateUser(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 updateUser() 기능 처리");
		mybatis.updateUser(vo);
		
	}

	
	public void deleteUser(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 deleteUser() 기능 처리");
		mybatis.deleteUser(vo);
		
	}

	
	public UserVO selectUser(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 selectUser() 기능 처리");
		return (UserVO) mybatis.selectUser(vo);
	}
	
	public List<UserVO> selectUserList(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 selectUserList() 기능 처리");
		return mybatis.selectUserList(vo);
	}

	
	public UserVO loginUser(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 loginUser() 기능 처리");
		return (UserVO) mybatis.loginUser(vo);
	}

	
	public String findUserIdByUsername(String user_nm) throws Exception {
		System.out.println("==>UserDAOMyBatis로 findUserIdByUsername() 기능 처리");
		return mybatis.findUserIdByUsername(user_nm);
	}
	
	public String findPwdByUserId(String user_nm, String user_id, String eml) throws Exception {
		System.out.println("==>UserDAOMyBatis로 findPwdByUserId() 기능 처리");
		return mybatis.findPwdByUserId(user_nm, user_id, eml);
	}

	public int checkDuplicateUserId(String user_id) throws Exception {
		System.out.println("==>UserDAOMyBatis로 checkDuplicateUserId() 기능 처리");
		return mybatis.checkDuplicateUserId(user_id);
	    
	}

	public UserVO getUserByUserId(String user_id) throws Exception {
		System.out.println("==>UserDAOMyBatis로 getUserByUserId() 기능 처리");
		return mybatis.getUserByUserId(user_id);
	}

	
	public boolean verifyEmail(String user_id, String verificationCode) throws Exception {
		System.out.println("==>UserDAOMyBatis로 verifyEmail() 기능 처리2");
		return mybatis.verifyEmail(user_id, verificationCode);
	}

	public UserVO getUserById(String user_id) throws Exception {
		System.out.println("==>UserDAOMyBatis로 getUserByUserId() 기능 처리");
		return mybatis.getUserById(user_id);
	}

	public void updateUserInfo(UserVO vo) throws Exception {
		System.out.println("==>UserDAOMyBatis로 updateUserInfo() 기능 처리");
		mybatis.updateUserInfo(vo);
		
	}

	@Override
	public void updateUserPw(UserVO vo, String id) throws Exception {
		System.out.println("==>UserDAOMyBatis로 updateUserPw() 기능 처리");
		mybatis.updateUserPw(vo,id);
			
	}


	
	
}

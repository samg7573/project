package egovframework.sample.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.service.UserVO;

@Mapper("userMapper")
public interface UserMapper {
	
	void insertUser(UserVO vo) throws Exception;

	void updateUser(UserVO vo) throws Exception;

	void deleteUser(UserVO vo) throws Exception;

	UserVO selectUser(UserVO vo) throws Exception;
	
	List<UserVO> selectUserList(UserVO vo) throws Exception;
	
	UserVO getUserByUserId(String user_id) throws Exception;
	
	UserVO getUserById(String user_id) throws Exception;

	UserVO loginUser(UserVO vo) throws Exception;

	String findUserIdByUsername(String user_nm) throws Exception;

	String findPwdByUserId(String user_nm, String user_id, String eml) throws Exception;

	int checkDuplicateUserId(String user_id) throws Exception;

	boolean verifyEmail(String user_id, String verificationCode) throws Exception;

	void updateUserInfo(UserVO vo) throws Exception;

	void updateUserPw(UserVO vo, String id) throws Exception;
}

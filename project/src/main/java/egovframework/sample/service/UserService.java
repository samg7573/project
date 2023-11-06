package egovframework.sample.service;

import java.util.List;

public interface UserService {
	/*
	 * 회원 등록 처리
	 */
	void insertUser(UserVO vo) throws Exception;
	
	/*
	 * 회원 수정
	 */
	void updateUser(UserVO vo) throws Exception;
	
	/*
	 * 회원 삭제
	 */
	void deleteUser(UserVO vo) throws Exception;

	UserVO selectUser(UserVO vo) throws Exception;
	
	
	List<UserVO> selectUserList(UserVO vo) throws Exception;

	UserVO loginUser(UserVO vo) throws Exception;
	
	/*
	 * 회원 이름으로 회원 아이디 찾기
	 */
	String findUserIdByUsername(String user_nm) throws Exception;

	/*
	 * 회원 아이디, 이름, 이메일로 회원 비밀번호 재설정
	 */
	String findPwdByUserId(String user_nm, String user_id, String eml) throws Exception;
	
	/*
	 * 중복 아이디 체크
	 */
	int checkDuplicateUserId(String user_id) throws Exception;

	UserVO getUserByUserId(String user_id) throws Exception;
	

	boolean verifyEmail(String user_id, String verificationCode) throws Exception;

	
	/*
	 * 회원정보 수정란
	 */
	void updateUserInfo(UserVO vo) throws Exception;

	UserVO getUserById(String id) throws Exception;

	void updateUserPw(UserVO vo, String id) throws Exception;
	 
}

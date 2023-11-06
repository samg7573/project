package egovframework.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.service.UserDAO;
import egovframework.sample.service.UserService;
import egovframework.sample.service.UserVO;
import egovframework.sample.service.security.PasswordEncoder;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService{
	private static final Logger LOGGER=LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Resource(name="userdaoMyBatis")
	private UserDAO userDAO;
	
	@Resource(name="egovUserIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	public UserServiceImpl() {
		System.out.println("===> UserServiceImpl 생성자");
	}

	@Override
	public void insertUser(UserVO vo) throws Exception{
		System.out.println("UserService -- User 등록");
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		String encryptedPassword = passwordEncoder.hashPassword(vo.getUser_pswd());
        vo.setUser_pswd(encryptedPassword);

		userDAO.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception{
		System.out.println("UserService -- User 수정");
		String encryptedPassword = passwordEncoder.hashPassword(vo.getUser_pswd());
        vo.setUser_pswd(encryptedPassword);
		userDAO.updateUser(vo);

	}

	@Override
	public void deleteUser(UserVO vo) throws Exception{
		System.out.println("UserService -- User 삭제");
		userDAO.deleteUser(vo);

	}

	@Override
	public UserVO selectUser(UserVO vo) throws Exception{
		System.out.println("UserService -- User 선택");
		return userDAO.selectUser(vo);
	}

	@Override
	public List<UserVO> selectUserList(UserVO vo) throws Exception{
		System.out.println("UserService -- User 목록 선택");
		return userDAO.selectUserList(vo);
	}

	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		System.out.println("UserService -- User 로그인");
	    return userDAO.loginUser(vo);
	}


	@Override
	public String findUserIdByUsername(String user_nm) throws Exception{
		System.out.println("UserService -- User 아이디 찾기");
		return userDAO.findUserIdByUsername(user_nm);
	}
	
	@Override
	public String findPwdByUserId(String user_nm, String user_id, String eml) throws Exception {
		System.out.println("UserService -- User 비밀번호 찾기");
		return userDAO.findPwdByUserId(user_nm, user_id, eml);
	}

	@Override
	public int checkDuplicateUserId(String user_id) throws Exception {
		System.out.println("UserService -- 아이디 중복 체크 하기");
		return userDAO.checkDuplicateUserId(user_id);
	}

	@Override
	public UserVO getUserByUserId(String user_id) throws Exception {
		System.out.println("UserService -- 아이디로 유저 찾기");
		return userDAO.getUserByUserId(user_id);
	}


	@Override
    public boolean verifyEmail(String user_id, String verificationCode) {
        // 이메일 인증 및 회원 가입을 한 번에 처리하는 메서드
        if (verifyEmail(user_id, verificationCode)) {
            // 인증 완료 후 회원 가입 처리
            return true;
        }
        return false;
    }

	@Override
	public UserVO getUserById(String id) throws Exception {
		System.out.println("UserService -- ID(PK)로 유저 찾기");
		return userDAO.getUserById(id);
	}

	@Override
	public void updateUserInfo(UserVO vo) throws Exception{
		System.out.println("UserService -- User 수정(password 변경 x)");
		userDAO.updateUserInfo(vo);

	}

	@Override
	public void updateUserPw(UserVO vo, String id) throws Exception {
		userDAO.updateUserPw(vo,  id);
	}

}

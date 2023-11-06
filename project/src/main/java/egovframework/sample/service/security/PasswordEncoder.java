package egovframework.sample.service.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class PasswordEncoder {
	public static String hashPassword(String password) {
        try {
            // MessageDigest 객체 생성
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // 비밀번호를 바이트 배열로 변환하여 해시 함수에 적용
            byte[] encodedBytes = digest.digest(password.getBytes());

            // 해시 값을 16진수 문자열로 변환
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean authenticate(String inputPassword, String storedHashedPassword) {
        String inputHashedPassword = hashPassword(inputPassword);
        return inputHashedPassword.equals(storedHashedPassword);
    }
}

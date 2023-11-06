package egovframework.sample.service.security;

import java.util.Random;

public class PasswordGenerator {
	 public static String generateRandomCode(int length) {
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        Random random = new Random();
	        StringBuilder code = new StringBuilder();

	        for (int i = 0; i < length; i++) {
	            int index = random.nextInt(characters.length());
	            code.append(characters.charAt(index));
	        }

	        return code.toString();
	    }
}

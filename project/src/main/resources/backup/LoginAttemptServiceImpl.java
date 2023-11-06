package egovframework.sample.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.sample.service.LoginAttemptService;

@Service
public class LoginAttemptServiceImpl implements LoginAttemptService {

    private static final int MAX_LOGIN_ATTEMPTS = 3;
    private Map<String, Integer> loginAttempts = new HashMap<>();
    
    @Override
    public void incrementLoginAttempts(String userId) {
        int attempts = loginAttempts.getOrDefault(userId, 0);
        attempts++;
        loginAttempts.put(userId, attempts);
    }

    @Override
    public void resetLoginAttempts(String userId) {
        loginAttempts.remove(userId);
    }

    @Override
    public boolean isAccountLocked(String name) {
        return loginAttempts.getOrDefault(name, 0) >= MAX_LOGIN_ATTEMPTS;
    }
}

package egovframework.sample.service;

public interface LoginAttemptService {
    void incrementLoginAttempts(String userId);
    
    void resetLoginAttempts(String userId);

	boolean isAccountLocked(String name);
}
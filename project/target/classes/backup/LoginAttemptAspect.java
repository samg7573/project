package egovframework.sample.service.security;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.sample.service.LoginAttemptService;

@Aspect
@Component
public class LoginAttemptAspect {

    @Autowired
    private LoginAttemptService loginAttemptService;

    @Before("execution(* your.package.name.UserService.authenticate(..)) && args(userId, ..)")
    public void beforeAuthenticate(String userId) {
        loginAttemptService.incrementLoginAttempts(userId);
    }

    @AfterReturning("execution(* your.package.name.UserService.authenticate(..)) && args(userId, ..)")
    public void afterAuthenticateSuccess(String userId) {
        loginAttemptService.resetLoginAttempts(userId);
    }
}


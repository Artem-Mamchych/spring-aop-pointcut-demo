package com.aop.demo;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TestAspect {

    @Around("execution(* com.mvc.demo.HomeController.*(..))")
    public Object aroundDoStuff(ProceedingJoinPoint pjp) throws Throwable {
        //Before:
        System.out.println("before doStuff");
        try {
            return pjp.proceed();
        } finally {
            //After:
            System.out.println("after doStuff");
        }
    }
}
package com.aop.demo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.bind.annotation.RequestMapping;

@Aspect
public class RequestMappingAspect {

    @Pointcut(value="execution(public * *(..))")
    public void anyPublicMethod() {
    }

    //Spring AOP - pointcuts every method call with annotation "@RequestMapping"
    //TODO: @RequestMapping annotation should be imported or you will see "Type referred to is not an annotation type: @missing@" error.
    @Around("anyPublicMethod() && @annotation(RequestMapping)")
    public Object logAction(
        ProceedingJoinPoint pjp/*, RequestMapping requestMapping*/)
        throws Throwable {
        System.out.println(">>> [RequestMappingAspect] called: " + pjp.getSignature() + " line: " + pjp.getSourceLocation());
        return pjp.proceed();
    }
}
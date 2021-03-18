package org.dongho.common.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j
public class LogAdvice {

		
		// controller 에만 before 걸기 , JoinPoint
		@Before(value = "execution(* org.dongho..*.*Controller*.*(..))")
		public void logBeforeController(JoinPoint jp) {
			log.info("=================");
			// 메서드의 이름
			String methodName = jp.getSignature().getName();
			Object[] args = jp.getArgs();
			
			log.info(methodName);
			log.info(Arrays.toString(args));
		}
		
		
		// security를 처리하는 코드
		@Around(value = "execution(* org.dongho..*.*Service*.*(..))")
		public Object logTime(ProceedingJoinPoint pjp) {
			
			log.info(pjp.getSignature());
			// 들어오는 모든 것 기록
			log.info(Arrays.toString(pjp.getArgs()));
			log.info(pjp.getThis());
			
			// 시간체크
			long start = System.currentTimeMillis();
			
			// 실제로 실행
			Object result = null;
			try {
				result = pjp.proceed();
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			log.info("end--------------------------");
			
			long end = System.currentTimeMillis();
			
			log.info("time: " + (end - start));
			
			return result;
		}
	
}

package com.Init.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value = "/myDaily/*")
public class CalendarController {
  

    private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	//  http://localhost:8088/myDaily/main
    
    @GetMapping("/main")
    public String Calendar() {
    	  logger.debug(" /main -> mainPage() 실행");
          logger.debug(" /views/myDaily/main.jsp 뷰페이지 연결");
    	
       return "myDaily/main";
    }
	
	
    
    
    
    
    
    
	
	
}

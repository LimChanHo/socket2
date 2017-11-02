package com.iot.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	 private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	    
	    @RequestMapping(value = "/")
	    public String home() {
	        logger.info("컨트롤러 접근");
	        return "index";
	    }
	
}

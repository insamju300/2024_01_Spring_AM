package com.example.demo.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MsgTestController {
	@Autowired
	MessageSource messageSource;
	
	@RequestMapping("/test/message")
	@ResponseBody
	public String messageTest(Locale locale) {
		return messageSource.getMessage("article.id", null, locale) + locale.toString();
	}

}

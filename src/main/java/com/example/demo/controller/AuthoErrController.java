package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Controller
public class AuthoErrController {
	@RequestMapping("/usr/err/showNeedLoginError")
	@ResponseBody
	public ResultData<String> showNeedLoginError() {
		return ResultData.from("F-A", "로그인이 필요한 기능입니다.");
	}
	
	@RequestMapping("/usr/err/showNeedLogoutError")
	@ResponseBody
	public ResultData<String> showNeedLogoutError() {
		return ResultData.from("F-A", "로그아웃 후 이용해주세요.");
	}	

}

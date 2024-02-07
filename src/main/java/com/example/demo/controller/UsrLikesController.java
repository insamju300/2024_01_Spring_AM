package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.LikesService;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class UsrLikesController {
	
	@Autowired
	private LikesService likesService;
	
	@RequestMapping("/usr/likes/doToggle")
	public String doToggle(HttpServletRequest req, int id) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		System.out.println(rq.toString());
		
		boolean isLiked = likesService.isLiked(id, rq.getLoginedMemberId());
		if(isLiked) {
			likesService.deleteLikes(id, rq.getLoginedMemberId());
			return "0";

		}else {
			likesService.insertLikes(id, rq.getLoginedMemberId());
			return "1";
		}
		
	}

}

package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.vo.ReactionPoint;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class UsrReactionPointController {
	
	@Autowired
	ReactionPointService reactionPointService;
	
//	@RequestMapping("/usr/reactPoint/doLike")
//	//public ResultData<ReactionPoint> doLike(HttpServletRequest req, int relId, String relTypeCode) {
//		Rq rq = (Rq) req.getAttribute("rq");
//		if(!rq.isLogined()) {
//			return ResultData.from("F-A", "로그인 후 이용할 수 있습니다.");
//		}
//		ReactionPoint reactionPoint = reactionPointService.getReactionPointByMemberIdAndRelId(rq.getLoginedMemberId(), relId, relTypeCode);
//		
//		if(reactionPoint == null) {
//			//인서트 처리
//            //reactionPointService.insertReactionPoint(new ReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId, 1));
//		}else if(reactionPoint.getPoint() == 1) {
//			//에러 처리
//			return ResultData.from("F-1", "이미 '좋아요' 상태 입니다.");
//		}else {
//			//업데이트 처리
//		}
//			
//		//갯수 가져올 것
//
//		//리턴할 것
//		
//	}
	
//    public ResultData<ReactionPoint> doHate("/usr/reactPoint/doHate") {
//		
//	}
//    
//    publi ResultData<ReactionPoint> doDelete("/usr/reactPoint/doDelete") {
//    	
//    }
	

}

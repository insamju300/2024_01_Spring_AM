package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CommentService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Comment;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrCommentController {
	
	@Autowired
	CommentService commentService;
	
	
	@PostMapping("/usr/comment/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String body, int articleId, @RequestParam(required = false) Integer parentId, @RequestParam(required = false)Integer originalParentId) {
		
//	    @Insert("INSERT INTO Comments (memberId, body, regDate, updateDate, articleId, parentId, originalParentId) " +
//	            "VALUES (#{memberId}, #{body}, NOW(), NOW(), #{articleId}, #{parentId}, #{originalParentId})")
//	    void insertComment(Comment comment);

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-1", "내용을 입력해 주세요.");
		}
		
		int memberId = rq.getLoginedMemberId();
		Comment comment = new Comment(memberId, body, articleId, parentId, originalParentId);

		ResultData<Integer> writeCommentRd = commentService.writeComent(comment);

		int id = (int) writeCommentRd.getData1();

		//todo 1. 없는 article id일 경우 튕겨내기.
		//todo 2. jsreplace가 아니라 현재 작성한 게시글 돌려주기 or 그냥 ok사인만 돌려주고 프론트에서 list 재요청 받기
		return Ut.jsReplace(writeCommentRd.getResultCode(), writeCommentRd.getMsg(), "../article/detail?id=" + articleId);

	}
	
	
	@RequestMapping("/usr/comment/list")
	@ResponseBody
	public List<Comment> showList(int articleId,
			@RequestParam(required = false) Integer  currentCommentId) {
		System.err.println("여기까진 잘 왔음" + articleId + "," + Ut.isEmpty(currentCommentId));
		//일단은 limit 10개만 받아서 그대로 return 하기
		int limit = 10;
		List<Comment> comments =  commentService.getRecentCommentsWithoutParentId(articleId, limit, currentCommentId);	
		return comments;
	}
}

package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReactionPointRepository;
import com.example.demo.vo.ReactionPoint;

@Service
public class ReactionPointService {
	
	@Autowired
	ReactionPointRepository reactionPointRepository;

	public ReactionPoint getReactionPointByMemberIdAndRelId(int memberId, int relId, String relTypeCode) {
		// TODO Auto-generated method stub
		return reactionPointRepository.getReactionPointByMemberIdAndRelId(memberId, relId, relTypeCode);
	}
	

}
